import 'dart:developer';

import 'package:ecommerce_app_ui_kit/services/api_response.dart';
import 'package:ecommerce_app_ui_kit/services/network_data_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart' show DateFormat;

enum UserState { available, away, busy }

class User {
  String id = UniqueKey().toString();
  String name;
  String email;
  String gender;
  DateTime dateOfBirth;
  String avatar;
  String address;
  UserState userState;

  User.init();

  User.basic(this.name, this.avatar, this.userState);

  User.advanced(this.name, this.email, this.gender, this.dateOfBirth,
      this.avatar, this.address, this.userState);

  NetworkWoocommerce network = NetworkWoocommerce();
  Future<void> loginUser({String email, String password}) async {
    String customerPath = 'customers?email=$email&password=$password';
    log(customerPath);
    var userData = await network.getData(customerPath);
    print(userData);
  }

  User getCurrentUser() {
    return User.advanced(
        'Andrew R. Whitesides',
        'andrew@gmail.com',
        'Male',
        DateTime(1993, 12, 31),
        'img/user2.jpg',
        '4600 Isaacs Creek Road Golden, IL 62339',
        UserState.available);
  }

  getDateOfBirth() {
    return DateFormat('yyyy-MM-dd').format(this.dateOfBirth);
  }

  User() {}
}
