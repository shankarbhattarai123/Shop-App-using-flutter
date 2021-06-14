import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import '../models/product.dart';

class EditProductScreen extends StatefulWidget {
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final pricefocus = FocusNode();
  final desfocus = FocusNode();
  var _isLoading = false;
  var _editedProduct =
      Product(id: null, title: '', description: '', price: 0, imageUrl: '');
  @override
  void dispose() {
    pricefocus.dispose();
    desfocus.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isvalid = _formKey.currentState.validate();
    if (!isvalid) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    _formKey.currentState.save();
    Provider.of<Products>(context, listen: false)
        .add(_editedProduct)
        .catchError((error) {
      return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text("An error occured"),
                content: Text("something went wrong."),
                actions: <Widget>[
                  TextButton(
                    child: Text('okey'),
                    onPressed: () {
                      setState(() {
                        _isLoading = false;
                      });
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ));
    }).then((_) {
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pop();
    });
  }

  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
                title: Text('Edit Product'),
                backgroundColor: Colors.purple,
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _saveForm();
                    },
                  )
                ]),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    // Add TextFormFields and ElevatedButton here.
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Title'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(pricefocus);
                      },
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter product title';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                            id: null,
                            title: value,
                            description: _editedProduct.description,
                            price: _editedProduct.price,
                            imageUrl: _editedProduct.imageUrl);
                      },
                    ),
                    TextFormField(
                      focusNode: pricefocus,
                      decoration: InputDecoration(labelText: 'Price'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(desfocus);
                      },
                      keyboardType: TextInputType.number,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter product price';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                            id: null,
                            title: _editedProduct.title,
                            description: _editedProduct.description,
                            price: double.parse(value),
                            imageUrl: _editedProduct.imageUrl);
                      },
                    ),
                    TextFormField(
                      focusNode: desfocus,

                      decoration: InputDecoration(labelText: 'description'),
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter product description';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                            id: null,
                            title: _editedProduct.title,
                            description: value,
                            price: _editedProduct.price,
                            imageUrl: _editedProduct.imageUrl);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'ImageUrl'),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter product imageUrl';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                            id: null,
                            title: _editedProduct.title,
                            description: _editedProduct.description,
                            price: _editedProduct.price,
                            imageUrl: value);
                      },
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                    ),
                  ],
                ),
              ),
            ));
  }
}
