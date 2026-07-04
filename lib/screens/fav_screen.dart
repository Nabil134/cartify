import 'package:cartify/core/utils/app_colors.dart';
import 'package:cartify/providers/fav_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/utils/app_images.dart';
import '../core/utils/app_string.dart';
import '../widgets/custom_circle_icon.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favProvider= context.watch<FavProvider>();
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
        title: Text(AppStrings.wishlist.tr(),style: Theme.of(context).appBarTheme.titleTextStyle,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: favProvider.favItems.isEmpty?Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.favorite_border_outlined,
                  size: 60,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                AppStrings.yourFavIsEmpty.tr(),
                style:
                Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 8,),
              Text(
                AppStrings.addItemsToFavorites.tr(),
                style:
                Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ):GridView.builder(
          shrinkWrap: true,
          itemCount: favProvider.favItems.length,
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.6,
          ), itemBuilder: (context, index) {
          final items= favProvider.favItems[index];
          return Column(
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
                            favProvider.removeFavorite(items.id);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.favorite,color: AppColors.redColor,size: 18,),
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
                "\$${items.price.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ),
            ],);
        },),
      ),
    );
  }
}
