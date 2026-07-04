import 'package:cartify/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key,required this.hintText,this.controller,this.onChanged});
  final String hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return TextFormField(
      onChanged:onChanged,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: AppColors.greyColor,
      ),
        prefixIcon: Icon(Icons.search,color: AppColors.greyColor,size: 22,),
        filled: true,
        fillColor: themeProvider.isDarkMode?  Color(0xFF3A3A3A): Color(0xffF7F7FA),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 1.2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 1.2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 1.2,
          ),
        ),
      ),
    );
  }
}



