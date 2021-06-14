import 'dart:convert';
import 'package:flutter/foundation.dart';
import './cart.dart';
import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({this.id, this.amount, this.products, this.dateTime});
}

class Order with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> getOrdersResponse() async {
    final url =
        'https://flutter-update-20b7a-default-rtdb.firebaseio.com/orders.json';
    final response = await http.get(Uri.parse(url));
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<OrderItem> loadedProduct = [];
    extractedData.forEach((id, order) {
      loadedProduct.add(OrderItem(
          id: id,
          amount: order['amount'],
          dateTime: DateTime.parse(order['datetime']),
          products: (order['products'] as List<dynamic>)
              .map((e) => CartItem(
                  id: e['id'],
                  title: e['title'],
                  quantity: e['quantity'],
                  price: e['price']))
              .toList()));
    });
    _orders = loadedProduct;
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartprocuts, double total) async {
    final url =
        'https://flutter-update-20b7a-default-rtdb.firebaseio.com/orders.json';
    final time = DateTime.now();
    final response = await http.post(Uri.parse(url),
        body: json.encode({
          'amount': total,
          'dateTime': time.toIso8601String(),
          'products': cartprocuts
              .map((p) => {
                    'id': p.id,
                    'title': p.title,
                    'quantity': p.quantity,
                    'price': p.price
                  })
              .toList()
        }));
    _orders.insert(
        0,
        OrderItem(
            id: json.decode(response.body)['name'],
            amount: total,
            products: cartprocuts,
            dateTime: time));
    notifyListeners();
  }
}
