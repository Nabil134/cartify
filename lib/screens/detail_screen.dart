import 'package:cartify/core/utils/app_colors.dart';
import 'package:cartify/core/utils/app_images.dart';
import 'package:cartify/core/utils/app_string.dart';
import 'package:cartify/core/utils/snackbar_utils.dart';
import 'package:cartify/models/product_model.dart';
import 'package:cartify/providers/product_provider.dart';
import 'package:cartify/screens/cart_screen.dart';
import 'package:cartify/widgets/custom_circle_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class DetailScreen extends StatelessWidget {
   DetailScreen({super.key,required this.product});
   final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final productProvider= context.watch<ProductProvider>();
    final cartProvider= context.watch<CartProvider>();
    return SafeArea(
      child: Scaffold(
        /*bottomNavigationBar start here*/
        bottomNavigationBar: InkWell(
          onTap: (){
            final isInCart= cartProvider.isInCart(product.id);
            if(isInCart){
              SnackBarUtils.show(context, "${product.title} ${AppStrings.alreadyInCart.tr()}");
            }
            else{
              cartProvider.addToCart(product);
              SnackBarUtils.show(context, "${product.title} ${AppStrings.addToCart.tr()}",backgroundColor: AppColors.primaryColor );
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height*0.1,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Center(
              child: Text(AppStrings.addToCart.tr(),style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ),
        ),
        /*bottomNavigationBar end here*/
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            /*first portion start here*/
            Container(
              height: MediaQuery.of(context).size.height*0.4,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
CustomCircleIcon(imagePath: AppImages.arrowBack,onTap: (){
  Navigator.pop(context);
},),
                    InkWell(
                      borderRadius: BorderRadius.circular(45),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),),);
                      },
                      child: Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F6FA),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(AppImages.cart),
                            if(cartProvider.cartItems.length>0)
                              Positioned(top: -6, right: -6, child: Container(
                                constraints: BoxConstraints(
                                  minHeight: 18,
                                  minWidth: 18,
                                ),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.redColor,
                                ),
                                child:Center(child: Text(cartProvider.cartItems.length.toString(),style:  Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),),
                              ),
                              ),
                          ],
                        ),
                      ),
                    ),
                ],),
              ),
            ),
            /*first portion end here*/
            /*second portion start here*/
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(product.category.toLowerCase(),style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),),
                    ),
                    Text(AppStrings.price.tr(),style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyColor
                    ),),
                  ],),
                  /*third portion start here*/
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.category,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),),
                      Text("\$${product.price}",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),),
                    ],),
                  /*third portion end here*/
                  const SizedBox(height: 16),
                  /*four portion start here*/
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star_rounded,color: Colors.amber,
                          size: 18,
                        ),
                        const SizedBox(width: 4,),
                        Text("${product.rating.rate}",style:  TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.amber,
                        ),),
                        const SizedBox(width: 4,),
                        Text("(${product.rating.count}  ${AppStrings.reviews.tr()})",style:  TextStyle(
                          fontSize: 12,
                          color: AppColors.greyColor,
                        ),),
                      ],
                    ),
                  ),
                  /*four portion end here*/
                  const SizedBox(height: 10,),
                  /*four portion start here*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(product.image,height: 70,width: 70,),
                    ),),
                  ),
                  /*four portion end here*/
                  const SizedBox(height: 10,),
                  /*five portion start here*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.size.tr(),style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),),
                      Text(AppStrings.sizeGuide.tr(),style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyColor,
                      ),),
                    ],),
                  /*five portion end here*/
                  const SizedBox(height: 10,),
                  /*six portion start here*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(productProvider.sizes.length, (index){
                      final isSelected=productProvider.selectedIndex==index;
                      return GestureDetector(
                        onTap: (){
                          productProvider.selectSize(index);
                        },
                        child: AnimatedContainer(
                          alignment: Alignment.center,
                          duration: const Duration(milliseconds: 250),
                          height: 58,
                          width: 58,
                          decoration: BoxDecoration(
                            color: isSelected?AppColors.primaryColor:Color(0xffF7F7FA),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(productProvider.sizes[index],style:  Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: isSelected?Color(0xffF7F7FA):AppColors.primaryColor,

                          ),),
                        ),
                      );
                    }),),
                  /*six portion end here*/
                  const SizedBox(height: 10,),
                  /*seven portion start here*/
                  Text(AppStrings.description.tr(),style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),),
                  /*seven portion end here*/
                  const SizedBox(height: 10,),
                  /*eight portion start here*/
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.description,
                        maxLines: productProvider.isExpanded?null:1,
                        overflow: productProvider.isExpanded?null:TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyColor,
                        ),),
                      TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStatePropertyAll(Colors.transparent),
                          splashFactory: NoSplash.splashFactory,
                        ),
                        onPressed: (){
                          productProvider.toggleDescription();
                        }, child: Text(productProvider.isExpanded?AppStrings.readLess.tr():AppStrings.readMore.tr(),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: AppColors.primaryColor,
                        ),
                      ),),
                    ],
                  ),
                  /*eight portion end here*/
                ],
              ),
            ),
            /*second portion end here*/

          ],),
        ),
      ),
    );
  }
}
