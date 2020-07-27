import 'dart:math';
import 'package:ecommerce_app_ui_kit/services/api_response.dart';
import 'package:ecommerce_app_ui_kit/models/product.dart';
import 'package:ecommerce_app_ui_kit/services/network_data_url.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:json_annotation/json_annotation.dart';
part 'order.g.dart';

enum OrderState { unpaid, toBeShipped, shipped, inDispute }

class Track {
  int id;
  String description;
  String currentLocation;
  DateTime dateTime;

  Track(this.id, this.description, this.currentLocation, this.dateTime);

  // static List<Track> getTrackingList() {
  //   return [
  //     // new Track('Your Order in local post', 'United State',
  //     //     DateTime.now().subtract(Duration(days: 1))),
  //     // new Track('Your Order arrived in destination', 'United State',
  //     //     DateTime.now().subtract(Duration(days: 5))),
  //     // new Track('Order in aeroport', 'France',
  //     //     DateTime.now().subtract(Duration(days: 8))),
  //     // new Track('Your order oversea in china', 'China',
  //     //     DateTime.now().subtract(Duration(days: 10))),
  //   ];
//   }
}

class ProductOrder {
  int id;
  String name;
  int quantity;
  String price;
  ProductOrder(this.id, this.name, this.price, this.quantity);
}

@JsonSerializable()
class Order {
  int id;
  Product product;
  int quantity;
  String trackingNumber;
  DateTime dateTime =
      DateTime.now().subtract(Duration(days: Random().nextInt(20)));
  OrderState orderState;
  // Track tracking;
  Order(
      this.id,
      this.product,
      this.trackingNumber,
      this.orderState,
      // this.tracking,
      this.quantity);
  factory Order.fromJson(dynamic order) => Order(
        order['id'],
        order['line_items'],

        order['number'],
        order['status'] == 'completed'
            ? OrderState.shipped
            : OrderState.inDispute,
        // Track(1,'','',DateTime.now().subtract(Duration(days: 1))),
        10,
      );
  getDateTime() {
    return DateFormat('yyyy-MM-dd HH:mm').format(this.dateTime);
  }
}

class OrderList with ChangeNotifier {
  List<Order> _list;
  bool isFetched = false;
  List<Order> get list => _list;
  NetworkWoocommerce network = NetworkWoocommerce();
  ApiResponse _apiResponse;
  Future<void> getOrders() async {
    String orders = 'orders';
    _apiResponse = await network.getData(orders);
    setLoading(true);
    setError(_apiResponse.error);
    print(_apiResponse.data);
    if (!_apiResponse.error) {
      _apiResponse.data.forEach((order) {
        addOrderList(Order.fromJson(order));
      });
      setLoading(false);
    } else
      throw Exception(_apiResponse.errorMsg);
  }

  void setLoading(value) {
    isFetched = value;
    notifyListeners();
  }

  bool error;
  String errorMsg;
  int isIdCategory;

  void setError(value) {
    error = value;
    notifyListeners();
  }

  bool isError() {
    return error;
  }

  void setErrorMsg(value) {
    errorMsg = value;
    notifyListeners();
  }

  String isErrorMsg() {
    return errorMsg;
  }

  bool isLoading() {
    return isFetched;
  }

  void addOrderList(Order item) {
    if (!_list.contains(item)) _list.add(item);

    notifyListeners();
  }

  int get itemCount {
    return _list.length == null ? 0 : _list.length;
  }

  OrderList() {
    this._list = [];
  }
}
