import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/src/models/product.dart';
import 'package:ecommerce_app_ui_kit/src/services/network.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Category {
  int id;
  String name;
  bool selected;
  IconData icon;
  List<Product> products;

  Category(this.id, this.name, this.icon, this.selected, this.products);

  factory Category.fromJson(dynamic category) {
    return Category(
      category['id'],
      category['name'],
      // category['icon'],
      UiIcons.shoe_1,
      false,
      [],
    );
  }
}

class SubCategory {
  int id;
  String name;
  bool selected;
  List<Product> products;
  int parent;

  SubCategory(this.id, this.name, this.selected, this.products, this.parent);
  factory SubCategory.fromJson(dynamic sub) {
    return SubCategory(sub['id'], sub['name'], false, [], sub['parent']);
  }
}

class CategoriesList with ChangeNotifier {
  NetworkWoocommerce get network => GetIt.I<NetworkWoocommerce>();
  var categoriesData;
  Future<void> getCategories() async {
    setLoading(true);

    String categories = 'products/categories?per_page=100';
    categoriesData = await network.getData(categories);
    setLoading(false);
    categoriesData.forEach((category) {
      if (category['display'] == 'default')
        addCategoriesList(Category.fromJson(category));
      // _listSub.add(SubCategory.fromJson(category));
    });
  }
 bool isFetched = false;

  List<Category> _list;

void addCategoriesList(Category item) {
    _list.add(item);
    notifyListeners();
  }
 void setLoading(value) {
    isFetched = value;
    notifyListeners();
  }

  bool isLoading() {
    return isFetched;
  }


  int get itemCount {
    return _list.length == null ? 0 : _list.length;
  }
  List<Category> get list => _list;

  CategoriesList() {
    this._list = [];
  }

  selectById(String id) {
    this._list.forEach((Category category) {
      category.selected = false;
      if (category.id.toString() == id) {
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

class SubCategoriesList with ChangeNotifier {
  CategoriesList get _categoriesList => GetIt.I<CategoriesList>();
  getSubCategory() {
    var subCategories = _categoriesList.categoriesData;
    if (subCategories != null) {
      subCategories.forEach((sub) {
        if (sub['display'] != 'default') addSubCategoriesList(SubCategory.fromJson(sub));
      });
 
    }
  }

  List<SubCategory> _list;

  List<SubCategory> get list => _list;
void addSubCategoriesList(SubCategory item) {
    _list.add(item);
    notifyListeners();
  }


  int get itemCount {
    return _list.length == null ? 0 : _list.length;
  }
  SubCategoriesList() {
    this._list = [];
  }

  selectById(String id) {
    this._list.forEach((SubCategory subCategory) {
      subCategory.selected = false;
      if (subCategory.id.toString() == id) {
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
