import 'dart:math';

import 'package:flutter/material.dart';
import '../providers/orders.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;
  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('Total Amount: \$ ${widget.order.amount}'),
            subtitle: Text(
                DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
                icon: _expanded
                    ? Icon(Icons.expand_less)
                    : Icon(Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                }),
          ),
          if (_expanded)
            Container(
              height: min(widget.order.products.length * 20.0 + 100, 100),
              child: ListView(
                children: widget.order.products
                    .map((prod) => ListTile(
                        leading: Text(
                          '${prod.title}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        title: Text('${prod.quantity}x',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                        trailing: Text(' \$${prod.price * prod.quantity}',
                            style: TextStyle(
                              fontSize: 18,
                            ))))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
