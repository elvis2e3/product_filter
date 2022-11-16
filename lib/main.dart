import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:product_filter/ui/page/filter_page.dart';
import 'package:product_filter/routes/routes.dart';
import 'package:product_filter/services/local_storage.dart';
import 'package:product_filter/providers/product_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => ProductProvider()),
      ],
      child: MaterialApp(
        title: 'Prduct Filter',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        debugShowCheckedModeBanner: false,
        home: const FilterPage(),
        initialRoute: "filter",
        routes: getRoutes(),
      ),
    );
  }
}
