import 'package:flutter/material.dart';
import 'package:mandaditos/src/navigation/navigationDrawer.dart';

class ProductDatailsPage extends StatelessWidget {
  static const String routeName = '/productDatailsPage';

  final String heroTag;
  final String url;
  final String productName;
  const ProductDatailsPage({Key key, this.heroTag, this.url, this.productName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: GestureDetector(
              child: Hero(
                tag: heroTag,
                child: Image.network(
                  url,
                ),
              ),
              onTap: () {
                // Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
