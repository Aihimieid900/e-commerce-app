import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
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


  Future<dynamic> getData(String path) async {
      response = await dio.get('$site$path', queryParameters: headers);
    if (response.statusCode == 200) {
      var getData = response.data;
      return getData;
    } else {
      return response.statusMessage;
      // throw Exception('error getting weather for location');
    }
  }

  Future<dynamic> postData(String path) async {
    response = await dio.post('$site$path', queryParameters: headers);
    if (response.statusCode == 200) {
      var getData = response.data;
      return getData;
    } else {
      return response.isRedirect;
      // throw Exception('error getting weather for location');
    }
  }
}

// if (product['on_sale']) {
//   Product itemSale = Product(
//
//      _listProducts.add(itemSale);
// } else {
//   Product itemNormal = Product(
//       product['id'],
//       product['name'],
//       product['stock_status'],
//       product['stock_quantity'],
//       product['price'],
//       product['stock_quantity'],
//       product['total_sales'],
//       product['rating_count'],
//       product['sale_price']);
//   //    products.add(itemNormal);
//   //   print(products);

// }
