import 'package:flutter/material.dart';
import 'package:mandaditos/src/navigation/navigationDrawer.dart';

class shoppingCartPage extends StatelessWidget {
  static const String routeName = '/shoppingCartPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Carrito'),
        ),
        body: Column(
          children: [
            Card(
              child: Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(color: Colors.blue),
                height: MediaQuery.of(context).size.height * 0.65,
                child: ListView(
                  children: List.generate(15, (index) => CartItemProduct()),
                ),
              ),
            )
          ],
        ));
  }
}

class CartItemProduct extends StatelessWidget {
  const CartItemProduct({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            leading: FlutterLogo(),
            title: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Producto'),
                        Text('Precio Unitario'),
                        Text('Subtotal')
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 15.0,
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
                            child:
                                Text('100', style: TextStyle(fontSize: 20.0))),
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
            )));
  }
}
