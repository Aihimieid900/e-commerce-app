import 'package:ecommerce_app_ui_kit/src/core/models/category.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/product.dart';
import 'package:ecommerce_app_ui_kit/src/core/services/locators.dart';
import 'package:ecommerce_app_ui_kit/src/helpers/style/constants.dart';
import 'package:ecommerce_app_ui_kit/src/ui/widgets/ProductGridItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import 'LoadingPlaced2item.dart';

class CategorizedProductsWidget extends StatelessWidget {
  const CategorizedProductsWidget({
    Key key,
    @required this.animationOpacity,
    @required this.funcName,
  });

  final Animation animationOpacity;
  // final List<Product> _productsList;
  final Future funcName;
  @override
  Widget build(BuildContext context) {
    // int idCategory =
    //     Provider.of<CategoriesList>(context, listen: false).callFirst();
    return FadeTransition(
      opacity: animationOpacity,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: FutureBuilder<List<Product>>(
            future: funcName,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return LoadingPlace2or1Item(
                    count: 2,
                  );
                default:
                  if (snapshot.data == null)
                    return Container(
                      padding: const EdgeInsets.only(top: 50.0),
                      width: double.infinity,
                      height: 150,
                      child: Column(
                        children: <Widget>[
                          Text(
                            ('اسفين لا يوجد منتجات في هذا التصنيف'),
                            textAlign: TextAlign.center,
                            style: kStyleTextNoItem,
                          )
                        ],
                      ),
                    );
                  else
                    return StaggeredGridView.countBuilder(
                      primary: false,
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        Product product = snapshot.data[index];
                        return ProductGridItemWidget(
                          product: product,
                          heroTag: 'categorized_products_grid',
                        );
                      },
//              staggeredTileBuilder: (int index) => new StaggeredTile.count(2, index.isEven ? 2 : 1),
                      staggeredTileBuilder: (int index) =>
                          new StaggeredTile.fit(2),
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 15.0,
                    );
              }
            }),
      ),
    );
  }
}
