import 'package:cartify/core/utils/app_colors.dart';
import 'package:cartify/core/utils/app_images.dart';
import 'package:cartify/core/utils/app_string.dart';
import 'package:cartify/providers/fav_provider.dart';
import 'package:cartify/providers/locale_provider.dart';
import 'package:cartify/providers/login_provider.dart';
import 'package:cartify/providers/nav_provider.dart';
import 'package:cartify/providers/product_provider.dart';
import 'package:cartify/providers/theme_provider.dart';
import 'package:cartify/screens/cart_screen.dart';
import 'package:cartify/screens/detail_screen.dart';
import 'package:cartify/screens/fav_screen.dart';
import 'package:cartify/widgets/custom_logout_dialog.dart';
import 'package:cartify/widgets/language_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../core/network/api_status.dart';
import '../providers/cart_provider.dart';
import '../widgets/custom_circle_icon.dart';
import '../widgets/custom_menu_item.dart';
import '../widgets/custom_search_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider=context.watch<ProductProvider>();
    final loginProvider = Provider.of<LoginProvider>(context);
    final user= loginProvider.user;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final favProvider = Provider.of<FavProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    return SafeArea(
      child: Scaffold(
        onDrawerChanged: (isOpened) {
          context.read<NavProvider>().setDrawerState(isOpened);
        },
        extendBody: true,
        /*drawer start here*/
        drawer: Drawer(
          backgroundColor:themeProvider.isDarkMode?AppColors.whiteColor:AppColors.blackColor,
          child: SafeArea(child: Column(children: [
/*drawerHeader start here*/
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
Align(
  alignment: Alignment.topRight,
  child:   InkWell(
    onTap: (){
      Navigator.pop(context);
    },
    child:   Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        shape: BoxShape.circle,),
      child: Icon(Icons.close,
        color: AppColors.whiteColor,
        size: 18,
      ),
    ),
  ),
),
                  const SizedBox(height: 20,),
                  //ProFileImage
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.whiteColor,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white24,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: (user?.image?.isNotEmpty??false)?Image.network(user!.image!,height: 70,width: 70,fit:BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(Icons.person,color: AppColors.whiteColor,size: 40,),
                        ):
                        Icon(Icons.person,color: AppColors.whiteColor,size: 40,),
                      ),
                    ),
                  ),
                  //ProFileImage
                  const SizedBox(height: 12,),
                  Text(loginProvider.fullName.isEmpty?AppStrings.guestUser.tr():loginProvider.fullName,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4,),
                  Row(children: [
                    Text(AppStrings.verifiedProfile.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 4,),
                 const   Icon(
                      Icons.verified,
                      size: 20,
                      color: Colors.green,
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text("${cartProvider.cartItems.length} ${AppStrings.order.tr()}" , style:
                      Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor,
                      ),),
                    ),
                  ],),
              ],),
            ),
            /*drawerHeader end here*/
            const SizedBox(height: 8,),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                /*DarkMode*/
                Row(children: [
                  Container(
                    padding:EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(themeProvider.isDarkMode?Icons.dark_mode:Icons.wb_sunny_outlined,
                        color: themeProvider.isDarkMode?AppColors.blackColor:AppColors.whiteColor,),),
                  SizedBox(width: 14,),
                  Expanded(
                    child: Text(AppStrings.darkMode.tr(),style:  Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                        color: themeProvider.isDarkMode?AppColors.blackColor:AppColors.whiteColor
                    ),),
                  ),
                  Spacer(),
                  Switch(
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      themeProvider.toggleTheme(value);
                    },
                    activeColor: AppColors.blackColor,
                    inactiveThumbColor: AppColors.whiteColor,
                    activeTrackColor: AppColors.blackColor,
                    inactiveTrackColor:AppColors.whiteColor,
                  ),
                ],),
                /*DarkMode*/
                  /*DrawerItems start here*/
                  CustomMenuItem(
                    color: themeProvider.isDarkMode?AppColors.blackColor:AppColors.whiteColor,
                    icon: Icons.info,
                    title: AppStrings.accountInfo.tr(),
                  ),
                  CustomMenuItem(
                    color: themeProvider.isDarkMode?AppColors.blackColor:AppColors.whiteColor,
                    icon: Icons.lock_outline,
                    title: AppStrings.password.tr(),
                  ),
                  CustomMenuItem(
                    color: themeProvider.isDarkMode?AppColors.blackColor:AppColors.whiteColor,
                    icon: Icons.shopping_cart_outlined,
                    title: AppStrings.order.tr(),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),),);
                    },
                  ),
                  CustomMenuItem(
                    color: themeProvider.isDarkMode?AppColors.blackColor:AppColors.whiteColor,
                    icon: Icons.credit_card_outlined,
                    title: AppStrings.myCard.tr(),
                  ),
                  CustomMenuItem(
                    color: themeProvider.isDarkMode?AppColors.blackColor:AppColors.whiteColor,
                    icon: Icons.favorite_border_outlined,
                    title: AppStrings.wishlist.tr(),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FavScreen(),),);
                    },
                  ),
                  CustomMenuItem(
                    color: themeProvider.isDarkMode?AppColors.blackColor:AppColors.whiteColor,
                    icon: Icons.settings,
                    title: AppStrings.settings.tr(),
                  ),
                  CustomMenuItem(
                    color: themeProvider.isDarkMode?AppColors.blackColor:AppColors.whiteColor,
                    icon: Icons.language,
                    title: AppStrings.changeLanguage.tr(),
                    onTap: (){
                      Navigator.pop(context);
                     Future.delayed(Duration(milliseconds: 250),()=>LanguageDialog.show(context),);
                    },
                  ),
                  CustomMenuItem(
                    onTap: (){
                      Navigator.pop(context);
                     LogoutDialog.show(context, color: themeProvider.isDarkMode?AppColors.whiteColor:AppColors.blackColor,
                       onCancel: (){
                       Navigator.pop(context);
                       },
                       onLogout: () {
                         loginProvider.logout(context);
                       },
                     );
                    },
                    color: AppColors.redColor,
                    icon: Icons.logout,
                    title: AppStrings.logout.tr(),
                  ),
                  /*DrawerItems end here*/
              ],),
            ),
          ],),),
        ),
        /*drawer end here*/
        body:   SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 14),
            child: Column(children: [
              /*first portion start here*/
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Builder(
                  builder: (context) {
                    return CustomCircleIcon(imagePath: AppImages.menu,onTap: (){
                      Scaffold.of(context).openDrawer();
                    },);
                  }
                ),
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
              /*first portion end here*/
              const SizedBox(height: 20,),
              /*second portion start here*/
             CustomSearchField(
               controller: productProvider.searchController,
               onChanged: (value) => productProvider.searchProducts(value),
               hintText: AppStrings.search.tr(),
             ),
              /*second portion end here*/
              const SizedBox(height: 10,),
              /*last portion start here*/
              Builder(builder: (context) {
                if(productProvider.status==Status.loading){
                  return GridView.builder(
                    itemCount: 6,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.6,
                  ), itemBuilder: (context, index) {
                    return Shimmer.fromColors(child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F6FA),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              // White circle heart top right
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 4,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 18,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 10,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          height: 10,
                          width: 80,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                    ],), baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,);
                  },);
                }
                if(productProvider.status==Status.error){
                  return Text(productProvider.error);
                }
                return GridView.builder(
                  shrinkWrap: true,
                    itemCount: productProvider.filteredProducts.length,
                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.6,
                ), itemBuilder: (context, index) {
                  final items= productProvider.filteredProducts[index];
                  return InkWell(
                    onTap: (){
                      productProvider.resetSize();
                      productProvider.clearSearchController();
                      productProvider.resetToggleDescription();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(product: items),),);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F6FA),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(children: [
                          SizedBox(
                            height:200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(items.image,
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF5F6FA),
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                      child: Center(child: Icon(Icons.image_not_supported,size: 40,color: AppColors.redColor,),),
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment:Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                color: AppColors.whiteColor,
                                shape: const CircleBorder(),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(50),
                                  onTap: (){
                                    favProvider.toggleFav(items);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 32,
                                    width: 32,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: favProvider.isFavorite(items.id)? Icon(Icons.favorite,color: AppColors.redColor,size: 18,):
                                    Icon(Icons.favorite_border_outlined,size: 18,color: AppColors.greyColor,),
                                  ),
                                ),
                              ),
                            ),),
                        ],),
                      ),
                      SizedBox(height: 8,),
                      Text(
                        items.title,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "\$${items.price}",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],),
                  );
                },);
              },),
              /*last portion end here*/
            ],),
          ),
        ),
      ),
    );
  }
}

