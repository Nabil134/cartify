import 'dart:convert';
import 'package:cartify/models/login_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

  class SharedPrefService{
  SharedPrefService._();
  static const String tokenKey="token";
  static const String userKey="user";
  static const String themeKey="isDarkMode";
  /*saveToken start here*/
  static Future<void> saveToken(String token) async {
  final prefs= await SharedPreferences.getInstance();
  await prefs.setString(tokenKey, token);
  }
/*saveToken end here*/
  /*getToken start here*/
  static Future<String?> getToken() async {
  final prefs= await SharedPreferences.getInstance();
  return prefs.getString(tokenKey);
  }
/*getToken end here*/
    /*removeUser start here*/
    static Future<void>  removeToken() async{
      final prefs= await SharedPreferences.getInstance();
      await prefs.remove(tokenKey);
    }
    /*removeUser end here*/
  /*isLoggedIn start here*/
  static Future<bool> isLoggedIn() async {
  final token = await getToken();
  return token != null && token.isNotEmpty;
  }
/*isLoggedIn end here*/
  /*saveUser start here*/
  static Future<void> saveUser(UserModel user) async{
    final prefs= await SharedPreferences.getInstance();
    await prefs.setString(userKey, jsonEncode(user.toJson(),),);
  }
  /*saveUser end here*/
    /*getUser start here*/
    static Future<UserModel?> getUser() async{
      final prefs= await SharedPreferences.getInstance();
      final data = prefs.getString(userKey);
      if(data==null) return null;
      return UserModel.fromJson(jsonDecode(data),);
    }
  /*getUser end here*/
  /*removeUser start here*/
 static Future<void>  removeUser() async{
   final prefs= await SharedPreferences.getInstance();
   await prefs.remove(userKey);
 }
  /*removeUser end here*/
  /*loadTheme start here*/
 static Future<bool>  loadTheme() async {
    final prefs= await SharedPreferences.getInstance();
    return prefs.getBool(themeKey)??false;
  }
  /*loadTheme end here*/
    /*loadTheme start here*/
    static Future<void>  saveTheme(bool isDarkMode) async {
      final prefs= await SharedPreferences.getInstance();
    await  prefs.setBool(themeKey, isDarkMode);
    }
  /*loadTheme end here*/
  }