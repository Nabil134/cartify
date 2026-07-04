import 'package:cartify/providers/login_provider.dart';
import 'package:cartify/routes/routes_name.dart';
import 'package:cartify/services/shared_pref_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashProvider with ChangeNotifier {
  /*checkLogin start here*/
  Future<void> checkLogin(BuildContext context) async {
    final isLoggedIn=await SharedPrefService.isLoggedIn();
    await Future.delayed(const Duration(seconds: 3),() async {
      final loginProvider= Provider.of<LoginProvider>(context,listen: false);
      await loginProvider.loadUser();
      if (!context.mounted) return;
      if(isLoggedIn){
        Navigator.pushReplacementNamed(context, RoutesName.bottom);
      }
      else{
        Navigator.pushReplacementNamed(context, RoutesName.login);
      }
    });

  }
/*checkLogin end here*/
}