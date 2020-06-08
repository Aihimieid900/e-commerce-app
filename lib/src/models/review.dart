import 'dart:math';

import 'package:ecommerce_app_ui_kit/src/models/user.dart';
import 'package:ecommerce_app_ui_kit/src/services/network.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
// import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:json_annotation/json_annotation.dart';

// part 'review.g.dart';
@JsonSerializable()
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

class ReviewsList with ChangeNotifier {
  NetworkWoocommerce get network => GetIt.I<NetworkWoocommerce>();

  Future<void> getReview(int idProduct) async {
    print(idProduct);
    String reviewID = 'products/reviews?poduct[0]["items"]=[$idProduct]';
    var reviewProductData = await network.getData(reviewID);
    removeAll();
    reviewProductData.forEach((review) {
      addReviewsList(Review.fromJson(review));
    });
  }
  List<Review> _reviewsList;
  List<Review> get reviewsList => _reviewsList;
  void addReviewsList(Review item) {
    _reviewsList.add(item);
    notifyListeners();
  }
  void removeAll() {
    _reviewsList.clear();
    notifyListeners();
  }
int reviewCount(){
  // return _reviewsList.length;
  return _reviewsList.length == null ? 0 : _reviewsList.length;
}
  ReviewsList() {
    this._reviewsList = [
    ];
  }
}
