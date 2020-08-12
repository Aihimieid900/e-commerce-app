import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/helpers/style/constants.dart';
import 'package:ecommerce_app_ui_kit/l10n/App_Localizations.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).hintColor.withOpacity(0.10),
              offset: Offset(0, 4),
              blurRadius: 10)
        ],
      ),
      child: Stack(
        alignment: AppLocalizations.of(context).locale.languageCode == "ar"
            ? Alignment.centerLeft
            : Alignment.centerRight,
        children: <Widget>[
          TextField(
            decoration: kInputDecoration(context),

            // ),
          ),
          IconButton(
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            icon: Icon(UiIcons.settings_2,
                size: 20, color: Theme.of(context).hintColor.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
