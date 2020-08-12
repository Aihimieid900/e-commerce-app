import 'package:ecommerce_app_ui_kit/l10n/App_Localizations.dart';
import 'package:ecommerce_app_ui_kit/services/check_connection.dart';
import 'package:ecommerce_app_ui_kit/ui/widgets/LoadingPlaced2item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class NetworkError extends StatefulWidget {
  @override
  _NetworkErrorState createState() => _NetworkErrorState();
}

class _NetworkErrorState extends State<NetworkError> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(
            image: AssetImage('img/error-connection.png'),
            width: MediaQuery.of(context).size.width,
            height: 200),
        SizedBox(
          height: 20,
        ),
        Text(
          AppLocalizations.of(context).translate('error_network'),
          style: TextStyle(fontSize: 20.0),
        ),
        loading
            ? LoadingPlace2or1Item()
            : IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    loading = true;
                  });
                  Provider.of<CheckConnection>(context, listen: false)
                      .checkConnection();
                  setState(() {
                    loading = false;
                  });
                },
              ),
      ],
    );
  }
}
