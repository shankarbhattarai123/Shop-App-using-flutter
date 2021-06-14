import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Screens/product_overview.dart';
import './providers/auth.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './Screens/auth_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Auth()),
          ChangeNotifierProxyProvider<Auth, Products>(
              create: (BuildContext ctx) => Products(
                  Provider.of<Products>(ctx).authToken,
                  Provider.of<Products>(ctx).items),
              update: (context, auth, preproducts) => Products(auth.token,
                  preproducts.items == null ? [] : preproducts.items)),
          ChangeNotifierProvider(create: (context) => Cart()),
          ChangeNotifierProvider(create: (context) => Order()),
        ],
        child: Consumer<Auth>(
            builder: (ctx, auth, _) => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Welcome to Flutter',
                home: auth.isAuth ? ProductOverviewScreen() : AuthScreen())));
  }
}
