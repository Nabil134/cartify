import 'package:cartify/routes/routes_name.dart';
import 'package:cartify/screens/bottom_navigation_screen.dart';
import 'package:cartify/views/login_view.dart';
import 'package:cartify/views/splash_view.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  AppRoutes._();
  /*generateRoute start here*/
static Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case RoutesName.splash:
      return MaterialPageRoute(builder: (context) => SplashView(),);
    case RoutesName.login:
      return MaterialPageRoute(builder: (context) => LoginView(),);
    case RoutesName.bottom:
      return MaterialPageRoute(builder: (context) => BottomNavigationScreen(),);
    default:
      return MaterialPageRoute(builder: (context) => Center(child: Text("No Route Found"),),);
  }
  }
/*generateRoute end here*/
}