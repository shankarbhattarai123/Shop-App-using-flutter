import 'package:flutter/material.dart';
import '../Screens/edit_product_screen.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  UserProductItem({this.id, this.title, this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        title: Text(title),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProductScreen()),
                    );
                  }),
              SizedBox(
                width: 5,
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  Provider.of<Products>(context, listen: false).removeitem(id);
                },
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
