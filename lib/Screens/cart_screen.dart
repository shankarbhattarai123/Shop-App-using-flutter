import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../providers/orders.dart';
import '../Screens/orders_screen.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      "\$${cart.totalAmount}",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.purple,
                  ),
                  FlatButton(
                    onPressed: () {
                      Provider.of<Order>(context, listen: false).addOrder(
                          cart.items.values.toList(), cart.totalAmount);
                      cart.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrderScreen()),
                      );
                    },
                    child: Text("Order Now"),
                    textColor: Colors.purple,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: cart.itemCount,
            itemBuilder: (context, i) {
              return Dismissible(
                key: ValueKey(cart.items.values.toList()[i].id),
                confirmDismiss: (direction) {
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Delete'),
                        content: Text(
                            'Are you sure that you want to delete the item?'),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pop(false);
                            },
                            child: Text('No'),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pop(true);
                            },
                            child: Text('Yes'),
                          ),
                        ],
                      );
                    },
                  );
                },
                background: Container(
                  color: Colors.grey.shade300,
                  child: Icon(
                    Icons.delete,
                    size: 50,
                  ),
                ),
                onDismissed: (directtion) {
                  cart.removeItem(cart.items.keys.toList()[i]);
                },
                child: Card(
                    elevation: 4,
                    margin: EdgeInsets.all(15),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: ListTile(
                        title: Text('${cart.items.values.toList()[i].title}'),
                        trailing:
                            Text('${cart.items.values.toList()[i].quantity}X'),
                        subtitle: Text(
                            '${cart.items.values.toList()[i].price * cart.items.values.toList()[i].quantity}'),
                        leading: CircleAvatar(
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white,
                          child: FittedBox(
                              child: Text(
                                  '\$${cart.items.values.toList()[i].price}')),
                        ),
                      ),
                    )),
              );
            },
          ))
        ],
      ),
    );
  }
}
