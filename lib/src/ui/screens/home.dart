import 'dart:core';

import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/brand.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/category.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/product.dart';
// import 'package:ecommerce_app_ui_kit/src/ui/services/network.dart';
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
import 'package:get_it/get_it.dart';
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

  BrandsList _brandsList = new BrandsList();
  List<Product> _productsOfBrandList;
  List<Product> _productsOfCategoryList;
  CategoriesList get _categoriesList => GetIt.I<CategoriesList>();
  ProductsList get _productsList => GetIt.I<ProductsList>();
  @override
  void initState() {
    super.initState();

  context.read<CategoriesList>().getCategories();
    context.read<ProductsList>().getProducts();


    idCategory = context.read<CategoriesList>().list.first.id;
    context.read<CategoriesList>().getProductCategory(idCategory);

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

      _productsOfCategoryList = _categoriesList.list
          .firstWhere((category) => category.selected = true,
              orElse: () => null)
          .products;

    _productsOfBrandList = _brandsList.list.firstWhere((brand) {
      return brand.selected;
    }).products;
  }

  // CategoriesList get _categoriesList => GetIt.I<CategoriesList>();

  // NetworkWoocommerce get _network => GetIt.I<NetworkWoocommerce>();

  // list to make state

  //for stop circular progress
  // showProducts for get product from api
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    var categoryList = Provider.of<CategoriesList>(context, listen: false);
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20), // Future.microtask(() {
          // idCategory =
          //     Provider.of<CategoriesList>(context, listen: false).list.first.id;
          // context.read<CategoriesList>().getProductCategory(idCategory);
          // });
          child: SearchBarWidget(),
        ),
        HomeSliderWidget(),

        FlashSalesHeaderWidget(),
        Provider.of<ProductsList>(context).isLoading()
            ? LoadingPlace2or1Item(
                count: 2,
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
        StickyHeader(
          header: CategoriesIconsCarouselWidget(
              heroTag: 'home_categories_1',
              // categoriesList: _categoriesList,
              onChanged: (id) {
                setState(() {
                  idCategory = id;
                  categoryList.getProductCategory(idCategory);
                  animationController.reverse().then((f) {
                    _productsOfCategoryList =
                        categoryList.list.firstWhere((category) {
                      return category.id == id;
                    }).products;
                    animationController.forward();
                  });
                });
              }),
          content: categoryList.isLoading()
              ? LoadingPlace2or1Item(
                  count: 2,
                )
              : categoryList.checkEmptyOrNotProductsInCategoryList(idCategory)
                  ? Container(
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
                    )
                  : CategorizedProductsWidget(
                      animationOpacity: animationOpacity,
                      productsList: _productsOfCategoryList),
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
        StickyHeader(
          header: BrandsIconsCarouselWidget(
              heroTag: 'home_brand_1',
              brandsList: _brandsList,
              onChanged: (id) {
                setState(() {
                  animationController.reverse().then((f) {
                    _productsOfBrandList = _brandsList.list.firstWhere((brand) {
                      return brand.id == id;
                    }).products;
                    animationController.forward();
                  });
                });
              }),
          content: Provider.of<ProductsList>(context).isLoading()
              ? LoadingPlace2or1Item(
                  count: 2,
                )
              : CategorizedProductsWidget(
                  animationOpacity: animationOpacity,
                  productsList: _productsList.list),
        ),
      ],
    );
//      ],
//    );
  }
}
