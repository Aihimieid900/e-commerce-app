import 'package:ecommerce_app_ui_kit/l10n/App_Localizations.dart';
import 'package:ecommerce_app_ui_kit/models/order.dart';
import 'package:ecommerce_app_ui_kit/models/route_argument.dart';
import 'package:flutter/material.dart';

class OrderGridItemWidget extends StatelessWidget {
  const OrderGridItemWidget({
    Key key,
    @required this.order,
    @required this.heroTag,
  }) : super(key: key);

  final Order order;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    var modelLang = AppLocalizations.of(context);

    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Theme.of(context).accentColor.withOpacity(0.08),
      onTap: () {
        Navigator.of(context).pushNamed('/Order',
            arguments: new RouteArgument(
                argumentsList: [this.heroTag], id: this.order.id));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).hintColor.withOpacity(0.10),
                offset: Offset(0, 4),
                blurRadius: 10)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Hero(
            //   tag: this.heroTag + order.trackingNumber,
            //   child: Image.asset('img/watch7.webp'),
            // ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                order.product.name,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                order.product.price,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: <Widget>[
                  // The title of the order
                  Expanded(
                    child: Text(
                      '${order.product.sales} ' + modelLang.translate("sales"),
                      style: Theme.of(context).textTheme.bodyText1,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 18,
                  ),
                  Text(
                    order.product.rate.toString(),
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
