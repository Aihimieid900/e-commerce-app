import 'package:ecommerce_app_ui_kit/src/core/services/api_response.dart';
import 'package:ecommerce_app_ui_kit/src/core/services/network_data_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  Product(this.id, this.name, this.description, this.image, this.available,
      this.price, this.quantity, this.sales, this.rate, this.discount,
      {this.like = false});

  factory Product.fromJson(dynamic product) => _$ProductFromJson(product);
  int id;
  String name;
  String description;
  String image;
  int available;
  String price;
  int quantity;
  int sales;
  String rate;
  double discount;
  bool like = false;

  String getPrice({String myPrice}) {
    if (this.price != null) {
      return '\$$myPrice';
    }
    return '\$${this.price}';
  }

  String getId(id) {
    return '${'id.toString()'}';
  }

  void toggleLike() {
    like = !like;
  }
}

class ProductsList with ChangeNotifier {
  bool isFetched = false;
  bool error;
  String errorMsg;

  List<Product> _cartList;
  // List<Product> _categorized;
  List<Product> _favoritesList;
  List<Product> _flashSalesList;
  List<Product> _list;
  ProductsList() {
    getProducts();
    _flashSalesList = [];
    _favoritesList = [];
    _list = [];
    _cartList = [];
  }
  NetworkWoocommerce network = NetworkWoocommerce();
  ApiResponse _apiResponse;

  Future<void> getProducts() async {
    setLoading(true);
    String products = 'products';
    _apiResponse = await network.getData(products);
    setLoading(false);
    setError(_apiResponse.error);
    setErrorMsg(_apiResponse.errorMsg);
    if (!_apiResponse.error) {
      _apiResponse.data.forEach((product) {
        addFlashSalesList(Product.fromJson(product));
      });
    }
    notifyListeners();
  }

  void setLoading(value) {
    isFetched = value;
    notifyListeners();
  }

  bool isLoading() {
    return isFetched;
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

  void addCartList(Product item) {
    _cartList.add(item);
    notifyListeners();
  }

  void removeCartList(Product item) {
    _cartList.remove(item);
    notifyListeners();
  }

  void addFavoritesList(item) {
    _favoritesList.add(item);
    notifyListeners();
  }

  void toggleLike(item) {
    var itemIndex = _favoritesList.indexOf(item);
    _favoritesList[itemIndex].toggleLike();
    notifyListeners();
  }

  void removeFromFav(item) {
    _favoritesList.remove(item);
    notifyListeners();
  }

  void addFlashSalesList(Product product) {
    _flashSalesList.add(product);
    notifyListeners();
  }

  int get itemCount {
    return _flashSalesList.length == null ? 0 : _flashSalesList.length;
  }

  int get itemCountFav {
    return _favoritesList.length == null ? 0 : _favoritesList.length;
  }

  int get itemCountCart {
    return _cartList.length == null ? 0 : _cartList.length;
  }

  int get itemCountList {
    return _list.length == null ? 0 : _list.length;
  }

  // List<Product> get categorized => _categorized;

  List<Product> get list => _list;

  List<Product> get flashSalesList => _flashSalesList;

  List<Product> get favoritesList => _favoritesList;

  List<Product> get cartList => _cartList;
}
