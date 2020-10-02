import 'package:flutter/material.dart';
import 'package:mandaditos/src/classes/product_class.dart';
import 'package:mandaditos/src/navigation/navigationDrawer.dart';

class ProductDatailsPage extends StatelessWidget {
  static const String routeName = '/productDatailsPage';

  final Product product;
  const ProductDatailsPage({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.nombre),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(5.0),
            child: GestureDetector(
              child: Hero(
                tag: product.id.toString(),
                child: Image.network(
                  product.urlImagen,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Text(
            'Q${product.precio}',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          )
        ],
      ),
      floatingActionButton: Builder(
          builder: (context) => FloatingActionButton.extended(
              onPressed: () {
                // Add your onPressed code here!
                final snackBar = SnackBar(
                    backgroundColor: Colors.green,
                    duration: Duration(milliseconds: 800),
                    content: Text(
                      'Agregado al carrito',
                      style: TextStyle(color: Colors.white),
                    ));

                // Find the Scaffold in the widget tree and use
                // it to show a SnackBar.
                Scaffold.of(context)
                    .showSnackBar(snackBar)
                    .closed
                    .then((value) {
                  Navigator.pop(context);
                });
              },
              label: Text('Agregar'),
              icon: Icon(Icons.shopping_cart))),
    );
  }
}
