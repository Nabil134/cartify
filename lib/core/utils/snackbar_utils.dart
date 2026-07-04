import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackBarUtils{
  /*show start here*/
  static void show(BuildContext context,String message,{
    Color backgroundColor = Colors.red,
    Color textColor = Colors.white,
    Duration duration = const Duration(seconds: 3),
  }){
    ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(
      backgroundColor: backgroundColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        content: Text(message,style: TextStyle(color: textColor),),),);
  }
  /*show end here*/
}