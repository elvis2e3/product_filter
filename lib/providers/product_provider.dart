import 'package:flutter/material.dart';
import 'package:product_filter/api/client_api.dart';
import 'package:product_filter/models/filtered_data.dart';
import 'package:product_filter/models/product.dart';


class ProductProvider extends ChangeNotifier {

  FilteredData? filteredData;
  Product? productActive;

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

}