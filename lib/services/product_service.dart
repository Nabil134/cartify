import 'package:cartify/core/network/api_endpoints.dart';

import '../core/network/network_api_service.dart';
import '../models/product_model.dart';

class ProductService{
  final NetworkApiService _apiService = NetworkApiService(baseUrl: ProductApiEndPoints.baseUrl);
  /*getProducts start here*/
Future<List<ProductModel>> getProducts() async{
try{
  final response = await _apiService.get(ProductApiEndPoints.products);
  return (response as List).map((e) => ProductModel.fromJson(e)).toList();
}
   catch(e){
  throw Exception(e.toString(),);
   }
}
/*getProducts end here*/
}