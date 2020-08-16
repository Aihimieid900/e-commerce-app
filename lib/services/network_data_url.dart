import 'package:dio/dio.dart';
import 'package:ecommerce_app_ui_kit/services/api_response.dart';

const String site = 'https://sa-munafis.com/wp-json/';
const String key = 'ck_bf08ed09cb20cb3b1468f62187de9ea9e3e7be15';
const String sec = 'cs_65a36ed1bf27f9d1e68dd30e0080dc6f120eb3fb';
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
        return ApiResponse(data: getData, error: false, errorMsg: '');
      }
      return ApiResponse(error: true, errorMsg: response.statusMessage);
    } catch (e) {
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
