import 'package:ascii_emoji/Libraries/ListViewBuilder.dart';
import 'package:flutter/material.dart';

final bool sortByCountFromSettings = true;

class HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: TabBar(
              tabs: [
                Tab(text: "All"),
                Tab(text: "Happy"),
                Tab(text: "Sad"),
                Tab(text: "Other"),
              ],
            ),
            //elevation: 0.0,
          ),
          body: TabBarView(
            children: [
              ListViewBuilder(
                favoritesOnly: false,
                //includeTag: null,
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

class HomeFragment extends StatefulWidget {
  @override
  HomeFragmentState createState() => new HomeFragmentState();
}