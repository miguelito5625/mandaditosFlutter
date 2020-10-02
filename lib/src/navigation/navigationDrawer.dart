import 'package:flutter/material.dart';
import 'package:mandaditos/src/navigation/createDrawerHeader.dart';
import 'package:mandaditos/src/pages/contactPage.dart';
import 'package:mandaditos/src/pages/eventPage.dart';
import 'package:mandaditos/src/pages/homePage.dart';
import 'package:mandaditos/src/pages/notificationPage.dart';
import 'package:mandaditos/src/pages/profilePage.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class NavigationDrawer extends StatefulWidget {
  final drawerItems = [
    DrawerItem("Home", Icons.home),
    DrawerItem("Profile", Icons.account_circle),
    DrawerItem("Events", Icons.event_note),
    DrawerItem("Notifications", Icons.notifications_active),
    DrawerItem("Contact info", Icons.contact_phone)
  ];

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new homePage();
      case 1:
        return new profilePage();
      case 2:
        return new eventPage();
      case 3:
        return new notificationPage();
      case 4:
        return new contactPage();
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(Container(
        padding: EdgeInsets.all(5.0),
        child: Card(
          child: ListTile(
            trailing: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          ),
        ),
      ));
      // Divider(height: 2.0);
    }

    return Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/shoppingCartPage');
                },
                child: Icon(
                  Icons.shopping_cart,
                  size: 26.0,
                ),
              ))
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            createDrawerHeader(),
            Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
