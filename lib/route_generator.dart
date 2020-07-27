import 'package:ecommerce_app_ui_kit/models/route_argument.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/Products.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/Splash.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/brand.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/brands.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/cart.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/categories.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/category.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/chat.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/checkout.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/checkout_done.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/help.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/languages.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/on_boarding.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/orders.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/product.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/signin.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/signup.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/tabs.dart';
import 'package:ecommerce_app_ui_kit/ui/screens/vendor/add/product.dart';
import 'package:flutter/material.dart';

import 'ui/screens/vendor/add/category.dart';
import 'ui/screens/vendor/add/tag.dart';

// import 'src/ui/screens/splash.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/onBoarding':
        return MaterialPageRoute(builder: (_) => OnBoardingWidget());
      case '/SignUp':
        return MaterialPageRoute(builder: (_) => SignUpWidget());
      case '/SignIn':
        return MaterialPageRoute(builder: (_) => SignInWidget());
      case '/Categories':
        return MaterialPageRoute(builder: (_) => CategoriesWidget());
      case '/Orders':
        return MaterialPageRoute(builder: (_) => OrdersWidget());
      case '/Brands':
        return MaterialPageRoute(builder: (_) => BrandsWidget());
      case '/Chat':
        return MaterialPageRoute(builder: (_) => ChatWidget());
      case '/Products':
        return MaterialPageRoute(builder: (_) => ProductsWidget());
//      case '/MobileVerification':
//        return MaterialPageRoute(builder: (_) => MobileVerification());
//      case '/MobileVerification2':
//        return MaterialPageRoute(builder: (_) => MobileVerification2());
      case '/Tabs':
        return MaterialPageRoute(
            builder: (_) => TabsWidget(
                  currentTab: args,
                ));
      case '/Category':
        return MaterialPageRoute(
            builder: (_) =>
                CategoryWidget(routeArgument: args as RouteArgument));
      case '/Brand':
        return MaterialPageRoute(
            builder: (_) => BrandWidget(routeArgument: args as RouteArgument));
      case '/Product':
        return MaterialPageRoute(
            builder: (_) =>
                ProductWidget(routeArgument: args as RouteArgument));
//      case '/Food':
//        return MaterialPageRoute(
//            builder: (_) => FoodWidget(
//              routeArgument: args as RouteArgument,
//            ));
      case '/Cart':
        return MaterialPageRoute(builder: (_) => CartWidget());
      case '/Checkout':
        return MaterialPageRoute(builder: (_) => CheckoutWidget());
      case '/CheckoutDone':
        return MaterialPageRoute(builder: (_) => CheckoutDoneWidget());
      case '/Help':
        return MaterialPageRoute(builder: (_) => HelpWidget());
      case '/Languages':
        return MaterialPageRoute(builder: (_) => LanguagesWidget());
      case '/AddProduct':
      // return MaterialPageRoute(builder: (_) => ProductAddScreen());
      case '/AddCategory':
      // return MaterialPageRoute(builder: (_) => CategoryAddScreen());
      case '/AddTag':
      // return MaterialPageRoute(builder: (_) => TagAddScreen());
//      case '/second':
//      // Validation of correct data type
//        if (args is String) {
//          return MaterialPageRoute(
//            builder: (_) => SecondPage(
//              data: args,
//            ),
//          );
//        }
//        // If args is not of the correct type, return an error page.
//        // You can also throw an exception while in development.
//        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
