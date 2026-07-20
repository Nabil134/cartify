import 'package:cartify/core/utils/app_colors.dart';
import 'package:cartify/core/utils/app_images.dart';
import 'package:cartify/widgets/custom_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/utils/app_string.dart';
import '../core/utils/focus_utils.dart';
import '../providers/login_provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.read<LoginProvider>();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
/*first portion start here*/
Container(
  height: MediaQuery.of(context).size.height*0.35,
  width: double.infinity,
  decoration: BoxDecoration(
    color: AppColors.primaryColor,
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
    ),
  ),
  child: SafeArea(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
//AppLogo
    Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          shape: BoxShape.circle,
        ),
        child:Image.asset(AppImages.logo,color: AppColors.primaryColor),
    ),
          SizedBox(height: 16,),
          Text(AppStrings.appName.tr(),style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Theme.of(context).textTheme.bodyLarge?.color,
            letterSpacing: 1,
          ),),
          const SizedBox(height: 6,),
          Text(AppStrings.shopSmarterLiveBetter.tr(),style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
          //  color: Colors.white.withOpacity(0.8),
            color: Theme.of(context).textTheme.bodyLarge?.color!.withOpacity(0.8),

          ),),
    ],),
  ),
),
          /*first portion end here*/
          /*second portion start here*/
          Padding(
            padding: const EdgeInsets.symmetric( horizontal: 20,
              vertical: 24,),
            child: Form(
              key: loginProvider.formKey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Center(
                child: Text(AppStrings.welcomeBack.tr(),style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),),
              ),
                const SizedBox(height: 6,),
                Center(
                  child: Text(AppStrings.loginToYourAccountToContinue.tr(),style: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 13,
                  ),),
                ),
                const SizedBox(height: 32),
                Text(AppStrings.email.tr(),style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: AppColors.greyColor,
                ),),
                const SizedBox(height: 8,),
                CustomTextField(
                  focusNode: loginProvider.emailFocus,
                  onFieldSubmitted: (_) => FocusUtils.changeFocusField(context, loginProvider.emailFocus, loginProvider.passwordFocus),
                  controller: loginProvider.emailController,
                  validator: loginProvider.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  hintText: AppStrings.emailHintText.tr(),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10,),
                Text(AppStrings.password.tr(),style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: AppColors.greyColor,
                ),),
                const SizedBox(height: 8,),
                CustomTextField(
                  focusNode: loginProvider.passwordFocus,
                  onFieldSubmitted: (_) => FocusUtils.changeFocusField(context, loginProvider.passwordFocus, null),
                  validator: loginProvider.validatePassword,
                  controller: loginProvider.passwordController,
                  suffixIcon: loginProvider.isPasswordHidden?Icons.visibility:Icons.visibility_off,
                  onSuffixIconTap: () => loginProvider.togglePassword(),
                  obscureText: loginProvider.isPasswordHidden,
                  hintText: AppStrings.passwordHintText.tr(),
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 12,),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(AppStrings.forgetPassword.tr(),style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: AppColors.redColor,
                  ),),
                ),
                const SizedBox(height: 12,),
                InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap:(){
if(loginProvider.formKey.currentState!.validate()){
  loginProvider.login(context);
}
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child:loginProvider.isLoading?SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ): Text(AppStrings.login.tr(),style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),),
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                    AppStrings.doNotHaveAnAccount.tr(),
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.greyColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      AppStrings.register.tr(),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],),
              ],),),
          ),
          /*second portion end here*/
        ],),
      ),
    );
  }
}
