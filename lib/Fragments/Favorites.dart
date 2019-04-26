import 'package:ascii_emoji/Libraries/ListViewBuilder.dart';
import 'package:flutter/material.dart';

final bool sortByCountFromSettings = true;

class FavoritesFragmentState extends State<FavoritesFragment> {
  @override
  Widget build(BuildContext context) {
    return ListViewBuilder(
      favoritesOnly: true,
      sortByCount: sortByCountFromSettings,
    );
  }
}

class FavoritesFragment extends StatefulWidget {
  @override
  FavoritesFragmentState createState() => new FavoritesFragmentState();
}