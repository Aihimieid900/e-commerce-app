import 'dart:core';

import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/l10n/App_Localizations.dart';
import 'package:ecommerce_app_ui_kit/models/brand.dart';
import 'package:ecommerce_app_ui_kit/models/category.dart';
import 'package:ecommerce_app_ui_kit/models/order.dart';
import 'package:ecommerce_app_ui_kit/services/check_connection.dart';
import 'package:ecommerce_app_ui_kit/services/locators.dart';

import 'package:ecommerce_app_ui_kit/ui/widgets/BrandsIconsCarouselWidget.dart';
import 'package:ecommerce_app_ui_kit/ui/widgets/CategoriesIconsCarouselWidget.dart';
import 'package:ecommerce_app_ui_kit/ui/widgets/CategorizedProductsWidget.dart';
import 'package:ecommerce_app_ui_kit/ui/widgets/FlashSalesCarouselWidget.dart';
import 'package:ecommerce_app_ui_kit/ui/widgets/FlashSalesWidget.dart';
import 'package:ecommerce_app_ui_kit/ui/widgets/HomeSliderWidget.dart';
import 'package:ecommerce_app_ui_kit/ui/widgets/LoadingPlaced2item.dart';
import 'package:ecommerce_app_ui_kit/ui/widgets/Network_Error.dart';
import 'package:ecommerce_app_ui_kit/ui/widgets/SearchBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key, this.duration}) : super(key: key);

  final Duration duration;
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  // for animation
  Animation animationOpacity;

  int idCategory;
  int idBrand;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // List<Product> _productsOfBrandList;
  // List<Product> _productsOfCategoryList;
  // CategoriesList get _categoriesList => locator<CategoriesList>();
  // ProductsList get _productsList => locator<ProductsList>();
  OrderList get _orderList => locator<OrderList>();
  // BrandsList get _brandsList => locator<BrandsList>();
  @override
  void initState() {
    // _orderList.getOrders();
    SchedulerBinding.instance.addPostFrameCallback((_) => setState(() {}));
    animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    CurvedAnimation curve =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    animationOpacity = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });

    animationController.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(HomeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    animationController.duration = widget.duration;
  }

//  @override
//  void dispose() {
//    animationController.dispose();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    var modelCategories = Provider.of<CategoriesList>(context);
    var modelBrand = Provider.of<BrandsList>(context);
    var modelLang = AppLocalizations.of(context);
    return Provider.of<CheckConnection>(context).internet
        ? ListView(
            key: _scaffoldKey,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SearchBarWidget(),
              ),
              HomeSliderWidget(),

              FlashSalesHeaderWidget(),
              FlashSalesCarouselWidget(
                heroTag: 'home_flash_sales',
                // productsList: Provider.of<ProductsList>(context).flashSalesList
              ),
              // Heading (Recommended for you)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  leading: Icon(
                    UiIcons.favorites,
                    color: Theme.of(context).hintColor,
                  ),
                  title: Text(
                    modelLang.translate('recommended'),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),

              StickyHeader(
                header: CategoriesIconsCarouselWidget(
                    heroTag: 'home_categories_1',
                    // categoriesList: _categoriesList,
                    onChanged: (id) {
                      setState(() {
                        idCategory = id;
                        animationController.reverse().then((f) {
                          animationController.forward();
                        });
                      });
                    }),
                content: CategorizedProductsWidget(
                  animationOpacity: animationOpacity,
                  funcName: modelCategories.getProductCategory(idCategory),
                ),
              ),

              // Heading (Brands)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  leading: Icon(
                    UiIcons.flag,
                    color: Theme.of(context).hintColor,
                  ),
                  title: Text(
                    modelLang.translate("brands"),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
              StickyHeader(
                header: BrandsIconsCarouselWidget(
                    heroTag: 'home_brand_1',
                    onChanged: (id) {
                      setState(() {
                        idBrand = id;
                        animationController.reverse().then((f) {
                          animationController.forward();
                        });
                      });
                    }),
                content: CategorizedProductsWidget(
                  animationOpacity: animationOpacity,
                  funcName: modelBrand.getProductBrand(idBrand),
                ),
              ),
            ],
          )
        : NetworkError();
//      ],
//    );
  }
}
