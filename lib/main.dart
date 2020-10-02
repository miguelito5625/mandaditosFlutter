import 'package:flutter/material.dart';
import 'package:mandaditos/src/navigation/navigationDrawer.dart';
import 'package:mandaditos/src/pages/contactPage.dart';
import 'package:mandaditos/src/pages/eventPage.dart';
import 'package:mandaditos/src/pages/homePage.dart';
import 'package:mandaditos/src/pages/notificationPage.dart';
import 'package:mandaditos/src/pages/products/shoppingCartPage.dart';
import 'package:mandaditos/src/pages/profilePage.dart';
import 'package:mandaditos/src/providers/products_provider.dart';
import 'package:mandaditos/src/routes/pageRoute.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      // DeviceOrientation.landscapeLeft,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductsProvider())
      ],
      child: new MaterialApp(
        title: 'NavigationDrawer Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NavigationDrawer(),
        routes: {
          pageRoutes.home: (context) => homePage(),
          pageRoutes.contact: (context) => contactPage(),
          pageRoutes.event: (context) => eventPage(),
          pageRoutes.profile: (context) => profilePage(),
          pageRoutes.notification: (context) => notificationPage(),
          pageRoutes.shoppingCart: (context) => shoppingCartPage(),
        },
      ),
    );
  }
}
