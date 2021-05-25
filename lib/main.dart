import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Screens/product_overview.dart';
import './providers/products.dart';

void main() => runApp(
    ChangeNotifierProvider(create: (context) => Products(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Welcome to Flutter',
        home: ProductOverviewScreen());
  }
}
