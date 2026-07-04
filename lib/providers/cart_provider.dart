import 'package:flutter/cupertino.dart';

import '../models/product_model.dart';

class CartProvider with ChangeNotifier{
  final List<ProductModel> _cartItems=[];
  List<ProductModel> get cartItems=>_cartItems;
  /*addToCart start here*/
void addToCart(ProductModel product){
  final index=_cartItems.indexWhere((item) => item.id==product.id);
  if(index>=0){
    _cartItems[index].qty++;
  }
  else{
    _cartItems.add(ProductModel(id: product.id, title: product.title, price: product.price,
        description: product.description, category: product.category, image: product.image, rating:product.rating),);
  }
  notifyListeners();
}
/*addToCart end here*/
/*isInCart start here*/
bool isInCart(int id)=>_cartItems.any((item) => item.id==id);
/*isInCart end here*/
/*increaseQty start here*/
void increaseQty(int id){
final index=_cartItems.indexWhere((item) => item.id==id);
if(index>=0){
  _cartItems[index].qty++;
  notifyListeners();
}
}
/*increaseQty end here*/
/*decreaseQty start here*/
  void decreaseQty(int id){
    final index=_cartItems.indexWhere((item) => item.id==id);
    if(index>=0){
      if(_cartItems[index].qty>1){
        _cartItems[index].qty--;
      }
      else{
        _cartItems.removeAt(index);
      }
      notifyListeners();
    }
  }
/*decreaseQty end here*/
/*removeFromCart start here*/
void removeFromCart(int id){
_cartItems.removeWhere((item) => item.id==id);
notifyListeners();
}
/*removeFromCart end here*/
/*subTotal start here*/
double get subTotal=>_cartItems.fold(0.0, (sum, item) => sum +(item.price*item.qty));
/*subTotal end here*/
/*deliveryCharges start here*/
double get deliveryCharges=>_cartItems.isEmpty?0:10.0;
/*deliveryCharges end here*/
/*total start here*/
double get total=>subTotal + deliveryCharges;
/*total end here*/
}