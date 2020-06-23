import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/src/helpers/lang/en_ES.dart';
import 'package:ecommerce_app_ui_kit/src/helpers/style/constants.dart';
import 'package:ecommerce_app_ui_kit/src/ui/widgets/SearchBarWidget.dart';
import 'package:ecommerce_app_ui_kit/src/ui/widgets/widget_enter/customInput.dart';
import 'package:flutter/material.dart';

class ProductAddScreen extends StatefulWidget {
  @override
  _ProductAddScreenState createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(lngNamePageAddProduct)),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: <Widget>[
            CustomInput(
              decoration: kInoutDecoration(context).copyWith(
                  hintText: lngNameProduct, prefixIcon: Icon(UiIcons.id_card)),
            ),
          ],
        ), // TextField(decoration: kInoutDecoration(context),)
      ),
    );
  }
}
