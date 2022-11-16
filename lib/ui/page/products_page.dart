import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:product_filter/providers/product_provider.dart';
import 'package:product_filter/models/filtered_data.dart';
import 'package:product_filter/models/product.dart';
import 'package:product_filter/ui/labels/custom_labels.dart';

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
                child: _image(product.thumbnail),
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
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            ProductProvider productProvider = Provider.of<ProductProvider>(context, listen: false);
                            productProvider.setProductActive(product);
                            Navigator.pushNamed(context, "detail_product");
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder( borderRadius: BorderRadius.circular(10)),
                            )
                          ),
                          child: Container(
                            width: size.width * 0.35,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(
                              product.like?Icons.favorite:Icons.favorite_border,
                              color: Colors.white,
                            )
                          ),
                        )
                      ],
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

  Widget _image(String image){
    return FadeInImage(
      image: NetworkImage(image),
      placeholder: const AssetImage('assets/product_default.jpg'),
      fit: BoxFit.cover,
    );
  }

}
