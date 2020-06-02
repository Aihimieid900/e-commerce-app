import 'dart:math';

import 'package:ecommerce_app_ui_kit/src/models/user.dart';
import 'package:ecommerce_app_ui_kit/src/services/network.dart';
// import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

class Review {
  int id;
  User user;
  String review;
  dynamic rate;
  DateTime dateTime =
      DateTime.now().subtract(Duration(days: Random().nextInt(20)));

  Review(this.id, this.user, this.review, this.rate);

  getDateTime() {
    return DateFormat('yyyy-MM-dd HH:mm').format(this.dateTime);
  }

  factory Review.fromJson(dynamic product) {
    return Review(
      product['id'],
      User.basic(product['reviewer'], product['reviewer_avatar_urls']['48'],
          UserState.available),
      product['review'],
      product['rating'],
    );
  }
}

class ReviewsList {
  Future<List<Review>> getReview(int idProduct) async {
    String path = 'products/reviews?poduct[0]["items"]=[$idProduct]';
    Network network = Network(path: path);
    print(idProduct);
    var reviewProductData = await network.getData();
    reviewProductData.forEach((review) {
      if (review['id'] == reviewsList.asMap().containsKey(review['id']))
        return _reviewsList;
      else
        _reviewsList.add(Review.fromJson(review));
    });
    return _reviewsList;
  }

  List<Review> _reviewsList;

  List<Review> get reviewsList => _reviewsList;
  set reviewsList(List<Review> value) {
    _reviewsList = value;
    //  notifyListeners();
  }

  ReviewsList() {
    this._reviewsList = [
      // new Review(
      // new User.basic('Maria R. Garza', 'img/user0.jpg', UserState.available),
      // 'There are a few foods that predate colonization, and the European colonization of the Americas brought about the introduction of a large number of new ingredients',
      // 3.2),
      // new Review(
      //     new User.basic('George T. Larkin', 'img/user1.jpg', UserState.available),
      //     'There are a few foods that predate colonization, and the European colonization of the Americas brought about the introduction of a large number of new ingredients',
      //     3.2),
      // new Review(
      //     new User.basic('Edward E. Linn', 'img/user3.jpg', UserState.available),
      //     'There are a few foods that predate colonization, and the European colonization of the Americas brought about the introduction of a large number of new ingredients',
      //     3.2),
      // new Review(
      //     new User.basic('George T. Larkin', 'img/user0.jpg', UserState.available),
      //     'There are a few foods that predate colonization, and the European colonization of the Americas brought about the introduction of a large number of new ingredients',
      //     3.2),
      // new Review(new User.basic('Laurie Z. Bergeron', 'img/user1.jpg', UserState.available),
      //     'There are a few foods that predate colonization, and the European colonization of the Americas brought', 3.2)
    ];
  }
}
