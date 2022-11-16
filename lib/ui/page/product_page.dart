import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:product_filter/providers/product_provider.dart';
import 'package:product_filter/models/filtered_data.dart';
import 'package:product_filter/models/product.dart';
import 'package:product_filter/ui/labels/custom_labels.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

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
        children: filteredData.results.map((Product product) => _cardProduct(context, product)).toList(),
      ),
    );
  }

  Widget _cardProduct(BuildContext context, Product product){
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: size.width * 0.3,
                padding: EdgeInsets.only(right: 10),
                child: product.useThumbnailId?
                  FadeInImage(
                    image: NetworkImage(product.thumbnail),
                    placeholder: const AssetImage('assets/product_default.jpg'),
                    fit: BoxFit.cover,
                  ):
                  const Image(image: AssetImage('assets/product_default.jpg')),
              ),
              SizedBox(
                width: size.width * 0.55,
                child: Column(
                  children: [
                    Text(
                      product.title,
                      style: CustomLabels.normal,
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.purple
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${product.price}",
                            style: CustomLabels.h1White,
                          ),
                          const SizedBox(width: 5,),
                          Text(
                            product.currencyId,
                            style: CustomLabels.h1BoldWhite,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
