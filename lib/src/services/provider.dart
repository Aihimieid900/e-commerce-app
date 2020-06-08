import 'package:ecommerce_app_ui_kit/src/models/category.dart';
import 'package:ecommerce_app_ui_kit/src/models/product.dart';
import 'package:ecommerce_app_ui_kit/src/models/review.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderForAllApp extends StatelessWidget {
  final Widget child;
  ProviderForAllApp({this.child});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsList(),
        ),
        ChangeNotifierProvider(
          create: (_) => ReviewsList(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoriesList(),
        ),
        ChangeNotifierProvider(
          create: (_) => SubCategoriesList(),
        ),

      ],
      child: child,
    );
  }
}
