import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:http/http.dart' as http;

class Products extends ChangeNotifier {
  List<Product> _items = [];

  final String authToken;
  Products(this.authToken, this._items);

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItem {
    return _items.where((element) => element.isfavorite).toList();
  }

  Future<void> getResponse() async {
    final url =
        'https://flutter-update-20b7a-default-rtdb.firebaseio.com/products.json?auth=$authToken';
    final response = await http.get(Uri.parse(url));
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Product> loadedProduct = [];
    extractedData.forEach((id, prod) {
      loadedProduct.add(Product(
          id: id,
          title: prod['title'],
          description: prod['description'],
          price: prod['price'],
          imageUrl: prod['imageUrl'],
          isfavorite: prod['isFavorite']));
    });
    _items = loadedProduct;
    notifyListeners();
  }

  Future<void> add(Product p) async {
    final url =
        'https://flutter-update-20b7a-default-rtdb.firebaseio.com/products.json?auth=$authToken';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'title': p.title,
          'description': p.description,
          'imageUrl': p.imageUrl,
          'price': p.price,
          'isFavorite': p.isfavorite
        }),
      );

      final newProduct = Product(
        id: json.decode(response.body)['name'],
        title: p.title,
        description: p.description,
        price: p.price,
        imageUrl: p.imageUrl,
      );

      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  void removeitem(String id) async {
    final url =
        'https://flutter-update-20b7a-default-rtdb.firebaseio.com/products/$id.json?auth=$authToken';

    _items.removeWhere((element) => element.id == id);
    await http.delete(Uri.parse(url));
    notifyListeners();
  }
}
