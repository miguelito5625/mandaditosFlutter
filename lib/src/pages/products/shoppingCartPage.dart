import 'package:flutter/material.dart';
import 'package:mandaditos/src/navigation/navigationDrawer.dart';
import 'package:mandaditos/src/providers/products_provider.dart';
import 'package:mandaditos/src/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class shoppingCartPage extends StatelessWidget {
  static const String routeName = '/shoppingCartPage';

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Carrito ${productsProvider.products.length}'),
        ),
        body: Column(
          children: [
            Card(
              child: Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(color: Colors.blue),
                height: MediaQuery.of(context).size.height * 0.65,
                child: ListView.builder(
                  itemCount: productsProvider.products.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return CartItemProduct(
                        product: productsProvider.products[index]);
                  },
                ),
              ),
            )
          ],
        ));
  }
}
