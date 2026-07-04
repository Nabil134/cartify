import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_images.dart';
import '../core/utils/app_string.dart';

class LogoutDialog{
  /*show start here*/
  static Future<void> show(
      BuildContext context, {
        required Color color,
        VoidCallback? onLogout,
        VoidCallback? onCancel,
      }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          title:   Column(
            children: [
              const SizedBox(height: 24,),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  shape: BoxShape.circle,
                ),
                child:Image.asset(AppImages.logo,color: AppColors.primaryColor),
              ),
              const SizedBox(height: 16,),
              Text(
                AppStrings.logout.tr(),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          content: Text(
            textAlign: TextAlign.center,
            AppStrings.areYouWantToLogout.tr(),
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
          actions: [
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStatePropertyAll(Colors.transparent),
                splashFactory: NoSplash.splashFactory,
              ),
              onPressed:
                      onCancel,
              child: Text(
                AppStrings.cancel.tr(),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith( fontSize: 15, fontWeight: FontWeight.w400, color: color,
              ),
            ),
            ),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStatePropertyAll(Colors.transparent),
                splashFactory: NoSplash.splashFactory,
              ),
              onPressed: onLogout,
              child:  Text(
                AppStrings.logout.tr(),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.redColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
  /*show end here*/
}