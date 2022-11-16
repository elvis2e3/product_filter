import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:product_filter/providers/filter_form_provider.dart';
import 'package:product_filter/providers/product_provider.dart';
import 'package:product_filter/ui/labels/custom_labels.dart';
import 'package:product_filter/ui/cards/card_product.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    List favorites = productProvider.favorites.values.toList();

    return Scaffold(
      body: ChangeNotifierProvider(
        create: ( _ ) => FilterFormProvider(),
        child: Builder(builder: ( context ){
          final filterFormProvider = Provider.of<FilterFormProvider>(context, listen: false);
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: filterFormProvider.formKey,
                    child: Column(
                      children: [
                        Text(
                          "Filter Products",
                          style: CustomLabels.h1,
                        ),
                        const SizedBox(height: 30,),
                        // Filter
                        TextFormField(
                          style: CustomLabels.normal,
                          onFieldSubmitted: ( _ ) => onFormSubmit(context, filterFormProvider, productProvider),
                          onChanged: ( value ) => filterFormProvider.text_filter = value,
                          validator: ( value ) {
                            if ( value == null || value.isEmpty ) return 'This field must not be empty';
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)
                            ),
                            hintText: "Search product ...",
                            labelText: "Search product",
                            prefixIcon: const Icon(Icons.search),
                          ),
                        ),
                        const SizedBox( height: 20 ),
                        OutlinedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder( borderRadius: BorderRadius.circular(25)),
                            ),
                          ),
                          onPressed: () => onFormSubmit(context, filterFormProvider, productProvider),
                          child: Padding(
                            padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 8),
                            child: Text(
                              "Search",
                              style: CustomLabels.h2,
                            ),
                          )
                        ),
                        const SizedBox( height: 20 ),
                      ],
                    )
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: Text(
                    "Favorite Products",
                    style: CustomLabels.h1,
                  ),
                ),
                ...favorites.map((product){
                  return cardProduct(context, product);
                }).toList()
              ],
            ),
          );
        })
      ),
    );
  }

  void onFormSubmit(
    BuildContext context,
    FilterFormProvider filterFormProvider,
    ProductProvider productProvider
    ) async {
    final isValid = filterFormProvider.validateForm();
    if ( isValid ){
      await productProvider.getProducts(filterFormProvider.text_filter);
      Navigator.pushNamed(context, "products");
    }
  }

}
