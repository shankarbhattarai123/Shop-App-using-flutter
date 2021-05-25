import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
// import './product_details.dart';
// import '../models/product.dart';
import '../widgets/product_item.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop app'),
        backgroundColor: Colors.red,
      ),
      body: Consumer<Products>(
        builder: (context, item, child) {
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: item.items.length,
              itemBuilder: (BuildContext ctx, i) => ChangeNotifierProvider(
                  create: (c) => item.items[i], child: ProducItem()));
        },
      ),
    );
  }
}
