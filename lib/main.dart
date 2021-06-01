import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Screens/product_overview.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Products()),
          ChangeNotifierProvider(create: (context) => Cart()),
          ChangeNotifierProvider(create: (context) => Order()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Welcome to Flutter',
            home: ProductOverviewScreen()));
  }
}
