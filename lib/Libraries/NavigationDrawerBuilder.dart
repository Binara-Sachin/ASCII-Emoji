import 'package:ascii_emoji/Pages/FavoritesPage.dart';
import 'package:ascii_emoji/Pages/SettingsPage.dart';

import 'package:flutter/material.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

final drawerItemsMain = [
  new DrawerItem("ASCII Emoji", Icons.filter_vintage),
  new DrawerItem("Favorites", Icons.favorite),
  new DrawerItem("Upgrade to Pro", Icons.polymer),
  new DrawerItem("Settings", Icons.settings),
  new DrawerItem("Send Feedback", Icons.feedback),
];

class NavigationDrawerBuilder extends StatelessWidget {
  _getDrawerOptionsWidget(BuildContext context) {
    var drawerOptions = <Widget>[];

    for (var i = 0; i < drawerItemsMain.length; i++) {
      var drawerItem = drawerItemsMain[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(drawerItem.icon),
        title: new Text(drawerItem.title),
        onTap: () => _onSelectItem(i, context),
      ));
    }
    return drawerOptions;
  }

  _onSelectItem(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.pop(context);
        break;
      case 1:
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FavoritesPage()),
        );
        break;
      case 3:
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        break;
    }
  }

  const NavigationDrawerBuilder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new Column(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text(
              "ASCII Emoji",
              style: TextStyle(fontSize: 20.0),
            ),
            accountEmail: null,
          ),
          new Column(
            children: _getDrawerOptionsWidget(context),
          ),
        ],
      ),
    );
  }
}
