import 'package:cartify/screens/cart_screen.dart';
import 'package:cartify/screens/fav_screen.dart';
import 'package:cartify/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';

class NavProvider with ChangeNotifier{
  int _currentIndex=0;
  int get  currentIndex=>_currentIndex;
  List<Widget> get pages=>[
    HomeScreen(),
    FavScreen(),
    CartScreen(),
    Center(child: Text("Profile")),
  ];
  /*changeIndex start here*/
void changeIndex(int index){
_currentIndex=index;
notifyListeners();
}
/*changeIndex end here*/
 bool _isDrawerOpen=false;
 bool get isDrawerOpen=>_isDrawerOpen;
  /*changeIndex start here*/
  void setDrawerState(bool value){
    _isDrawerOpen= value;
    notifyListeners();
  }
/*changeIndex end here*/

}