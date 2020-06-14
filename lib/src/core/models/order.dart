import 'dart:math';
import 'package:ecommerce_app_ui_kit/src/core/services/api_response.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/product.dart';
import 'package:ecommerce_app_ui_kit/src/core/services/network_data_url.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:json_annotation/json_annotation.dart';

enum OrderState { unpaid, toBeShipped, shipped, inDispute }

class Track {
  int id;
  String description;
  String currentLocation;
  DateTime dateTime;

  Track(this.id, this.description, this.currentLocation, this.dateTime);

  static List<Track> getTrackingList() {
    return [
      // new Track('Your Order in local post', 'United State',
      //     DateTime.now().subtract(Duration(days: 1))),
      // new Track('Your Order arrived in destination', 'United State',
      //     DateTime.now().subtract(Duration(days: 5))),
      // new Track('Order in aeroport', 'France',
      //     DateTime.now().subtract(Duration(days: 8))),
      // new Track('Your order oversea in china', 'China',
      //     DateTime.now().subtract(Duration(days: 10))),
    ];
  }
}

// @JsonSerializable()
class Order {
  int id;
  Product product;
  int quantity;
  String trackingNumber;
  DateTime dateTime =
      DateTime.now().subtract(Duration(days: Random().nextInt(20)));
  OrderState orderState;
  List<Track> tracking = Track.getTrackingList();

  Order(this.id, this.product, this.trackingNumber, this.orderState);
  factory Order.fromJson(dynamic order) => Order(
        order['id'],
        order['line_items'].forEach((json) {
          Product(
              json['product_id'],
              json['name'],
              json['description'] ?? '',
              '',
              json['quantity'] as int,
              json['total'] as String,
              json['quantity'] as int,
              json['quantity'] as int,
              '',
              1,
              like: false);
        }),
        order['order_key'],
        order['status'] == 'completed' ? OrderState.shipped : '',
      );
  getDateTime() {
    return DateFormat('yyyy-MM-dd HH:mm').format(this.dateTime);
  }
}

class OrderList with ChangeNotifier {
  List<Order> _list;
  bool isFetched = false;
  List<Order> get list => _list;
  NetworkWoocommerce  network =NetworkWoocommerce();
  ApiResponse _apiResponse;
  Future<void> getOrders() async {
    setLoading(true);
    String orders = 'orders';
    _apiResponse= await network.getData(orders);
    setLoading(false);
    _apiResponse.data.forEach((order) {
      addOrderList(Order.fromJson(order));
    });
  }

  void setLoading(value) {
    isFetched = value;
    notifyListeners();
  }

  bool isLoading() {
    return isFetched;
  }

  void addOrderList(Order item) {
    _list.add(item);
  
    notifyListeners();
  }

  OrderList() {
    this._list = [];
  }
}
