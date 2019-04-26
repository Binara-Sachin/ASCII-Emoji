import 'package:flutter/material.dart';
import 'package:ascii_emoji/Pages/HomePage.dart';
import 'package:ascii_emoji/Libraries/DatabaseManager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  DatabaseManager database = DatabaseManager.instance;
  
  @override
  Widget build(BuildContext context) {

    database.startDatabase();

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



