import 'package:flutter/material.dart';
import 'package:mandaditos/src/navigation/navigationDrawer.dart';

class eventPage extends StatelessWidget {
  static const String routeName = '/eventPage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(child: Text("Hey! this is events list page")));
  }
}
