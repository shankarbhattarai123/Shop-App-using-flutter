import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  ProductDetails({this.title, this.description, this.price});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(title),
      ),
      body: Container(
        child: Center(child: Text("$title details page")),
      ),
    );
  }
}
