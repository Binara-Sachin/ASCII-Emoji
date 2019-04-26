import 'package:flutter/material.dart';

import 'package:ascii_emoji/Fragments/Home.dart';
import 'package:ascii_emoji/Fragments/Favorites.dart';
import 'package:ascii_emoji/Fragments/Settings.dart';

class DrawerItem{
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItemsMain = [
    new DrawerItem("ASCII Emoji", Icons.filter_vintage),
    new DrawerItem("Favorites", Icons.favorite),
    new DrawerItem("Upgrade to Pro", Icons.favorite_border),
    new DrawerItem("Settings", Icons.settings),
    new DrawerItem("Send Feedback", Icons.feedback),
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getFragmentWidget(int position) {
    switch (position) {
      case 0:
        return new HomeFragment();
      case 1:
        return new FavoritesFragment();
      case 2:
        return new Text("Upgrade to Pro");
      case 3:
        return new SettingsFragment();
      case 4:
        return new Text("Feedback");
      default:
        return new Text("Error");
    }
  }

  _getAppBarWidget(int position) {
    switch (position) {
      case 0:
        return new AppBar(
          title: new Text(widget.drawerItemsMain[_selectedDrawerIndex].title),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite, color: Colors.white,),
              tooltip: "Go to Favorites",
              onPressed: _onPushFavorite(),
            ),
            Container(width: 15.0),
          ],
      );
      default:
        return new AppBar(
          title: new Text(widget.drawerItemsMain[_selectedDrawerIndex].title),
      );
    }
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop();
  }

  _onPushFavorite() {
    //TODO
    if(_selectedDrawerIndex==-1){
      setState(() => _selectedDrawerIndex = 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];

    for (var i = 0; i < widget.drawerItemsMain.length; i++) {
      var drawerItem = widget.drawerItemsMain[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(drawerItem.icon),
          title: new Text(drawerItem.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }

    return new Scaffold(
      appBar: _getAppBarWidget(_selectedDrawerIndex),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("ASCII Emoji", style: TextStyle(fontSize: 20.0),), 
              accountEmail: null
            ),
            new Column(
              children: drawerOptions
            ),
          ],
        ),
      ),
      body: _getFragmentWidget(_selectedDrawerIndex),
    );  
  }
}
