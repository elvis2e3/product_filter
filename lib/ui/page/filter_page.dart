import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:product_filter/providers/filter_form_provider.dart';
import 'package:product_filter/providers/product_provider.dart';
import 'package:product_filter/ui/labels/custom_labels.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      body: ChangeNotifierProvider(
        create: ( _ ) => FilterFormProvider(),
        child: Builder(builder: ( context ){
          final filterFormProvider = Provider.of<FilterFormProvider>(context, listen: false);
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
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
          );
        })
      ),
    );
  }

  void onFormSubmit(
    BuildContext context,
    FilterFormProvider filterFormProvider,
    ProductProvider productProvider
    ) {
    final isValid = filterFormProvider.validateForm();
    if ( isValid ){
      productProvider.getProducts(filterFormProvider.text_filter);
      Navigator.pushNamed(context, "products");
    }
  }

}