// import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/src/core/models/product.dart';
import 'package:ecommerce_app_ui_kit/src/core/services/api_response.dart';
import 'package:ecommerce_app_ui_kit/src/core/services/network_data_url.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  int id;
  String name;
  bool selected;
  String display;
  List<Product> products;
  int parent;
  Category(this.id, this.name, this.display, this.selected, this.products,
      this.parent);
  factory Category.fromJson(dynamic product) => _$CategoryFromJson(product);
}

class CategoriesList with ChangeNotifier {
    CategoriesList() {
    getCategories();
    this._list = [];
  }

  ///
  /// for Func API
  ///
  NetworkWoocommerce network = NetworkWoocommerce();
  ApiResponse _apiResponse;
  // SubCategoriesList _subCategoriesList;
  ///
  ///  to get all categories
  var categoriesData;
  Future<void> getCategories() async {
    // if (checkEmptyOrNotCategoryList()) {
      setLoading(true);
      String categories = 'products/categories?per_page=100';
      _apiResponse = await network.getData(categories);
      setLoading(false);

      _apiResponse.data.forEach((category) {
        if (category['parent'] == 0)
          addCategoriesList(Category.fromJson(category));
        // else
        // _subCategoriesList.addSubCategoriesList(SubCategory.fromJson(category));
      });
    // }
    notifyListeners();
  }

  Future<void> getProductCategory(id) async {
    if (checkEmptyOrNotProductsInCategoryList(id)) {
      /// set Loading for Spinner until get data from api
      setLoading(true);
      String productForCategory = 'products?category=$id';
      _apiResponse = await network.getData(productForCategory);
      _apiResponse.data.forEach((product) {
        /// addProductsList is funC for add item in _list.products
        addProductsList(id, Product.fromJson(product));
      });
      setLoading(false);
    }
    notifyListeners();
  }

  checkEmptyOrNotProductsInCategoryList(id) {
    return _list
        .firstWhere((category) {
          // if (category.id == id) category.selected = true;
          return category.id == id;
        })
        .products
        .isEmpty;
    // notifyListeners();
  }

  checkEmptyOrNotCategoryList() {
    return _list.isEmpty;
    // notifyListeners();
  }

  ///
  /// to get && set for Spinner || get Data
  ///
  bool isFetched = false;
  int isIdCategory;

  ///
  /// this is _list here exists all categories  and product for every category
  ///
  List<Category> _list;

  void addProductsList(int id, Product item) {
    ///
    /// if id category from ui == category exist in _list,
    ///  add product  from function getProductCategory(id)
    ///

    _list
        .firstWhere((category) {
          // if (category.id == id) category.selected = true;
          return category.id == id;
        })
        .products
        .add(item);
    notifyListeners();
  }

  ///
  ///  for add all categories  in List BEFORE get Products ForEVERY Category
  ///
  void addCategoriesList(Category item) {
    if (!_list.contains(item)) _list.add(item);
    notifyListeners();
  }

  ///
  ///  funC for set true or false For SPINNER
  ///
  void setLoading(value) {
    isFetched = value;
    notifyListeners();
  }

  ///
  ///  funC for get true or false For SPINNER
  ///
  bool isLoading() {
    return isFetched;
  }

  ///
  ///  funC for get length _list
  ///
  int get itemCount {
    return _list.length == null ? 0 : _list.length;
  }

  ///
  ///  Constructor for Class CategoriesList()
  ///

  ///
  ///  for get _list
  ///  and
  /// add select = true to change in ui
  ///
  List<Category> get list => _list;
  selectById(int id) {
    this._list.forEach((Category category) {
      category.selected = false;
      if (category.id == id) {
        category.selected = true;
      }
    });
  }

  void clearSelection() {
    _list.forEach((category) {
      category.selected = false;
    });
  }
}

@JsonSerializable()
class SubCategory {
  int id;
  String name;
  String display;
  bool selected;
  List<Product> products;
  int parent;

  SubCategory(this.id, this.display,this.name, this.selected, this.products, this.parent);
  factory SubCategory.fromJson(dynamic product) =>
      _$SubCategoryFromJson(product);
}

class SubCategoriesList with ChangeNotifier {
  NetworkWoocommerce network = NetworkWoocommerce();
  ApiResponse _apiResponse;
  // CategoriesList get _categoriesList => GetIt.I<CategoriesList>();
  /* getSubCategory() {
  //   var subCategories = _categoriesList.list;
  //   print(subCategories);
  //   if (subCategories != null) {
      _categoriesList.list.forEach((sub) {
       
      });
  //   }});
  }  */
  Future<void> getSubCategories() async {
    if (checkEmptyOrNotCategoryList()) {
      setLoading(true);
      String categories = 'products/categories?per_page=100';
      _apiResponse = await network.getData(categories);
      setLoading(false);
      _apiResponse.data.forEach((sub) {
        if (sub['parent'] != 0 ) addSubCategoriesList(SubCategory.fromJson(sub));
      });
    }
  }

  List<SubCategory> _list;
  bool isFetched;
  List<SubCategory> get list => _list;
  void addSubCategoriesList(SubCategory item) {
    if (!_list.contains(item)) _list.add(item);
    notifyListeners();
  }

  checkEmptyOrNotCategoryList() {
    return _list.isEmpty;
    // notifyListeners();
  }

  void setLoading(value) {
    isFetched = value;
    notifyListeners();
  }

  ///
  ///  funC for get true or false For SPINNER
  ///
  bool isLoading() {
    return isFetched;
  }

  ///
  ///  funC for get length _list
  ///
  int get itemCount {
    return _list.length == null ? 0 : _list.length;
  }

  ///
  ///  Constructor for Class SubCategoriesList()
  ///
  SubCategoriesList() {
    this._list = [];
  }

  ///
  ///  for get _list
  ///  and
  ///  add select = true to change in ui
  ///
  selectById(int id) {
    this._list.forEach((SubCategory subCategory) {
      subCategory.selected = false;
      if (subCategory.id == id) {
        subCategory.selected = true;
      }
    });
  }

  void clearSelection() {
    _list.forEach((category) {
      category.selected = false;
    });
  }
}
