import 'package:cartify/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CartIconBtn extends StatelessWidget {
  const CartIconBtn({super.key,required this.onTap,required this.icon});
  final void Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap:onTap ,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.primaryColor,
          ),
        ),
        child: Icon(icon,size: 20,color: AppColors.primaryColor,),
      ),
    );
  }
}
