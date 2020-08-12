import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/helpers/style/constants.dart';
import 'package:ecommerce_app_ui_kit/l10n/App_Localizations.dart';
import 'package:ecommerce_app_ui_kit/ui/widgets/widget_enter/customInput.dart';
import 'package:flutter/material.dart';

class ProductAddScreen extends StatefulWidget {
  @override
  _ProductAddScreenState createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  TextEditingController controllerNameProduct;
  @override
  Widget build(BuildContext context) {
    var modelLang = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 2,
          title: Text(modelLang.translate('add_product'))),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomInput(
                textField: TextField(
                  controller: controllerNameProduct,
                  decoration: kInputDecoration(context).copyWith(
                    hintText: modelLang.translate('name_product'),
                    prefixIcon: Icon(UiIcons.id_card),
                  ),
                ),
              ),
              CustomInput(
                textField: TextField(
                  controller: controllerNameProduct,
                  decoration: kInputDecoration(context).copyWith(
                    hintText: modelLang.translate('price_product'),
                    prefixIcon: Icon(Icons.attach_money),
                  ),
                ),
              ),
              CustomInput(
                textField: TextField(
                  controller: controllerNameProduct,
                  decoration: kInputDecoration(context).copyWith(
                    hintText: modelLang.translate('sale_price_product'),
                    prefixIcon: Icon(Icons.money_off),
                  ),
                ),
              ),
              CustomInput(
                textField: TextField(
                  controller: controllerNameProduct,
                  decoration: kInputDecoration(context).copyWith(
                    hintText: modelLang.translate('start_sale_date_product'),
                    prefixIcon: Icon(Icons.date_range),
                  ),
                ),
              ),
              CustomInput(
                textField: TextField(
                  controller: controllerNameProduct,
                  decoration: kInputDecoration(context).copyWith(
                    hintText: modelLang.translate('end_sale_date_product'),
                    prefixIcon: Icon(Icons.date_range),
                  ),
                ),
              ),
              CustomInput(
                textField: TextField(
                  controller: controllerNameProduct,
                  decoration: kInputDecoration(context).copyWith(
                    hintText: modelLang.translate('code_product'),
                    prefixIcon: Icon(UiIcons.id_card),
                  ),
                ),
              ),
              CustomInput(
                textField: TextField(
                  controller: controllerNameProduct,
                  decoration: kInputDecoration(context).copyWith(
                    hintText: modelLang.translate('indvidual_product'),
                    prefixIcon: Icon(Icons.looks_one),
                  ),
                ),
              ),
              CustomInput(
                textField: TextField(
                  controller: controllerNameProduct,
                  decoration: kInputDecoration(context).copyWith(
                    hintText: modelLang.translate('avaliable'),
                    prefixIcon: Icon(Icons.looks_one),
                  ),
                ),
              ),
              CustomInput(
                textField: TextField(
                  controller: controllerNameProduct,
                  decoration: kInputDecoration(context).copyWith(
                    hintText: modelLang.translate('short_description'),
                    prefixIcon: Icon(Icons.short_text),
                  ),
                ),
              ),
              CustomInput(
                textField: TextField(
                  controller: controllerNameProduct,
                  decoration: kInputDecoration(context).copyWith(
                    hintText: modelLang.translate('description'),
                    prefixIcon: Icon(Icons.description),
                  ),
                ),
              ),
              CustomInput(
                textField: TextField(
                  controller: controllerNameProduct,
                  decoration: kInputDecoration(context).copyWith(
                    hintText: modelLang.translate('category'),
                    prefixIcon: Icon(Icons.category),
                  ),
                ),
              ),
              CustomInput(
                textField: TextField(
                  controller: controllerNameProduct,
                  decoration: kInputDecoration(context).copyWith(
                    hintText: modelLang.translate('tag'),
                    prefixIcon: Icon(Icons.tab),
                  ),
                ),
              ),
              CustomInput(
                textField: TextField(
                  controller: controllerNameProduct,
                  decoration: kInputDecoration(context).copyWith(
                    hintText: modelLang.translate('image'),
                    prefixIcon: Icon(Icons.photo),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 5),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  child: FlatButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(vertical: 14),
                    color: Theme.of(context).accentColor,
                    shape: StadiumBorder(),
                    child: Text(
                      'Save',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ), // TextField(decoration: kInputDecoration(context),)
      ),
    );
  }
}
