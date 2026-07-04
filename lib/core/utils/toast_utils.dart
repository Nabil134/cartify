import 'package:cartify/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils{
  ToastUtils._();
  /*show start here*/
static void show(BuildContext context,String message,{
  Color backgroundColor=AppColors.blackColor,
  Color textColor=AppColors.whiteColor,
  ToastGravity gravity = ToastGravity.BOTTOM,
  }){
final fToast = FToast()..init(context);
fToast.showToast(
  gravity: gravity,
  child: Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      message,style: TextStyle(color: textColor,

    ),),),);
}
/*show end here*/
}