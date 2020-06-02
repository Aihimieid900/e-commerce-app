import 'package:ecommerce_app_ui_kit/src/services/network.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  Product(this.id, this.name, this.description, this.image, this.available,
      this.price, this.quantity, this.sales, this.rate, this.discount);

  factory Product.fromJson(dynamic product) => _$ProductFromJson(product);

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
}

class ProductsList {
  ProductsList() {
    {
      _flashSalesList = [];
      _list = [];
    }
  }

  List<Product> _cartList;
  // List<Product> _categorized;
  List<Product> _favoritesList;
  List<Product> _flashSalesList;
  List<Product> _list;

  Future<List> getProducts() async {
    String products = 'products';
    Network network = Network(path: products);
    var productsData = await network.getData();
    productsData.forEach((product) {
      _flashSalesList.add(Product.fromJson(product));
      _list.add(Product.fromJson(product));
    });
    return _flashSalesList;
  }

  // set categorized(List<Product> value) {
  //   _categorized = value;
  //   //  notifyListeners();
  // }

  set flashSalesList(List<Product> value) {
    _flashSalesList = value;
    //  notifyListeners();
  }

  set list(List<Product> value) {
    _list = value;
    //  notifyListeners();
  }

  // UnmodifiableListView<Product> get cartList => UnmodifiableListView(_cartList);

  // void add(Product item) {
  //   _cartList.add(item);

  //   notifyListeners();
  // }

  //   void removeAll() {
  //   _cartList.clear();

  //   notifyListeners();
  // }

  // List<Product> get categorized => _categorized;

  List<Product> get list => _list;

  List<Product> get flashSalesList => _flashSalesList;

  List<Product> get favoritesList => _favoritesList;

  List<Product> get cartList => _cartList;
}
