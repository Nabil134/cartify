import 'package:cartify/core/network/api_endpoints.dart';
import 'package:cartify/core/network/errors/api_exception.dart';
import 'package:cartify/core/network/network_api_service.dart';
import 'package:cartify/models/login_models.dart';
import 'package:dio/dio.dart';

class LoginService{
  final NetworkApiService _apiService = NetworkApiService(baseUrl: ApiEndPoints.baseUrl);
  /*login start here*/
Future<LoginResponseModel> login({required String email,required String password}) async {
  try{
    final response = await _apiService.post(ApiEndPoints.login,
        data: {
          "email":email,
          "password":password,
        }
    );
    return LoginResponseModel.fromJson(response);
  }
catch(e){
    throw Exception(e.toString(),);
}
}

/*login end here*/
}