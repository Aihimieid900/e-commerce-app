import 'package:ecommerce_app_ui_kit/src/services/network.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  Product(this.id, this.name, this.description, this.image, this.available,
      this.price, this.quantity, this.sales, this.rate, this.discount,
      {this.like = false});

  factory Product.fromJson(dynamic product) => _$ProductFromJson(product);
  bool like = false;
  int available;
  String description;
  double discount;
  // String id = UniqueKey().toString();
  int id;
  String image;
  String name;
  String price;
  int quantity;
  String rate;
  int sales;

  String getPrice({String myPrice}) {
    if (this.price != null) {
      return '\$${myPrice}';
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

  List<Product> _cartList;
  // List<Product> _categorized;
  List<Product> _favoritesList;
  List<Product> _flashSalesList;
  List<Product> _list;
  ProductsList() {
    {
      _flashSalesList = [];
      _favoritesList = [];
      _list = [];
      _cartList = [];
    }
  }

  Future<void> getProducts() async {
    setLoading(true);
    NetworkWoocommerce network = NetworkWoocommerce();
    String products = 'products';
    var productsData = await network.getData(products);
    setLoading(false);
    productsData.forEach((product) {
      addFlashSalesList(Product.fromJson(product));
    });
  }

  void setLoading(value) {
    isFetched = value;
    notifyListeners();
  }

  bool isLoading() {
    return isFetched;
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

  void removeAll() {
    _cartList.clear();

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

  // List<Product> get categorized => _categorized;

  bool get isFechted => isFetched;

  List<Product> get list => _list;

  List<Product> get flashSalesList => _flashSalesList;

  List<Product> get favoritesList => _favoritesList;

  List<Product> get cartList => _cartList;
}
