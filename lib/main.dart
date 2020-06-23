import 'package:ecommerce_app_ui_kit/config/app_config.dart' as config;
import 'package:ecommerce_app_ui_kit/route_generator.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/theme.dart';
import 'package:ecommerce_app_ui_kit/src/core/services/locators.dart';
import 'package:ecommerce_app_ui_kit/src/core/services/providers/provider.dart';
import 'package:ecommerce_app_ui_kit/src/helpers/style/constants.dart';
import 'package:ecommerce_app_ui_kit/src/ui/screens/Splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
setupGetIt();
Provider.debugCheckInvalidValueType = null;
runApp(
  ChangeNotifierProvider<ThemeChanger>(
        create: (_) => ThemeChanger(true),
        child: MyApp(),
      ),);
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var _theme = context.watch<ThemeChanger>();
    return ProviderForAllApp(
          child: MaterialApp(
        title: 'Restaurant Flutter UI',
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        theme:_theme.getTheme() ?kThemeDarkData:kThemeLightData  ,
        home: SplashScreen(),
    ),
    );
  }
}
