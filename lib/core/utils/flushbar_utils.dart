import 'package:another_flushbar/flushbar.dart';
import 'package:cartify/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlushBarUtils{
  FlushBarUtils._();
  /*showError start here*/
static void showError(BuildContext context,String message,{
  Color backgroundColor=Colors.red,
  IconData icon=Icons.error,
  }){
  Flushbar(
    duration: const Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.TOP,
    message: message,
    backgroundColor: backgroundColor,
    icon: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Icon(icon,color: AppColors.whiteColor,size: 20,),
    ),
    borderRadius: BorderRadius.circular(8),
    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
  ).show(context);

}
/*showError end here*/
/*showSuccess start here*/
  static void showSuccess(BuildContext context,String message,{
    Color backgroundColor=Colors.red,
    IconData icon=Icons.error,
  }){
    Flushbar(
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      message: message,
      backgroundColor: Colors.green,
      icon: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Icon(Icons.check_circle,color: AppColors.whiteColor,size: 20,),
      ),
      borderRadius: BorderRadius.circular(8),
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
    ).show(context);

  }
/*showSuccess end here*/
}