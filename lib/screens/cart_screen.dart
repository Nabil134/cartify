import 'package:cartify/core/utils/app_images.dart';
import 'package:cartify/core/utils/app_string.dart';
import 'package:cartify/providers/cart_provider.dart';
import 'package:cartify/widgets/cart_icon_btn.dart';
import 'package:cartify/widgets/custom_circle_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/utils/app_colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider= context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: CustomCircleIcon(
            onTap: (){
              Navigator.pop(context);
            },
            imagePath: AppImages.arrowBack,
          ),
        ),
        title: Text(AppStrings.cart.tr(),style: Theme.of(context).appBarTheme.titleTextStyle,),
      ),
      /*bottomNavigationBar start here*/
      bottomNavigationBar: cartProvider.cartItems.isEmpty?null: Container(
        height: MediaQuery.of(context).size.height*0.1,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
        ),
        child: Center(
          child: Text(AppStrings.checkOut.tr(),style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),),
        ),
      ),
      /*bottomNavigationBar end here*/
      body: cartProvider.cartItems.isEmpty?Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 60,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 20,),
            Text(
              AppStrings.yourCartIsEmpty.tr(),
              style:
              Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 8,),
            Text(
              AppStrings.addItemsToGetStarted.tr(),
              style:
              Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ):
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            /*first portion start here*/
            Expanded(
              child: ListView.separated(shrinkWrap: true,
                  itemBuilder:(context, index) {
                final item = cartProvider.cartItems[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6FA),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F6FA),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(item.image,fit: BoxFit.contain,),
                      ),
                    ),
                    const SizedBox(width: 14,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                          item.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "\$${item.price.toStringAsFixed(2)}",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryColor,
                          ),
                        ),
const SizedBox(height: 14,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CartIconBtn(onTap: (){
                                    cartProvider.decreaseQty(item.id);
                                  }, icon: Icons.keyboard_arrow_down_sharp),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      "${item.qty}",
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                        fontSize: 13,
                                        fontWeight:
                                        FontWeight.w600,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                  CartIconBtn(onTap: (){
                                    cartProvider.increaseQty(item.id);
                                  }, icon: Icons.keyboard_arrow_up),
                                ],
                              ),
                              CartIconBtn(onTap: (){
                                cartProvider.removeFromCart(item.id);
                              }, icon: Icons.delete,),
                            ],
                          ),
                      ],),
                    ),
                  ],),
                );
              }, separatorBuilder: (context, index) => SizedBox(height: 10,), itemCount:cartProvider.cartItems.length),
            ),
            /*first portion end here*/
            const SizedBox(height: 5,),
            /*second portion start here*/
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6FA),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.subTotal.tr(),
                        style:Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        "\$${cartProvider.subTotal}",
                        style:Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Divider(),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.deliveryCharges.tr(),
                        style:Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        "\$${cartProvider.deliveryCharges}",
                        style:Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Divider(),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.total.tr(),
                        style:Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        "\$${cartProvider.total}",
                        style:Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),
                ],
              ),
            ),

            /*second portion end here*/
          ],
        ),
      ),
    );
  }
}
