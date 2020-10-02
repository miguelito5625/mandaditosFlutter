import 'package:flutter/material.dart';
import 'package:mandaditos/src/classes/product_class.dart';
import 'package:mandaditos/src/pages/productDetailsPage.dart';

class CardProduct extends StatelessWidget {
  final Product product;
  const CardProduct({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // clipBehavior: Clip.antiAlias,
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18.0 / 11.0,
                child: GestureDetector(
                  child: Hero(
                      tag: product.id.toString(),
                      child: Image.network(product.urlMiniaturaImagen)),
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 800),
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return ProductDatailsPage(product: product);
                        },
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return Align(
                            child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(product.nombre),
              SizedBox(height: 8.0),
              Text('Q${product.precio}')
            ],
          )),
    );
  }
}
