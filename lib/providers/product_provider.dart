import 'package:cartify/services/product_service.dart';
import 'package:flutter/cupertino.dart';

import '../core/network/api_status.dart';
import '../models/product_model.dart';

class ProductProvider with ChangeNotifier{
ProductProvider(){
  fetchProducts();
}
final ProductService _productService = ProductService();
List<ProductModel> _products=[];
List<ProductModel> get products=>_products;
Status  _status =Status.idle;
Status get status=>_status;
String _error="";
String get error=>_error;
/*fetchProducts start here*/
  Future<void> fetchProducts() async {
_status=Status.loading;
notifyListeners();
debugPrint("Fetch Started");
try{
final response = await _productService.getProducts();
print("Response:$response");
_products= response;
_status= Status.completed;
debugPrint("Products:$_products");
notifyListeners();
}
catch(e){
  final message=e.toString().replaceAll("Exception:", "").trim();
  debugPrint("Error:$message");
  _status =Status.error;
  _error=message;
  notifyListeners();
}
  }
/*fetchProducts end here*/
String _searchQuery="";
String get searchQuery=>_searchQuery;
/*searchProducts start here*/
void searchProducts(String value){
  _searchQuery = value;
  notifyListeners();
}
/*searchProducts end here*/
final TextEditingController searchController = TextEditingController();
/*filteredProducts start here*/
List<ProductModel> get filteredProducts{
  if(_searchQuery.isEmpty){
    return _products;
  }
  return _products.where((product) => product.title.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
}
/*filteredProducts end here*/
  final List<String> sizes=["S", "M", "L", "XL", "2XL"];
  int _selectedIndex=0;
  int get selectedIndex=>_selectedIndex;
  /*selectSize start here*/
  void selectSize(int index){
    _selectedIndex = index;
    notifyListeners();
  }
  /*selectSize end here*/
  String get selectedSize=>sizes[_selectedIndex];
  /*resetSize start here*/
  void resetSize(){
    _selectedIndex=0;
    notifyListeners();
  }
  /*resetSize end here*/
  bool _isExpanded=false;
  bool get isExpanded=>_isExpanded;
  /*toggleDescription start here*/
  void toggleDescription(){
    _isExpanded=!_isExpanded;
    notifyListeners();
  }
  /*toggleDescription end here*/
  /*toggleDescription start here*/
  void resetToggleDescription(){
    _isExpanded=false;
    notifyListeners();
  }
  /*toggleDescription end here*/
  /*clearSearchController start here*/
  void clearSearchController(){
    searchController.clear();
    _searchQuery="";
    notifyListeners();
  }
  /*clearSearchController end here*/
@override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}