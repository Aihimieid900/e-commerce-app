import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/l10n/App_Localizations.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app_ui_kit/config/app_config.dart' as config;

const kStyleTextNoItem = TextStyle(
  fontSize: 18.0,
);
LinearGradient kGradientColor(BuildContext context) => LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Theme.of(context).accentColor.withOpacity(0.3),
          Theme.of(context).accentColor.withOpacity(0.09),
        ]);
InputDecoration kInputDecoration(BuildContext context) => InputDecoration(
      contentPadding: EdgeInsets.all(12),
      hintText: AppLocalizations.of(context).translate("search"),
      hintStyle:
          TextStyle(color: Theme.of(context).focusColor.withOpacity(0.8)),
      prefixIcon:
          Icon(UiIcons.loupe, size: 20, color: Theme.of(context).hintColor),
      border: UnderlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
    );
final kThemeDarkData = ThemeData(
  fontFamily: 'Poppins',
  primaryColor: Color(0xFF252525),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xFF2C2C2C),
  accentColor: config.Colors().mainDarkColor(1),
  hintColor: config.Colors().secondDarkColor(1),
  focusColor: config.Colors().accentDarkColor(1),
  textTheme: TextTheme(
    button: TextStyle(color: Color(0xFF252525)),
    headline1:
        TextStyle(fontSize: 20.0, color: config.Colors().secondDarkColor(1)),
    headline4: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: config.Colors().secondDarkColor(1)),
    headline3: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: config.Colors().secondDarkColor(1)),
    headline2: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w700,
        color: config.Colors().mainDarkColor(1)),
    headline5: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w300,
        color: config.Colors().secondDarkColor(1)),
    subtitle1: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
        color: config.Colors().secondDarkColor(1)),
    headline6: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: config.Colors().mainDarkColor(1)),
    bodyText1:
        TextStyle(fontSize: 12.0, color: config.Colors().secondDarkColor(1)),
    bodyText2: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: config.Colors().secondDarkColor(1)),
    caption:
        TextStyle(fontSize: 12.0, color: config.Colors().secondDarkColor(0.7)),
  ),
);
final kThemeLightData = ThemeData(
  fontFamily: 'Poppins',
  primaryColor: Colors.white,
  brightness: Brightness.light,
  accentColor: config.Colors().mainColor(1),
  focusColor: config.Colors().accentColor(1),
  hintColor: config.Colors().secondColor(1),
  textTheme: TextTheme(
    button: TextStyle(color: Colors.white),
    headline5: TextStyle(fontSize: 20.0, color: config.Colors().secondColor(1)),
    headline4: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: config.Colors().secondColor(1)),
    headline3: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: config.Colors().secondColor(1)),
    headline2: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w700,
        color: config.Colors().mainColor(1)),
    headline1: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w300,
        color: config.Colors().secondColor(1)),
    subtitle1: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
        color: config.Colors().secondColor(1)),
    headline6: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: config.Colors().mainColor(1)),
    bodyText1: TextStyle(fontSize: 12.0, color: config.Colors().secondColor(1)),
    bodyText2: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: config.Colors().secondColor(1)),
    caption: TextStyle(fontSize: 12.0, color: config.Colors().secondColor(0.6)),
  ),
);
