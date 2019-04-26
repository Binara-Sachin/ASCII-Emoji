import 'package:flutter/material.dart';
import 'package:ascii_emoji/Libraries/ListViewBuilder.dart';

final bool sortByCountFromSettings = true;

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: ListViewBuilder(
        favoritesOnly: true,
        sortByCount: sortByCountFromSettings,
      ),
    );
  }
}