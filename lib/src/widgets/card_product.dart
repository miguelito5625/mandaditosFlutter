import 'package:flutter/material.dart';
import 'package:mandaditos/src/pages/productDetailsPage.dart';

class CardProduct extends StatelessWidget {
  final String id;
  final String productName;
  final String price;
  final String thumbnailUrl;
  final String url;
  const CardProduct(
      {Key key,
      this.id,
      this.productName,
      this.price,
      this.thumbnailUrl,
      this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18.0 / 11.0,
                child: GestureDetector(
                  child: Hero(tag: id, child: Image.network(thumbnailUrl)),
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 800),
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return ProductDatailsPage(
                            heroTag: id,
                            url: url,
                            productName: productName,
                          );
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
              Text(productName),
              SizedBox(height: 8.0),
              Text(price)
            ],
          )),
    );
  }
}
