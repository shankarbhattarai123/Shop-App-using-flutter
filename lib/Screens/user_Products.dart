import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';
import '../widgets/user_Product_Item.dart';
import '../Screens/edit_product_screen.dart';

class Userprodcuts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Your products"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProductScreen()),
              );
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: product.items.length,
        itemBuilder: (c, i) {
          return Column(
            children: [
              UserProductItem(
                id: product.items[i].id,
                title: product.items[i].title,
                imageUrl: product.items[i].imageUrl,
              ),
              Divider()
            ],
          );
        },
      ),
    );
  }
}
