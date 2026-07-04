import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';

class CustomMenuItem extends StatelessWidget {
  const CustomMenuItem({
    super.key,
    required this.title,
    required this.icon,
    this.color,
    this.onTap,
  });
  final String title;
  final IconData icon;
  final Color? color;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final itemColor = color ?? Theme.of(context).textTheme.bodyLarge?.color;
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      title: Text(title,style:Theme.of(context).textTheme.headlineMedium!.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: itemColor,
      ),),
      leading: Icon(icon , color: itemColor),
    );
  }
}
