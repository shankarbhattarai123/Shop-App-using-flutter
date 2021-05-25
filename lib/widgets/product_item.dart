import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../providers/products.dart';
import '../Screens/product_details.dart';
import '../models/product.dart';

class ProducItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
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
              onPressed: () {},
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
                          title: product.title,
                          description: product.description,
                          price: product.price,
                        )),
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
