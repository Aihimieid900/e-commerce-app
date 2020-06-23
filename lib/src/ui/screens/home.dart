import 'dart:core';

import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/brand.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/category.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/order.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/product.dart';
import 'package:ecommerce_app_ui_kit/src/core/services/locators.dart';
import 'package:ecommerce_app_ui_kit/src/helpers/style/constants.dart';
import 'package:ecommerce_app_ui_kit/src/ui/widgets/BrandsIconsCarouselWidget.dart';
import 'package:ecommerce_app_ui_kit/src/ui/widgets/CategoriesIconsCarouselWidget.dart';
import 'package:ecommerce_app_ui_kit/src/ui/widgets/CategorizedProductsWidget.dart';
import 'package:ecommerce_app_ui_kit/src/ui/widgets/FlashSalesCarouselWidget.dart';
import 'package:ecommerce_app_ui_kit/src/ui/widgets/FlashSalesWidget.dart';
import 'package:ecommerce_app_ui_kit/src/ui/widgets/HomeSliderWidget.dart';
import 'package:ecommerce_app_ui_kit/src/ui/widgets/LoadingPlaced2item.dart';
import 'package:ecommerce_app_ui_kit/src/ui/widgets/SearchBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';

class HomeWidget extends StatefulWidget {
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

  List<Product> _productsOfBrandList;
  List<Product> _productsOfCategoryList;
  CategoriesList get _categoriesList => locator<CategoriesList>();
  ProductsList get _productsList => locator<ProductsList>();
  OrderList get _orderList => locator<OrderList>();
  BrandsList get _brandsList => locator<BrandsList>();
  @override
  void initState() {

    super.initState();
    // _categoriesList.getCategories();
    // _productsList.getProducts();
    // _brandsList.getTags();

    // idCategory =
    //     Provider.of<CategoriesList>(context, listen: false).callFirst();
    // idBrand = Provider.of<BrandsList>(context, listen: false).callFirst();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _categoriesList.selectById(idCategory);
      // _categoriesList.getProductCategory(idCategory);
      _brandsList.selectById(idBrand);
    });
    // _brandsList.getProductBrand(idBrand);
    // showProducts for get product from api
    animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    CurvedAnimation curve =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    animationOpacity = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });

    animationController.forward();
    // _productsOfCategoryList =
    //     Provider.of<CategoriesList>(context, listen: false).list.first.products;
    // _productsOfBrandList =
    //     Provider.of<BrandsList>(context, listen: false).list.first.products;
  }

  @override
  Widget build(BuildContext context) {
    var modelCategories = Provider.of<CategoriesList>(context);
    var modelProducts = Provider.of<ProductsList>(context);
    var modelBrand = Provider.of<BrandsList>(context);
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBarWidget(),
        ),
        HomeSliderWidget(),

        FlashSalesHeaderWidget(),
        modelProducts.isError()
            ? Container(
                padding: const EdgeInsets.only(top: 50.0),
                width: double.infinity,
                height: 150,
                child: Column(
                  children: <Widget>[
                    Text(
                      (modelCategories.isErrorMsg()),
                      textAlign: TextAlign.center,
                      style: kStyleTextNoItem,
                    )
                  ],
                ),
              )
            : FlashSalesCarouselWidget(
                heroTag: 'home_flash_sales',
                // productsList: Provider.of<ProductsList>(context).flashSalesList
              ),
        // Heading (Recommended for you)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: ListTile(
            dense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 0),
            leading: Icon(
              UiIcons.favorites,
              color: Theme.of(context).hintColor,
            ),
            title: Text(
              'Recommended For You',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
        modelCategories.isError()
            ? Container(
                padding: const EdgeInsets.only(top: 50.0),
                width: double.infinity,
                height: 150,
                child: Column(
                  children: <Widget>[
                    Text(
                      (modelProducts.isErrorMsg()),
                      textAlign: TextAlign.center,
                      style: kStyleTextNoItem,
                    )
                  ],
                ),
              )
            : StickyHeader(
                header: CategoriesIconsCarouselWidget(
                    heroTag: 'home_categories_1',
                    // categoriesList: _categoriesList,
                    onChanged: (id) {
                      setState(() {
                        idCategory = id;
                        // modelCategories.getProductCategory(idCategory);
                        animationController.reverse().then((f) {
                          // _productsOfCategoryList =
                          //     modelCategories.list.firstWhere((category) {
                          //   return category.id == id;
                          // }).products;
                          animationController.forward();
                        });
                      });
                    }),
                content: CategorizedProductsWidget(
                  animationOpacity: animationOpacity,
                  // productsList: _productsOfCategoryList
                  funcName: _categoriesList.getProductCategory(idCategory),
                ),
              ),

        // Heading (Brands)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: ListTile(
            dense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 0),
            leading: Icon(
              UiIcons.flag,
              color: Theme.of(context).hintColor,
            ),
            title: Text(
              'Brands',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
        modelBrand.isError()
            ? Container(
                padding: const EdgeInsets.only(top: 50.0),
                width: double.infinity,
                height: 150,
                child: Column(
                  children: <Widget>[
                    Text(
                      (modelBrand.isErrorMsg()),
                      textAlign: TextAlign.center,
                      style: kStyleTextNoItem,
                    )
                  ],
                ),
              )
            : StickyHeader(
                header: BrandsIconsCarouselWidget(
                    heroTag: 'home_brand_1',
                    brandsList: _brandsList,
                    onChanged: (id) {
                      setState(() {
                        idBrand = id;
                        animationController.reverse().then((f) {
                          // modelBrand.getProductBrand(idBrand);

                          // _productsOfBrandList =
                          //     modelBrand.list.firstWhere((brand) {
                          //   return brand.id == id;
                          // }).products;
                          animationController.forward();
                        });
                      });
                    }),
                content: CategorizedProductsWidget(
                  animationOpacity: animationOpacity,
                  // productsList: _productsOfBrandLis
                  funcName: _brandsList.getProductBrand(idBrand),
                ),
              ),
      ],
    );
//      ],
//    );
  }
}
