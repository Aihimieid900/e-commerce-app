import 'package:ecommerce_app_ui_kit/src/core/models/product.dart';
import 'package:ecommerce_app_ui_kit/src/core/services/api_response.dart';
import 'package:ecommerce_app_ui_kit/src/core/services/network_data_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'brand.g.dart';

@JsonSerializable()
class Brand {
  int id;
  String name;
  int count;
  bool selected;
  // double rate;
  List<Product> products;
  Color color;

  Brand(
      this.id,
      this.name,
      this.count,
      this.color,
      this.selected,
      // this.rate,
      this.products);
  factory Brand.fromJson(dynamic brand) => _$BrandFromJson(brand);
}

class BrandsList with ChangeNotifier {
  List<Brand> _list;
  bool isFetched = false;
  bool error;
  String errorMsg;
  int isIdCategory;
  NetworkWoocommerce network = NetworkWoocommerce();
  ApiResponse _apiResponse;
  Future<void> getTags() async {
    // if (checkEmptyOrNotCategoryList()) {
    setLoading(true);
    String tags = 'products/tags?per_page=100';
    _apiResponse = await network.getData(tags);
    setLoading(false);
    setError(_apiResponse.error);
    if (!_apiResponse.error) {
      _apiResponse.data.forEach((tag) {
        addCategoriesList(Brand.fromJson(tag));
        // else
        // _subCategoriesList.addSubCategoriesList(SubCategory.fromJson(category));
      });
      // callFirst();
    } else {
      setErrorMsg(_apiResponse.errorMsg);
      throw Exception('error');
      // }
    }
    notifyListeners();
  }

  Future<List<Product>> getProductBrand(int id) async {
    /// set Loading for Spinner until get data from api
    List<Product> products = _list.firstWhere((tag) {
      // if (category.id == id) category.selected = true;
      return tag.id == id;
    }).products;
    if (products.isEmpty) {
      setLoading(true);
      notifyListeners();
      String productForTag = 'products?tag=$id';
      _apiResponse = await network.getData(productForTag);
      setLoading(false);
      setError(_apiResponse.error);
      setErrorMsg(_apiResponse.errorMsg);
      _apiResponse.data.forEach((product) {
        /// addProductsList is funC for add item in _list.products
        // addProductsList(id, Product.fromJson(product));
        if (!products.contains(Product.fromJson(product)))
          products.add(Product.fromJson(product));
      });
      notifyListeners();
    }
      return products;
  }

  void addProductsList(int id, Product item) {
    ///
    /// if id category from ui == category exist in _list,
    ///  add product  from function getProductCategory(id)
    ///
    if (!_list.contains(item)) {
      _list
          .firstWhere((tag) {
            // if (category.id == id) category.selected = true;
            return tag.id == id;
          })
          .products
          .add(item);
    }
    notifyListeners();
  }

  ///
  ///  for add all categories  in List BEFORE get Products ForEVERY Category
  ///
  void addCategoriesList(Brand item) {
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

  callFirst() {
    notifyListeners();
    return _list.first.id;
  }

  checkEmptyOrNotCategoryList() {
    return _list == null ? true : false;
    // notifyListeners();
  }

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

  List<Brand> get list => _list;

  BrandsList() {
    getTags();
    _list = [];
  }

  selectById(int id) {
    this._list.forEach((Brand brand) {
      notifyListeners();
      brand.selected = false;
      if (brand.id == id) {
        brand.selected = true;
        notifyListeners();
      }
    });
  }
}
