import 'package:ecommerce_app_ui_kit/models/brand.dart';
import 'package:ecommerce_app_ui_kit/models/category.dart';
import 'package:ecommerce_app_ui_kit/models/order.dart';
import 'package:ecommerce_app_ui_kit/models/product.dart';
import 'package:ecommerce_app_ui_kit/models/review.dart';
import 'package:ecommerce_app_ui_kit/models/theme.dart';
import 'package:ecommerce_app_ui_kit/models/user.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/Products.dart';
import 'package:get_it/get_it.dart';

import 'check_connection.dart';

var locator = GetIt.I;
void setupGetIt() {
  locator.registerLazySingleton(() => CheckConnection());
  locator.registerLazySingleton(() => ProductsList());
  locator.registerLazySingleton(() => CategoriesList());
  locator.registerLazySingleton(() => OrderList());
  locator.registerLazySingleton(() => SubCategoriesList());
  locator.registerLazySingleton(() => ReviewsList());
  locator.registerLazySingleton(() => User());
  locator.registerLazySingleton(() => BrandsList());
// GetIt.I.registerLazySingleton(() => ProductService());
}
