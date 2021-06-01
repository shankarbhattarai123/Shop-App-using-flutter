import 'package:flutter/material.dart';
import '../Screens/product_overview.dart';
import '../Screens/orders_screen.dart';
import '../Screens/user_Products.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Shop App"),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.green,
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Shop"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductOverviewScreen()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Orders"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderScreen()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Manage your products"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Userprodcuts()),
              );
            },
          ),
          Divider()
        ],
      ),
    );
  }
}
