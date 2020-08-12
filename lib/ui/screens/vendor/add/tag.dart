import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/helpers/style/constants.dart';
import 'package:ecommerce_app_ui_kit/l10n/App_Localizations.dart';
import 'package:ecommerce_app_ui_kit/ui/widgets/widget_enter/customInput.dart';
import 'package:flutter/material.dart';

class TagAddScreen extends StatefulWidget {
  @override
  _TagAddScreenState createState() => _TagAddScreenState();
}

class _TagAddScreenState extends State<TagAddScreen> {
  TextEditingController controllerNameProduct;

  @override
  Widget build(BuildContext context) {
    var modelLang = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(modelLang.translate("add_tag"))),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: <Widget>[
            CustomInput(
              textField: TextField(
                controller: controllerNameProduct,
                decoration: kInputDecoration(context).copyWith(
                  hintText: modelLang.translate('name_category'),
                  prefixIcon: Icon(UiIcons.id_card),
                ),
              ),
            ),
            CustomInput(
              textField: TextField(
                controller: controllerNameProduct,
                decoration: kInputDecoration(context).copyWith(
                  hintText: modelLang.translate('description'),
                  prefixIcon: Icon(Icons.money_off),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
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
        ), // TextField(decoration: kInputDecoration(context),)
      ),
    );
  }
}
