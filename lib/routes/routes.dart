import 'package:flutter/material.dart';
import 'package:product_filter/ui/page/filter_page.dart';
import 'package:product_filter/ui/page/product_page.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    "filter": (BuildContext contex) => FilterPage(),
    "products": (BuildContext contex) => ProductPage(),
  };
}