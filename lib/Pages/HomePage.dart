import 'package:flutter/material.dart';

import 'package:ascii_emoji/Libraries/ListViewBuilder.dart';

import 'package:ascii_emoji/Pages/FavoritesPage.dart';
import 'package:ascii_emoji/Pages/SettingsPage.dart';

final bool sortByCountFromSettings = true;

class DrawerItem{
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItemsMain = [
    new DrawerItem("ASCII Emoji", Icons.filter_vintage),
    new DrawerItem("Favorites", Icons.favorite),
    new DrawerItem("Upgrade to Pro", Icons.polymer),
    new DrawerItem("Settings", Icons.settings),
    new DrawerItem("Send Feedback", Icons.feedback),
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  _getDrawerOptionsWidget() {
    var drawerOptions = <Widget>[];

    for (var i = 0; i < widget.drawerItemsMain.length; i++) {
      var drawerItem = widget.drawerItemsMain[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(drawerItem.icon),
          title: new Text(drawerItem.title),
          onTap: () => _onSelectItem(i),
        )
      );
    }

    return drawerOptions;
  }
  
  _onSelectItem(int index) {
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

  _onPushFavorite() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FavoritesPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("ASCII Emoji"),
          bottom: TabBar(
            tabs: [
              Tab(text: "All"),
              Tab(text: "Happy"),
              Tab(text: "Sad"),
              Tab(text: "Other"),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite, color: Colors.white,),
              tooltip: "Go to Favorites",
              onPressed: () => _onPushFavorite(),
            ),
            Container(width: 15.0),
          ],
        ),
        drawer: new Drawer(
          child: new Column(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text("ASCII Emoji", style: TextStyle(fontSize: 20.0),), 
                accountEmail: null,
              ),
              new Column(
                children: _getDrawerOptionsWidget(),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListViewBuilder(
              favoritesOnly: false,
              sortByCount: sortByCountFromSettings,
            ),
            ListViewBuilder(
              favoritesOnly: false,
              includeTag: "Happy",
              sortByCount: sortByCountFromSettings,
            ),
            ListViewBuilder(
              favoritesOnly: false,
              includeTag: "Sad",
              sortByCount: sortByCountFromSettings,
            ),
            ListViewBuilder(
              favoritesOnly: false,
              includeTag: "Other",
              sortByCount: sortByCountFromSettings,
            ),
          ],
        ),
      ),
    );  
  }
}
