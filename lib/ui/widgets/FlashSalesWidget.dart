import 'dart:async';

import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/l10n/App_Localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

class FlashSalesHeaderWidget extends StatefulWidget {
  @override
  _FlashSalesHeaderWidgetState createState() => _FlashSalesHeaderWidgetState();
}

class _FlashSalesHeaderWidgetState extends State<FlashSalesHeaderWidget> {
  String _timer;
  @override
  void initState() {
    _initTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var modelLang = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 0),
        leading: Icon(
          UiIcons.megaphone,
          color: Theme.of(context).hintColor,
        ),
        title: Text(
          modelLang.translate('flash'),
          style: Theme.of(context).textTheme.headline4,
        ),
        trailing: Text('${modelLang.translate("end_in") + _timer}'),
      ),
    );
  }

  void _initTimer() {
    var _now = DateTime.now();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _now = _now.subtract(Duration(seconds: 1));
          _timer = DateFormat('HH:mm:ss').format(_now);
        });
      }
    });
  }
}
