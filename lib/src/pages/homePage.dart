import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mandaditos/src/navigation/navigationDrawer.dart';
import 'package:mandaditos/src/services/products/products_service.dart';
import 'package:mandaditos/src/widgets/card_product.dart';

class homePage extends StatelessWidget {
  static const String routeName = '/homePage';

  void prueba() {
    ProductService.getPhotos().then((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    prueba();
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(15, (index) {
          return CardProduct(
            title: 'Elemento $index',
            price: 'Q' +
                (Random().nextDouble() * (100 - index) + index)
                    .toStringAsFixed(2),
          );
        }),
      ),
    );
  }
}
