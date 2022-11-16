import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:product_filter/providers/product_provider.dart';
import 'package:product_filter/models/filtered_data.dart';
import 'package:product_filter/models/product.dart';
import 'package:product_filter/ui/labels/custom_labels.dart';
import 'package:product_filter/ui/cards/card_product.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {

  @override
  Widget build(BuildContext context) {

    FilteredData? filteredData = Provider.of<ProductProvider>(context).filteredData;

    return Scaffold(
      appBar: AppBar(
        title: Text("Products", style: CustomLabels.normal,),
      ),
      body: filteredData == null?
      Center(child: Text("loading...", style: CustomLabels.normal,),):
      ListView(
        children: filteredData.results.map((Product product) => cardProduct(context, product)).toList(),
      ),
    );
  }



}
