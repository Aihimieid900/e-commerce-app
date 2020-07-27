import 'package:ecommerce_app_ui_kit/models/product.dart';
import 'package:ecommerce_app_ui_kit/services/api_response.dart';
import 'package:ecommerce_app_ui_kit/services/network_data_url.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

//
@JsonSerializable()
class Category {
  int id;
  String name;
  bool selected;
  String display;
  List<Product> products;
  // List<SubCategory> subCategory;
  int parent;
  Category(this.id, this.name, this.display, this.selected, this.products,
      this.parent);
  factory Category.fromJson(dynamic category) => _$CategoryFromJson(category);
}

class CategoriesList extends ChangeNotifier {
  CategoriesList() {
    getCategories();
    _list = [
      Category(0, 'لا يوجد تصنيفات', '', false, [], 0),
    ];
  }

  ///
  /// for Func API
  ///
  NetworkWoocommerce network = NetworkWoocommerce();
  ApiResponse _apiResponse;
  // SubCategoriesList _subCategoriesList;
  ///
  ///  to get all categories
  // var categoriesData;
  Future<void> getCategories() async {
    // if (_list.length == 1) {
    String categories = 'products/categories?per_page=100';
    _apiResponse = await network.getData(categories);
    // setLoading(true);
    setLoading();
    setError(_apiResponse.error);
    if (!_apiResponse.error) {
      _apiResponse.data.forEach((category) {
        if (category['display'] == 'default')
          addCategoriesList(Category.fromJson(category));
      });
      setLoading(value: false);
      if (itemCount > 1) _list.removeWhere((element) => element.id == 0);
    } else {
      setErrorMsg(_apiResponse.errorMsg);
      // throw Exception(_apiResponse.errorMsg);
      // }

    }

    notifyListeners();
  }

  Future<List<Product>> getProductCategory(id) async {
    id == null ? id = callFirst() : id = id;
    List<Product> products = _list.firstWhere((category) {
      return category.id == id;
    }).products;

    selectById(id);
    if (products.isEmpty && id != 0) {
      /// set Loading for Spinner until get data from api
      // setLoading(true);
      // notifyListeners();
      String productForCategory = 'products?category=$id';
      _apiResponse = await network.getData(productForCategory);
      setLoading();
      setError(_apiResponse.error);
      setErrorMsg(_apiResponse.errorMsg);
      if (!_apiResponse.error)
        _apiResponse.data.forEach((product) {
          Product item = Product.fromJson(product);
          if (!products.contains(item)) products.add(item);
        });
      setLoading(value: false);
    }
    // notifyListeners();
    return products;
  }

  callFirst() {
    // notifyListeners();
    return _list.first.id;
  }

  checkEmptyOrNotCategoryList() {
    return _list == null ? true : false;
    // notifyListeners();
  }

  removeAll() {
    _list.clear();
    notifyListeners();
  }

  ///
  /// to get && set for Spinner || get Data
  ///
  bool isFetched = false;
  bool error;
  String errorMsg;
  int isIdCategory;

  void setError(value) {
    error = value;
    notifyListeners();
  }

  bool isError() {
    return error;
  }

  void setErrorMsg(value) {
    errorMsg = value;
    notifyListeners();
  }

  String isErrorMsg() {
    return errorMsg;
  }

  ///
  /// this is _list here exists all categories  and product for every category
  ///
  List<Category> _list;

  void addProductsList(int id, Product item) {
    ///
    /// if id category from ui == category exist in _list,
    ///  add product  from function getProductCategory(id)
    ///
    if (!_list.contains(item)) {
      _list
          .firstWhere((category) {
            // if (category.id == id) category.selected = true;
            return category.id == id;
          })
          .products
          .add(item);
    }
    notifyListeners();
  }

  ///  for add all categories  in List BEFORE get Products ForEVERY Category
  ///
  void addCategoriesList(Category item) {
    if (!_list.contains(item)) _list.add(item);
    notifyListeners();
  }

  ///
  ///  funC for set true or false For SPINNER
  ///
  void setLoading({value = true}) {
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
    return _list == null ? 0 : _list.length;
  }

  ///
  ///  Constructor for Class CategoriesList()
  ///

  ///
  ///  for get _list
  ///  and
  ///  add select = true to change in ui
  ///
  List<Category> get list => _list;
  selectById(int id) {
    this._list.forEach((Category category) {
      category.selected = false;
      // notifyListeners();
      if (category.id == id) {
        category.selected = true;
        // notifyListeners();
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
  List<SubCategory> subCategory;
  int parent;

  SubCategory(this.id, this.name, this.display, this.selected, this.products,
      this.parent);
  factory SubCategory.fromJson(dynamic subCategory) =>
      _$SubCategoryFromJson(subCategory);
}

class SubCategoriesList with ChangeNotifier {
  NetworkWoocommerce network = NetworkWoocommerce();
  ApiResponse _apiResponse;

  Future<void> getSubCategories() async {
    if (checkEmptyOrNotCategoryList()) {
      setLoading(true);
      String categories = 'products/categories?per_page=100';
      _apiResponse = await network.getData(categories);
      setLoading(false);
      _apiResponse.data.forEach((sub) {
        if (sub['display'] != 0)
          addSubCategoriesList(SubCategory.fromJson(sub));
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
    return _list == null ? true : false;
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
    getSubCategories();
    _list = [];
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
