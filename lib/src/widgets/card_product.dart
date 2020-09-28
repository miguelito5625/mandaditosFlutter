import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final String title;
  final String price;
  const CardProduct({Key key, this.title, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 18.0 / 11.0,
            child: Image.asset('assets/imagenes/doritos.png'),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title),
                SizedBox(height: 8.0),
                Text(price),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
