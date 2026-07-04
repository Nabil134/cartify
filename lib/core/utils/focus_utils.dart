import 'package:flutter/cupertino.dart';

class FocusUtils{
  /*changeFocusField start here*/
  static void changeFocusField(BuildContext context,FocusNode currentFocus, FocusNode? nextFocus){
    currentFocus.unfocus();
    if(nextFocus!=null){
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }
  /*changeFocusField end here*/
}