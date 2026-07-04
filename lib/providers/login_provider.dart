import 'package:cartify/core/utils/flushbar_utils.dart';
import 'package:cartify/core/utils/toast_utils.dart';
import 'package:cartify/models/login_models.dart';
import 'package:cartify/routes/routes_name.dart';
import 'package:cartify/services/login_service.dart';
import 'package:cartify/services/shared_pref_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier{
  final GlobalKey<FormState> formKey= GlobalKey<FormState>();
  UserModel? _user;
  UserModel? get user=>_user;
  String get fullName=>_user?.fullName??"";
  final LoginService _loginService = LoginService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus=FocusNode();
  final passwordFocus= FocusNode();
  bool _isLoading=false;
  bool get isLoading=>_isLoading;
  bool _isPasswordHidden=true;
  bool get isPasswordHidden=> _isPasswordHidden;
  LoginResponseModel? _loginResponse;
  LoginResponseModel? get loginResponse =>_loginResponse;
  /*validateEmail start here*/
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
      return "Enter valid email";
    }
    return null;
  }

  /*validateEmail end here*/
  /*validatePassword start here*/
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Password must be 6 characters";
    }
    return null;
  }

  /*validatePassword end here*/
  /*setLoading start here*/
  void setLoading(bool value){
_isLoading=value;
notifyListeners();
  }
  /*setLoading end here*/
  /*togglePassword start here*/
  void togglePassword(){
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }
  /*togglePassword end here*/
  /*login start here*/
 Future<bool>  login(BuildContext context) async {
    if(_isLoading) return false;
    setLoading(true);
    try{
    _loginResponse = await  _loginService.login(email: emailController.text.trim(), password: passwordController.text.trim(),);
    print(_loginResponse);
    if(_loginResponse!.token.isNotEmpty){
      debugPrint("Token:${_loginResponse!.token}");
      debugPrint("User:${_loginResponse!.data.fullName}");
     // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${_loginResponse!.message}"),),);
    //  SnackBarUtils.show(context, _loginResponse!.message,backgroundColor: Colors.green);
      await SharedPrefService.saveToken(_loginResponse!.token);
      await SharedPrefService.saveUser(_loginResponse!.data);
      _user = _loginResponse!.data;
      ToastUtils.show(context, _loginResponse!.message,backgroundColor: Colors.green);
      clearController();
      Navigator.pushNamed(context, RoutesName.bottom);
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${_loginResponse!.message}"),),);
     // SnackBarUtils.show(context, _loginResponse!.message,);
    }
    return true;
    }
        catch(e){
      final message= e.toString().replaceAll("Exception:", "");
      debugPrint("Login Failed $message");
     // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),),);
      FlushBarUtils.showError(context, message);
   //   SnackBarUtils.show(context, message);
      return false;

        }
        finally{
      setLoading(false);
        }
  }
  /*login end here*/
  /*clearController start here*/
  void clearController(){
    emailController.clear();
    passwordController.clear();
  }
   /*clearController end here*/
  /*loadUser start here*/
  Future<void> loadUser() async {
    _user = await SharedPrefService.getUser();
    notifyListeners();
  }
  /*loadUser end here*/
  /*logout start here*/
  Future<void> logout(BuildContext context) async {
   await  SharedPrefService.removeUser();
await SharedPrefService.removeToken();
_user=null;
notifyListeners();
if(!context.mounted) return;
   Navigator.pushNamedAndRemoveUntil(
     context,
     RoutesName.login,
         (route) => false,
   );
  }
  /*logout end here*/
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }
}