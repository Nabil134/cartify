import 'package:cartify/core/utils/app_images.dart';
import 'package:cartify/providers/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashProvider>().checkLogin(context);

    });
    return Scaffold(
      backgroundColor:Theme.of(context).primaryColor,
      body: Center(child: Image.asset(AppImages.logo),),
    );
  }
}
