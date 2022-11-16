import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:product_filter/api/client_api.dart';
import 'package:product_filter/models/filtered_data.dart';
import 'package:product_filter/models/product.dart';
import 'package:product_filter/services/local_storage.dart';


class ProductProvider extends ChangeNotifier {

  FilteredData? filteredData;
  Product? productActive;
  Map<String, Product> favorites = {};

  Future<bool> getProducts(String search) async {
    final data = await ApiClient().getProducts(search);
    if(data.status){
      filteredData = data.data;
      notifyListeners();
    }
    return true;
  }

  setProductActive(Product product) async {
    productActive = product;
    notifyListeners();
  }

  setProductFavorite(Product product) async {
    favorites[product.id] = product;
    final _favorites = favorites.values;
    List<String> favoriteSave = [];
    _favorites.forEach((element) {
      Map<String, dynamic> _product = element.toJson();
      String _productString = jsonEncode(_product);
      favoriteSave.add(_productString);
    });
    LocalStorage.favorites = favoriteSave;
    notifyListeners();
  }

  deleteProductFavorite(Product product) async {
    favorites.remove(product.id);
    final _favorites = favorites.values;
    List<String> favoriteSave = [];
    _favorites.forEach((element) {
      Map<String, dynamic> _product = element.toJson();
      String _productString = jsonEncode(_product);
      favoriteSave.add(_productString);
    });
    LocalStorage.favorites = favoriteSave;
    notifyListeners();
  }

  List<Product> loadFavorites(){
    if(favorites.isEmpty){
      List<String> _favorites = LocalStorage.favorites;
      _favorites.forEach((element) {
        Product product = Product.fromJson(jsonDecode(element));
        favorites[product.id] = product;
      });
    }
    return favorites.values.toList();
  }

}