import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mandaditos/src/navigation/navigationDrawer.dart';
import 'package:mandaditos/src/services/products/photos_service.dart';
import 'package:mandaditos/src/services/products/products_service.dart';
import 'package:mandaditos/src/widgets/card_product.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class homePage extends StatelessWidget {
  static const String routeName = '/homePage';

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 5.0),
        child: FutureBuilder(
          future: ProductService.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardProduct(
                      id: snapshot.data[index].id.toString(),
                      thumbnailUrl: snapshot.data[index].urlMiniaturaImagen,
                      url: snapshot.data[index].urlImagen,
                      productName: snapshot.data[index].nombre,
                      price: snapshot.data[index].precio.toString(),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ));
  }
}
