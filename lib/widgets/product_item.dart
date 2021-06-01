import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Screens/product_details.dart';
import '../models/product.dart';
import '../providers/cart.dart';

class ProducItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(
                  product.isfavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                product.favoriteToggleStatus();
              },
              iconSize: 35,
              color: Colors.orange,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addItem(
                  product.id,
                  product.title,
                  product.price,
                );
                final snackBar = SnackBar(
                  content: Text('1 item added to your cart'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      cart.removeSingleItem(product.id);
                    },
                  ),
                );
                Scaffold.of(context).showSnackBar(snackBar);
              },
              iconSize: 35,
              color: Colors.orange,
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetails(
                        id: product.id,
                        title: product.title,
                        description: product.description,
                        price: product.price,
                        imageUrl: product.imageUrl)),
              );
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
