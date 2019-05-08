import 'package:ascii_emoji/Libraries/NavigationDrawerBuilder.dart';
import 'package:flutter/material.dart';
import 'package:ascii_emoji/Pages/FavoritesPage.dart';
import 'package:ascii_emoji/Libraries/ListViewBuilder.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
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
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              tooltip: "Go to Favorites",
              onPressed: () => _onPushFavorite(),
            ),
            Container(width: 15.0),
          ],
        ),
        drawer: NavigationDrawerBuilder(),
        body: TabBarView(
          children: [
            ListViewBuilder(
              favoritesOnly: false,
              includeTag: null,
            ),
            ListViewBuilder(
              favoritesOnly: false,
              includeTag: "Happy",
            ),
            ListViewBuilder(
              favoritesOnly: false,
              includeTag: "Sad",
            ),
            ListViewBuilder(
              favoritesOnly: false,
              includeTag: "Other",
            ),
          ],
        ),
      ),
    );
  }
}
