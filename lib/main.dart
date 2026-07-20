import 'package:cartify/core/navigation/navigation_service.dart';
import 'package:cartify/core/utils/app_string.dart';
import 'package:cartify/providers/cart_provider.dart';
import 'package:cartify/providers/locale_provider.dart';
import 'package:cartify/providers/login_provider.dart';
import 'package:cartify/providers/nav_provider.dart';
import 'package:cartify/providers/product_provider.dart';
import 'package:cartify/providers/splash_provider.dart';
import 'package:cartify/providers/theme_provider.dart';
import 'package:cartify/routes/routes.dart';
import 'package:cartify/routes/routes_name.dart';
import 'package:cartify/services/firebase_api.dart';
import 'package:cartify/services/notification_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'firebase_options.dart';
import 'providers/fav_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 await EasyLocalization.ensureInitialized();
  await FirebaseApi.initNotifications();
  await NotificationService.init();

  runApp(
    EasyLocalization(child:  MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => LoginProvider(),),
      ChangeNotifierProvider(create: (context) => SplashProvider(),),
      ChangeNotifierProvider(create: (context) => NavProvider(),),
      ChangeNotifierProvider(create: (context) => ProductProvider(),),
      ChangeNotifierProvider(create: (context) => ThemeProvider(),),
      ChangeNotifierProvider(create: (context) => CartProvider(),),
      ChangeNotifierProvider(create: (context) => FavProvider(),),
      ChangeNotifierProvider(create: (context) => LocaleProvider(),),

    ],child: MyApp(),
    ),
         supportedLocales:const [
           Locale('en'),
           Locale('ur'),
           Locale('ar'),
         ], path: "assets/translations",
      fallbackLocale: const Locale("en"),
      startLocale: const Locale("en"),
      saveLocale: true,
      useOnlyLangCode: true,
    ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider= Provider.of<ThemeProvider>(context);
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName.tr(),
      themeMode: themeProvider.themeMode,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      initialRoute: RoutesName.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

