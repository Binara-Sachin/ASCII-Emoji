import 'package:flutter/material.dart';
import 'package:ascii_emoji/Pages/HomePage.dart';

import 'package:ascii_emoji/Assets/GlobalData.dart';

import 'package:ascii_emoji/Libraries/SharedPreferencesClass.dart';
import 'package:ascii_emoji/Libraries/DatabaseManager.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _initApp() async{
    DatabaseManager database = DatabaseManager.instance;
    await database.startDatabase();

    globalSortByUsage = await SharedPreferencesManager().getSortByUsage();
    globalShowFavoritesOnTop = await SharedPreferencesManager().getShowFavoritesOnTop();
    setState(){};
  }
  
  @override
  Widget build(BuildContext context) {
    _initApp();
    
    return MaterialApp(
      title: 'ASCII Emoji',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}



