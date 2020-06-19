import 'package:ecommerce_app_ui_kit/src/core/models/brand.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/category.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/order.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/product.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/review.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/theme.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/user.dart';
import 'package:get_it/get_it.dart';
var locator = GetIt.I;
void setupGetIt(){
locator.registerLazySingleton(() => ProductsList());
locator.registerLazySingleton(() => CategoriesList());
locator.registerLazySingleton(() => OrderList());
locator.registerLazySingleton(() => SubCategoriesList());
locator.registerLazySingleton(() => ReviewsList());
locator.registerLazySingleton(() => User());
locator.registerLazySingleton(() => BrandsList());
// GetIt.I.registerLazySingleton(() => ProductService());
}