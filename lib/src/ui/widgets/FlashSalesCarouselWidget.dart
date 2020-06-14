import 'package:ecommerce_app_ui_kit/src/core/models/product.dart';
import 'package:ecommerce_app_ui_kit/src/ui/widgets/FlashSalesCarouselItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlashSalesCarouselWidget extends StatelessWidget {
  // List<Product> productsList;
  String heroTag;

  FlashSalesCarouselWidget({
    Key key,
    // this.productsList,
    this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        margin: EdgeInsets.only(top: 10),
        child: Consumer<ProductsList>(
          builder: (BuildContext context, ProductsList value, Widget child) =>
              ListView.builder(
            itemCount: value.itemCount,
            itemBuilder: (context, index) {
              double _marginLeft = 0;
              (index == 0) ? _marginLeft = 20 : _marginLeft = 0;
              return FlashSalesCarouselItemWidget(
                heroTag: this.heroTag,
                marginLeft: _marginLeft,
                product: value.flashSalesList.elementAt(index),
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        ));
  }
}
