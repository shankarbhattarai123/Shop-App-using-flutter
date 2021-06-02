import 'package:flutter/material.dart';
import '../models/product.dart';

class Products extends ChangeNotifier {
  final List<Product> _items = [
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
    // Product(
    //   id: 'p5',
    //   title: 'speaker',
    //   description: 'listen loud and clear music.',
    //   price: 499.99,
    //   imageUrl:
    //       'https://images.pexels.com/photos/2651794/pexels-photo-2651794.jpeg',
    // ),
    // Product(
    //   id: 'p6',
    //   title: 'face wash cream',
    //   description: 'keep your face clean and sharp.',
    //   price: 456.99,
    //   imageUrl:
    //       'https://images.pexels.com/photos/3685530/pexels-photo-3685530.jpeg',
    // ),
    // Product(
    //   id: 'p7',
    //   title: 'bag',
    //   description: 'Be stylish by using branded stuff',
    //   price: 750.50,
    //   imageUrl:
    //       'https://images.pexels.com/photos/2081199/pexels-photo-2081199.jpeg',
    // ),
    // Product(
    //   id: 'p8',
    //   title: 'VR(virtual reality)',
    //   description: 'Experience the world in different way',
    //   price: 2240,
    //   imageUrl:
    //       'https://images.pexels.com/photos/3761124/pexels-photo-3761124.jpeg',
    // ),
    // Product(
    //   id: 'p9',
    //   title: 'heater',
    //   description: 'keep warm your body',
    //   price: 1260,
    //   imageUrl:
    //       'https://images.pexels.com/photos/923289/pexels-photo-923289.jpeg',
    // ),
    // Product(
    //   id: 'p10',
    //   title: 'mask',
    //   description: 'be safe from corona in this pandemic',
    //   price: 160.50,
    //   imageUrl:
    //       'https://images.pexels.com/photos/3786126/pexels-photo-3786126.jpeg',
    // ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItem {
    return _items.where((element) => element.isfavorite).toList();
  }

  void add(Product p) {
    final newProduct = Product(
        id: p.id,
        title: p.title,
        description: p.description,
        price: p.price,
        imageUrl: p.imageUrl);
    _items.add(newProduct);

    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeitem(String id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
