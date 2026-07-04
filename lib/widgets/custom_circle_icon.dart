import 'package:flutter/material.dart';

class CustomCircleIcon extends StatelessWidget {
  const CustomCircleIcon({
    super.key,
    this.onTap,
    required this.imagePath,
    this.backgroundColor = const Color(0xffF7F7FA),
  });

  final VoidCallback? onTap;
  final String imagePath;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            width: 22,
            height: 22,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}