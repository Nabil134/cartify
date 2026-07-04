import 'package:cartify/core/utils/app_colors.dart';
import 'package:cartify/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,this.controller,this.validator,this.hintText,
    this.textInputAction,this.focusNode,this.keyboardType,
    this.suffixIcon,this.onSuffixIconTap,
    this.obscureText=false,
    this.onFieldSubmitted,
  });
 final TextEditingController? controller;
  final String? Function(String?)? validator;
 final String? hintText;
  final TextInputAction? textInputAction;
final  FocusNode? focusNode;
 final  TextInputType? keyboardType;
  final IconData? suffixIcon;
  final void Function()? onSuffixIconTap;
  final bool obscureText;
 final  void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return   TextFormField(
      obscureText:obscureText ,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      controller: controller,
      validator:validator ,
      focusNode: focusNode,
      decoration: InputDecoration(
        filled: true,
        fillColor: themeProvider.isDarkMode?  Color(0xFF3A3A3A): Color(0xffF7F7FA),
        suffixIcon: suffixIcon!=null?InkWell(
          onTap: onSuffixIconTap,
          child: Icon(suffixIcon,color: AppColors.primaryColor,),
        ):null,
hintText: hintText,
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(12),
        //   borderSide: BorderSide(
        //     color: AppColors.primaryColor,
        //     width: 1.5,
        //   ),
        // ),
        errorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
