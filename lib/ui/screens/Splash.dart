import 'dart:async';
import 'dart:io';

import 'package:ecommerce_app_ui_kit/models/brand.dart';
import 'package:ecommerce_app_ui_kit/models/category.dart';
import 'package:ecommerce_app_ui_kit/models/order.dart';
import 'package:ecommerce_app_ui_kit/models/product.dart';
import 'package:ecommerce_app_ui_kit/services/check_connection.dart';
import 'package:ecommerce_app_ui_kit/services/locators.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/home.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/vendor/add/product.dart';
import 'package:ecommerce_app_ui_kit/ui/widgets/LoadingPlaced2item.dart';
import 'package:ecommerce_app_ui_kit/ui/widgets/Network_Error.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  // CategoriesList get _categoriesList => locator<CategoriesList>();
  // // CategoriesList get _subCategoriesList => locator<SubCategoriesList>();
  // ProductsList get _productsList => locator<ProductsList>();
  // BrandsList get _brandsList => locator<BrandsList>();
  // OrderList get _orderList => locator<OrderList>();
  CheckConnection get _checkConnection => locator<CheckConnection>();
  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacementNamed('/Tabs', arguments: 2);
  }

  @override
  Widget build(BuildContext context) {
    _checkConnection.checkConnection();
    var haveInternetOrNO = Provider.of<CheckConnection>(context).internet;
    return Scaffold(
      body: Container(
        // decoration: new BoxDecoration(color: Colors.white),
        child: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  image: AssetImage('img/logoApp.png'),
                  width: MediaQuery.of(context).size.width - 50,
                  height: 250),
              // LoadingPlace2or1Item(),
            ],
          ),
        ),
      ),
    );
  }
}
