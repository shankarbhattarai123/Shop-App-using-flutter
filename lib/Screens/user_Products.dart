import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';
import '../widgets/user_Product_Item.dart';

class Userprodcuts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Your products"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: Product.items.length,
        itemBuilder: (c, i) {
          return Column(
            children: [
              UserProductItem(
                title: Product.items[i].title,
                imageUrl: Product.items[i].imageUrl,
              ),
              Divider()
            ],
          );
        },
      ),
    );
  }
}
