import 'package:cartify/core/network/errors/api_exception.dart';
import 'package:cartify/core/network/base_api_service.dart';
import 'package:cartify/core/network/dio_client.dart';
import 'package:cartify/core/network/network_info.dart';
import 'package:dio/dio.dart';

class NetworkApiService implements BaseApiService{
  NetworkApiService({required this.baseUrl});
  final String baseUrl;
  Dio get _dio=>DioClient.create(baseUrl: baseUrl);
  @override
  Future<dynamic> get(String endpoint,{
    Map<String,dynamic>? queryParameters,
  }) async {
    if(!NetworkInfo.isConnected){
      throw Exception("No Internet Connection");
    }
    try{
      final response= await _dio.get(endpoint,queryParameters: queryParameters);
      return response.data;
    }
    on DioException catch(e){
      throw Exception(ApiException.getMessage(e),);
    }
  }
  @override
  Future<dynamic> post(String endpoint, { dynamic data, Map<String, dynamic>? queryParameters}) async{
    if(!NetworkInfo.isConnected){
      throw Exception("No Internet Connection");
    }
    try{
      final response = await _dio.post(endpoint,data: data,queryParameters: queryParameters);
      return response.data;
    }
   on DioException catch(e){
      throw Exception(ApiException.getMessage(e),);
   }
  }

}