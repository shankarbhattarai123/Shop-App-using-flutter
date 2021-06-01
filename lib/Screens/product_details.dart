import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class ProductDetails extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  ProductDetails(
      {this.id, this.title, this.description, this.price, this.imageUrl});
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 20),
            height: 300,
            width: double.infinity,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              child: Column(
            children: [
              ListTile(
                leading: Chip(
                  padding: EdgeInsets.all(20),
                  backgroundColor: Colors.purple,
                  label: Text('Price:  \$ ${price}',
                      style: TextStyle(color: Colors.white)),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    cart.addItem(id, title, price);
                  },
                  child: Chip(
                    padding: EdgeInsets.all(20),
                    backgroundColor: Colors.deepPurple,
                    label: Text('Add To Cart',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
