import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/l10n/App_Localizations.dart';
import 'package:ecommerce_app_ui_kit/models/product.dart';
import 'package:ecommerce_app_ui_kit/models/product_color.dart';
import 'package:ecommerce_app_ui_kit/models/product_size.dart';
import 'package:ecommerce_app_ui_kit/ui/widgets/FlashSalesCarouselWidget.dart';
import 'package:flutter/material.dart';

class ProductHomeTabWidget extends StatefulWidget {
  Product product;
  ProductsList _productsList = new ProductsList();

  ProductHomeTabWidget({this.product});

  @override
  ProductHomeTabWidgetState createState() => ProductHomeTabWidgetState();
}

class ProductHomeTabWidgetState extends State<ProductHomeTabWidget> {
  @override
  Widget build(BuildContext context) {
    var modelLang = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Text(
                  widget.product.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Chip(
                padding: EdgeInsets.all(0),
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(widget.product.rate.toString(),
                        style: Theme.of(context).textTheme.bodyText2.merge(
                            TextStyle(color: Theme.of(context).primaryColor))),
                    Icon(
                      Icons.star_border,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                  ],
                ),
                backgroundColor: Theme.of(context).accentColor.withOpacity(0.9),
                shape: StadiumBorder(),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(widget.product.price,
                  style: Theme.of(context).textTheme.headline2),
              SizedBox(width: 10),
              Text(
                widget.product.price,
                style: Theme.of(context).textTheme.headline5.merge(TextStyle(
                    color: Theme.of(context).focusColor,
                    decoration: TextDecoration.lineThrough)),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  '${widget.product.sales.toString()} ' +
                      modelLang.translate('sales'),
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.9),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).focusColor.withOpacity(0.15),
                  blurRadius: 5,
                  offset: Offset(0, 2)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      modelLang.translate('select_color'),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(0),
                    minWidth: 0,
                    child: Text(
                      modelLang.translate('clear_all'),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              SelectColorWidget()
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          margin: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.9),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).focusColor.withOpacity(0.15),
                  blurRadius: 5,
                  offset: Offset(0, 2)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      modelLang.translate('select_size'),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(0),
                    minWidth: 0,
                    child: Text(
                      modelLang.translate('clear_all'),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              SelectSizeWidget()
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: ListTile(
            dense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 0),
            leading: Icon(
              UiIcons.box,
              color: Theme.of(context).hintColor,
            ),
            title: Text(
              modelLang.translate('related_poducts'),
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
        FlashSalesCarouselWidget(
          heroTag: 'product_related_products',
          //  productsList: widget._productsList.flashSalesList
        ),
      ],
    );
  }
}

class SelectColorWidget extends StatefulWidget {
  @override
  _SelectColorWidgetState createState() => _SelectColorWidgetState();
}

class _SelectColorWidgetState extends State<SelectColorWidget> {
  ProductColorsList _productColorsList = new ProductColorsList();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(_productColorsList.list.length, (index) {
        var _color = _productColorsList.list.elementAt(index);
        return buildColor(_color);
      }),
    );
  }

  SizedBox buildColor(ProductColor color) {
    return SizedBox(
      width: 38,
      height: 38,
      child: FilterChip(
        label: Text(''),
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        backgroundColor: color.color,
        selectedColor: color.color,
        selected: color.selected,
        shape: StadiumBorder(),
        avatar: Text(''),
        onSelected: (bool value) {
          setState(() {
            color.selected = value;
          });
        },
      ),
    );
  }
}

class SelectSizeWidget extends StatefulWidget {
  @override
  _SelectSizeWidgetState createState() => _SelectSizeWidgetState();
}

class _SelectSizeWidgetState extends State<SelectSizeWidget> {
  ProductSizesList _productSizesList = new ProductSizesList();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(_productSizesList.list.length, (index) {
        var _size = _productSizesList.list.elementAt(index);
        return buildSize(_size);
      }),
    );
  }

  SizedBox buildSize(ProductSize size) {
    return SizedBox(
      height: 38,
      child: RawChip(
        label: Text(size.code),
        labelStyle: TextStyle(color: Theme.of(context).hintColor),
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        backgroundColor: Theme.of(context).focusColor.withOpacity(0.05),
        selectedColor: Theme.of(context).focusColor.withOpacity(0.2),
        selected: size.selected,
        shape: StadiumBorder(
            side: BorderSide(
                color: Theme.of(context).focusColor.withOpacity(0.05))),
        onSelected: (bool value) {
          setState(() {
            size.selected = value;
          });
        },
      ),
    );
  }
}
