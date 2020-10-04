import 'package:flutter/material.dart';
import 'package:mandaditos/src/classes/product_class.dart';

class CartItemProduct extends StatelessWidget {
  final Product product;
  const CartItemProduct({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          child: Card(
            child: ListTile(
                leading: Image.network(product.urlMiniaturaImagen),
                title: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.nombre),
                            Text(product.precio),
                            Text('Subtotal')
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 20.0,
                              height: 20.0,
                              margin: EdgeInsets.only(right: 10.0),
                              child: RawMaterialButton(
                                elevation: 2.0,
                                fillColor: Colors.blue,
                                shape: CircleBorder(),
                                onPressed: () {},
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 15.0,
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(right: 10.0),
                                child: Text(product.cantidad.toString(),
                                    style: TextStyle(fontSize: 20.0))),
                            Container(
                              width: 20.0,
                              height: 20.0,
                              child: RawMaterialButton(
                                elevation: 2.0,
                                fillColor: Colors.blue,
                                shape: CircleBorder(),
                                onPressed: () {},
                                child: Icon(
                                  const IconData(0xe15b,
                                      fontFamily: 'MaterialIcons'),
                                  color: Colors.white,
                                  size: 15.0,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 5.0),
          width: MediaQuery.of(context).size.width * 0.94,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.delete,
                size: 25.0,
              )
            ],
          ),
        ),
      ],
    );
  }
}
