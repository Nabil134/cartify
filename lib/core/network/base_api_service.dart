abstract class BaseApiService{
  Future<dynamic> get (String endpoint,{
    Map<String,dynamic>? queryParameters,
  });
  Future<dynamic> post(String endpoint,{
    dynamic data,
    Map<String,dynamic>? queryParameters,
  });
}