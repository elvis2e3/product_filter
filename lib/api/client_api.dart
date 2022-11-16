import 'package:dio/dio.dart';
import 'package:product_filter/models/filtered_data.dart';

class ApiClient{

  final String GET = "GET";
  final String POST = "POST";
  final String PUT = "PUT";
  final String DELETE = "DELETE";

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://api.mercadolibre.com/"
    )
  );

  Future<CustomResponse> validationRequest({
    required String typeRequest,
    required String url,
    Map body = const {},
    Map<String, String> headers = const {}
  }) async {
    try{
      late Response response;
      if(typeRequest == GET){
        response = await _dio.get(
          url,
          options: Options(
            headers: headers,
          )
        );
      }else if(typeRequest == POST){
        response = await _dio.post(
          url,
          data: body,
          options: Options(
            headers: headers,
          )
        );
      }else if(typeRequest == PUT){
        response = await _dio.put(
          url,
          data: body,
          options: Options(
            headers: headers,
          )
        );
      }else if(typeRequest == DELETE){
        response = await _dio.delete(
          url,
          options: Options(
            headers: headers,
          )
        );
      }
      if(response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 204){
        return CustomResponse(true, response.data);
      }
      return CustomResponse(false, {});
    }catch(error){
      return CustomResponse(false, {});
    }
  }

  Future<CustomResponse> getProducts(String search) async {

    CustomResponse response = await validationRequest(
      typeRequest: GET,
      url: "sites/MLU/search?q=${search}#json",
    );
    if(response.status){
      return CustomResponse(
        true,
        FilteredData.fromJson(response.data)
      );
    }
    return response;
  }

}

class CustomResponse{
  final _data;
  final bool _status;

  CustomResponse(this._status, this._data);

  get data{
    return _data;
  }
  bool get status{
    return _status;
  }
}
