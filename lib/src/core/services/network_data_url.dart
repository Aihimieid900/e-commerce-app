import 'package:dio/dio.dart';
import 'package:ecommerce_app_ui_kit/src/core/services/api_response.dart';


const String site = 'https://monaviss.com/wp-json/wc/v3/';
const String key = 'ck_13b8cd383b97f91b2a26a7f5e24d983d6ceff9ff';
const String sec = 'cs_3a06e978a52a6f1964271a3fe3c4579262b00eb2';
const Map<String, dynamic> headers = {
  'consumer_key': key,
  'consumer_secret': sec,
};

class NetworkWoocommerce {
  Dio dio = Dio();
  Response response;
 Future<ApiResponse> getData(String path) async {
    try {
      response = await dio.get('$site$path', queryParameters: headers);
      if (response.statusCode == 200) {
        var getData = response.data;
        return ApiResponse(data: getData);
      }
      return ApiResponse(error: true, errorMsg: response.statusMessage);
    } on DioError catch (e) {
      return ApiResponse(error: true, errorMsg: e.message);
    }
  }


  Future<dynamic> postData(String path) async {
    response = await dio.post('$site$path', queryParameters: headers);
    if (response.statusCode == 200) {
      var getData = response.data;
      return getData;
    } else {
      return response.statusMessage;
      // throw Exception('error getting weather for location');
    }
  }
}
