import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart' show Order;
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var _loading = false;
  @override
  void initState() {
    setState(() {
      _loading = true;
    });

    Future.delayed(Duration.zero).then((_) async {
      await Provider.of<Order>(context, listen: false).getOrdersResponse();
      setState(() {
        _loading = false;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    final OrderData = Provider.of<Order>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Text("Your Orders"),
          backgroundColor: Colors.orange,
        ),
        drawer: AppDrawer(),
        body: _loading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: OrderData.orders.length,
                itemBuilder: (context, index) {
                  return OrderItem(OrderData.orders[index]);
                },
              ));
  }
}
