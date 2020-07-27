import 'package:ecommerce_app_ui_kit/services/api_response.dart';
import 'package:ecommerce_app_ui_kit/services/network_data_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  Product(
      this.id,
      this.name,
      this.description,
      this.shortDescription,
      this.image,
      this.available,
      this.price,
      this.sales,
      this.rate,
      this.discount,
      {this.sale,
      this.quantity = 0,
      this.like = false});

  factory Product.fromJson(dynamic product) => _$ProductFromJson(product);
  int id;
  String name;
  String description;
  String shortDescription;
  String image;
  int available;
  String price;
  int sales;
  String rate;
  double discount;
  bool sale;
  int quantity = 0;
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
  num tax = 0.2;
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
    // setLoading(true);
    String products = 'products?per_page=100';
    _apiResponse = await network.getData(products);
    setLoading();
    setError(_apiResponse.error);
    setErrorMsg(_apiResponse.errorMsg);
    if (!_apiResponse.error) {
      _apiResponse.data.forEach((product) {
        addList(Product.fromJson(product));
      });
      addFlashListFromList();
      setLoading(value: false);
    }
    notifyListeners();
  }

  void addFlashListFromList() {
    _list.forEach((e) {
      if (e.sale) addFlashSalesList(e);
    });
    notifyListeners();
  }

  void setLoading({value = true}) {
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

  void cartListAddorRemove(Product item, String typeCount) {
    switch (typeCount) {
      case 'increment':
        if (_cartList.contains(item))
          item.quantity++;
        else {
          item.quantity++;
          addCartList(item);
        }
        break;
      case 'decrement':
        // _flashSalesList[itemIndex].quantity--;
        if (item.quantity == 1) {
          item.quantity--;
          removeCartList(item);
        } else {
          item.quantity--;
        }
        break;
    }
    notifyListeners();
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

  void quantity(typeCount, item) {
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

  void addList(Product product) {
    _list.add(product);
    notifyListeners();
  }

  int get itemCount {
    return _flashSalesList.length == null ? 0 : _flashSalesList.length;
  }

  int get itemCountFav {
    return _favoritesList.length == null ? 0 : _favoritesList.length;
  }

  int itemsCounter() {
    int count;
    count = _cartList.fold(
        0, (previousValue, element) => previousValue + element.quantity);
    return count;
  }

  double subTotal() {
    double count;
    count = _cartList.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.quantity * double.parse(element.price)));
    return count;
  }

  num totalPrice() {
    num count;
    count = (subTotal() * tax) + subTotal();
    return count;
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
