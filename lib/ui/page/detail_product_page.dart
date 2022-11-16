import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:product_filter/providers/product_provider.dart';
import 'package:product_filter/ui/labels/custom_labels.dart';
import 'package:product_filter/models/product.dart';

class DetailProductPage extends StatelessWidget {

  const DetailProductPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Product? product = Provider.of<ProductProvider>(context).productActive;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("${product!.id}"),
      ),
      backgroundColor: Colors.purple,
      body: product == null? Center(child: Text("loading...", style: CustomLabels.normal,),):
        Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Container(
                height: size.height * 0.35,
                width: size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: Image.network(product.thumbnail).image,
                    fit: BoxFit.cover
                  )
                ),

              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(
                  bottom: 20,
                  left: 20,
                  right: 20
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30))
                ),
                height: size.height * 0.55,
                width: size.width,
                child: Column(
                  children: [
                    const SizedBox(height: 40,),
                    Text(
                      product.title,
                      style: CustomLabels.h2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${product.price}",
                          style: CustomLabels.h1,
                        ),
                        const SizedBox(width: 5,),
                        Text(
                          product.currencyId,
                          style: CustomLabels.h1,
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Available Quantity:", style: CustomLabels.h2,),
                        Text("${product.availableQuantity}", style: CustomLabels.h1,)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sold Quantity:", style: CustomLabels.h2,),
                        Text("${product.soldQuantity}", style: CustomLabels.h1,)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Condition:", style: CustomLabels.h2,),
                        Text("${product.condition}", style: CustomLabels.h1,)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("State Address:", style: CustomLabels.h2,),
                        Text("${product.address.stateName}", style: CustomLabels.h1,)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("City Address:", style: CustomLabels.h2,),
                        Text("${product.address.cityName}", style: CustomLabels.h1,)
                      ],
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
    );
  }

}
