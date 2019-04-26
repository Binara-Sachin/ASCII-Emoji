import 'package:flutter/material.dart';
import 'package:ascii_emoji/Pages/HomePage.dart';
import 'package:ascii_emoji/Libraries/DatabaseManager.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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



