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

class CategoryNameId {
  String id;
  String name;
  CategoryNameId({this.id, this.name});
}

class SubCategory {
  int id;
  String name;
  bool selected;
  List<Product> products;

  SubCategory(this.id, this.name, this.selected, this.products);
  factory SubCategory.fromJson(dynamic sub) {
    return SubCategory(
      sub['id'],
      sub['name'],
      false,
      [],
    );
  }
}

class CategoriesList {
  // hat kol al categories && a3ml forEach 3liha hotaha fi list return list
  // Future<List<CategoryNameId>> getCategoryNameId() async {
  //   String path = 'products/categories';
  //   Network network = Network();
  //   var categoriesData = await network.getData(path);
  //   final data = jsonDecode(categoriesData);
  //   data.forEach((categoryNameAndId) {
  //     var nameAndId = CategoryNameId(
  //       id: categoryNameAndId['id'],
  //       name: categoryNameAndId['name'],
  //     );

  //     listNameId.add(nameAndId);
  //   });
  //   return _listNameId;
  // }
  // Category(
  //   category['id'],
  //   category['name'],
  //   UiIcons.shoe_1,
  //   false,
  //   category['images'] == [] ? '' : category['images'][0]['src'],
  // );
  var categoriesData;
  Future<List> getCategories() async {
    String categories = 'products/categories';
    Network network = Network(path:categories);
    categoriesData = await network.getData();
    categoriesData.forEach((category) {
        _list.add(Category.fromJson(category));
      // _list.add(Category.fromJson(product));
    });
    return _list;
  }

  // CategoryService get categoryService => GetIt.I<CategoryService>();

  List<Category> _list;
  // List<CategoryNameId> _listNameId;

  set list(List<Category> value) {
    _list = value;
  }

  List<Category> get list => _list;
  // List<CategoryNameId> get listNameId => _listNameId;

  CategoriesList() {
    // this._listNameId = [];
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

class SubCategoriesList {
  CategoriesList get _categoriesList => GetIt.I<CategoriesList>();
  getSubCategory() {
    var subCategories = _categoriesList.categoriesData;
    if (subCategories == null) {
      subCategories.forEach((sub) {
        if(sub['display'] == 'default')
        _list.add(SubCategory.fromJson(sub));
      });
      return _list;
    }
  }

  List<SubCategory> _list;

  List<SubCategory> get list => _list;
  set list(List<SubCategory> value) => _list = value;

  SubCategoriesList() {
    this._list = [
     
    ];
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
