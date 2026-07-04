import 'package:cartify/core/utils/app_images.dart';
import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cartify/core/utils/app_string.dart';

import '../core/utils/app_colors.dart';

class LanguageDialog{
/*show start here*/
static show(BuildContext context){
  return showDialog(context: context, builder:(context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      title: Column(children: [
        const SizedBox(height: 20,),
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child:Image.asset(AppImages.logo,color: AppColors.primaryColor),
        ),
        const SizedBox(height: 20,),
        Text(AppStrings.changeLanguage.tr(),style: TextStyle(
          fontSize: 18,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),),
        const SizedBox(height: 4,),
      ],),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        LanguageTile(value: "en", countryCode: "US", title:AppStrings.english.tr(),),
        const SizedBox(height: 10,),
        LanguageTile(value: "ur", countryCode: "PK", title:AppStrings.urdu.tr(),),
        const SizedBox(height: 10,),
        LanguageTile(value: "ar", countryCode: "SA", title:AppStrings.arabic.tr(),),

      ],),
    );
  },);

}
/*show end here*/
}
/*LanguageTile start here*/
class LanguageTile extends StatelessWidget {
  final String value;
  final String countryCode;
  final String title;
  const LanguageTile({super.key,required this.value,required this.countryCode,required this.title});

  @override
  Widget build(BuildContext context) {
    final bool isSelected=context.locale.languageCode==value;
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () async {
        Navigator.pop(context);
await context.setLocale(Locale(value),);
      },
      child: AnimatedContainer(
        padding:const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
      duration:const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: isSelected?AppColors.primaryColor.withOpacity(0.08):Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected?AppColors.primaryColor:Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Row(children: [
          //Country Flag
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CountryFlag.fromCountryCode(countryCode,height: 28,width: 40,),),
          const SizedBox(width: 12,),
          //Language Name
          Expanded(child: Text(title,style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: isSelected?AppColors.primaryColor:Theme.of(context).textTheme.bodyLarge!.color,
          ),),),
          //Radio Button
          Radio<String>(value: value, groupValue: context.locale.languageCode, onChanged: (val) async {
            Navigator.pop(context);
await context.setLocale(Locale(val!),);

          },),
        ],),
    ),
    );
  }
}

/*LanguageTile end here*/