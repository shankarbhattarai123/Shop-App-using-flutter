import 'package:flutter/material.dart';
import '../models/product.dart';
import './product_details.dart';

class ProductOverviewScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://image.shutterstock.com/image-photo/front-back-views-tshirt-on-600w-562774909.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop app'),
        backgroundColor: Colors.red,
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: products.length,
          itemBuilder: (BuildContext ctx, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: GridTile(
                  footer: GridTileBar(
                    backgroundColor: Colors.black87,
                    leading: IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () {},
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
                      products[index].title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetails(
                                  title: products[index].title,
                                  description: products[index].description,
                                  price: products[index].price,
                                )),
                      );
                    },
                    child: Image.network(
                      products[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  )),
            );
          }),
    );
  }
}
