import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class LocaleProvider with ChangeNotifier{
 Locale _locale= const Locale("en");
 Locale get locale=>_locale;
 String get languageCode=>_locale.languageCode;
 /*changeLanguage start here*/
Future<void> changeLanguage(BuildContext context,String code) async {
_locale =  Locale(code);
await context.setLocale(_locale);
notifyListeners();
}
/*changeLanguage end here*/
}