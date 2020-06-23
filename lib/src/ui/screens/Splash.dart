import 'dart:async';

import 'package:ecommerce_app_ui_kit/src/core/models/brand.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/category.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/order.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/product.dart';
import 'package:ecommerce_app_ui_kit/src/core/services/locators.dart';
import 'package:ecommerce_app_ui_kit/src/ui/screens/home.dart';
import 'package:ecommerce_app_ui_kit/src/ui/screens/vendor/add/product.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  CategoriesList get _categoriesList => locator<CategoriesList>();
  // CategoriesList get _subCategoriesList => locator<SubCategoriesList>();
  ProductsList get _productsList => locator<ProductsList>();
  BrandsList get _brandsList => locator<BrandsList>();
  OrderList get _orderList => locator<OrderList>();
  @override
  void initState() {
    super.initState();
    //     _categoriesList.getCategories();
    // _productsList.getProducts();
    // _brandsList.getTags();
    // _orderList.getOrders();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 5),
      () => Navigator.of(context).pushReplacementNamed('/AddProduct'),
    );
    var assetsImage = new AssetImage(
        'img/logoApp.png'); //<- Creates an object that fetches an image.
    var image = new Image(
        image: assetsImage,
        height: 250); //<- Creates a widget that displays an image.

    return Container(
      decoration: new BoxDecoration(color: Colors.white),
      child: new Center(
        child: image,
      ),
    );
  }
}
