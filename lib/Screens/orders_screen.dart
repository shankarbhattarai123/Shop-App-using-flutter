import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart' show Order;
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OrderData = Provider.of<Order>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Orders"),
          backgroundColor: Colors.orange,
        ),
        drawer: AppDrawer(),
        body: ListView.builder(
          itemCount: OrderData.orders.length,
          itemBuilder: (context, index) {
            return OrderItem(OrderData.orders[index]);
          },
        ));
  }
}
