import 'package:flutter/material.dart';
import 'package:product_filter/api/client_api.dart';
import 'package:product_filter/models/filtered_data.dart';


class ProductProvider extends ChangeNotifier {

  FilteredData? filteredData;

  getProducts(String search) async {
    final data = await ApiClient().getProducts(search);
    if(data.status){
      this.filteredData = data.data;
      notifyListeners();
    }
  }

}