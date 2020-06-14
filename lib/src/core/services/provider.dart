import 'package:ecommerce_app_ui_kit/src/core/models/category.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/order.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/product.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/review.dart';
// import 'package:ecommerce_app_ui_kit/src/core/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderForAllApp extends StatelessWidget {
  final Widget child;
  ProviderForAllApp({this.child});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProductsList>(
          create: (_) => ProductsList(),
          dispose: (_, ProductsList provider) => provider.dispose(),
        ),
        Provider<ReviewsList>(
          create: (_) => ReviewsList(),
          dispose: (_, ReviewsList provider) => provider.dispose(),
        ),
        Provider<CategoriesList>(
          create: (_) => CategoriesList(),
          dispose: (_, CategoriesList provider) => provider.dispose(),
        ),
        Provider<SubCategoriesList>(
          create: (_) => SubCategoriesList(),
          dispose: (_, SubCategoriesList provider) => provider.dispose(),
        ),
        Provider<OrderList>(
          create: (_) => OrderList(),
          dispose: (_, OrderList provider) => provider.dispose(),
        ),
      ],
      child: child,
    );
  }
}
