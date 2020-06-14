import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/product.dart';
import 'package:ecommerce_app_ui_kit/src/ui/widgets/EmptyFavoritesWidget.dart';
import 'package:ecommerce_app_ui_kit/src/ui/widgets/FavoriteListItemWidget.dart';
import 'package:ecommerce_app_ui_kit/src/ui/widgets/ProductGridItemWidget.dart';
import 'package:ecommerce_app_ui_kit/src/ui/widgets/SearchBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class FavoritesWidget extends StatefulWidget {
  @override
  _FavoritesWidgetState createState() => _FavoritesWidgetState();
}

class _FavoritesWidgetState extends State<FavoritesWidget> {
  String layout = 'grid';
  ProductsList _productsList = new ProductsList();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchBarWidget(),
          ),
          SizedBox(height: 10),
          Offstage(
            offstage: Provider.of<ProductsList>(context).itemCountFav == 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                leading: Icon(
                  UiIcons.heart,
                  color: Theme.of(context).hintColor,
                ),
                title: Text(
                  'Wish List',
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: Theme.of(context).textTheme.headline4,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        setState(() {
                          this.layout = 'list';
                        });
                      },
                      icon: Icon(
                        Icons.format_list_bulleted,
                        color: this.layout == 'list' ? Theme.of(context).accentColor : Theme.of(context).focusColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          this.layout = 'grid';
                        });
                      },
                      icon: Icon(
                        Icons.apps,
                        color: this.layout == 'grid' ? Theme.of(context).accentColor : Theme.of(context).focusColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Offstage(
            offstage: this.layout != 'list' || Provider.of<ProductsList>(context).itemCountFav == 0,
            child: Consumer<ProductsList>(
              builder: (context, value, child) => 
                          ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                primary: false,
                itemCount: value.itemCountFav,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
                itemBuilder: (context, index) {
                  return FavoriteListItemWidget(
                    heroTag: 'favorites_list',
                    product: value.favoritesList.elementAt(index),
                    onDismissed: () {
                      setState(() {
                       value.favoritesList.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
          ),
          Offstage(
            offstage: this.layout != 'grid' || Provider.of<ProductsList>(context).itemCountFav==0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Consumer<ProductsList>(
                builder: (context, value, child) => 
                              new StaggeredGridView.countBuilder(
                  primary: false,
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  itemCount: value.itemCountFav ,
                  itemBuilder: (BuildContext context, int index) {
                    Product product = value.favoritesList.elementAt(index);
                    return ProductGridItemWidget(
                      product: product,
                      heroTag: 'favorites_grid',
                    );
                  },
//                  staggeredTileBuilder: (int index) => new StaggeredTile.fit(index % 2 == 0 ? 1 : 2),
                  staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0,
                ),
              ),
            ),
          ),
          Offstage(
            offstage: Provider.of<ProductsList>(context).itemCountFav != 0,
            child: EmptyFavoritesWidget(),
          )
        ],
      ),
    );
  }
}
