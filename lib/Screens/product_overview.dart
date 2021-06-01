import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/product_item.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import '../Screens/cart_screen.dart';
import '../widgets/app_drawer.dart';

enum filteroptions {
  favorite,
  all,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showOnlyFavorite = false;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final item = Provider.of<Products>(context, listen: true);
    final items = _showOnlyFavorite ? item.favoriteItem : item.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop app'),
        backgroundColor: Colors.red,
        actions: [
          PopupMenuButton(
            onSelected: (filteroptions selected) {
              setState(() {
                if (selected == filteroptions.favorite) {
                  _showOnlyFavorite = true;
                } else {
                  _showOnlyFavorite = false;
                }
              });
            },
            itemBuilder: (ctx) => [
              const PopupMenuItem(
                value: filteroptions.favorite,
                child: Text('Only favorites'),
              ),
              const PopupMenuItem(
                value: filteroptions.all,
                child: Text('Show All'),
              ),
            ],
          ),
          Badge(
            value: cart.itemCount.toString(),
            child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                }),
          )
        ],
      ),
      drawer: AppDrawer(),
      // body: Consumer<Products>(
      //   builder: (context, item, child) {
      //
      //     return
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: item.items.length,
          itemBuilder: (BuildContext ctx, i) => ChangeNotifierProvider(
              create: (c) => items[i], child: ProducItem())),
    );
  }
}
