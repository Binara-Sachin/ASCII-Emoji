import 'package:ascii_emoji/Pages/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:ascii_emoji/Pages/HomePage.dart';

import 'package:ascii_emoji/Assets/GlobalData.dart';
import 'package:ascii_emoji/Assets/Emoticons.dart';

import 'package:ascii_emoji/Libraries/SharedPreferencesClass.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _initApp() async {
    globalSortByUsage = await SharedPreferencesManager().getSortByUsage();
    globalShowFavoritesOnTop = await SharedPreferencesManager().getShowFavoritesOnTop();

    SharedPreferencesManager().getEmoticonsState().then((result) async {
      emoticonsState = result;

      if (emoticonsState.length < emoticonsList.length){
        for (int i=result.length; i<=emoticonsList.length; i++){
          emoticonsState.add('0f');
        }
      }

      print (emoticonsState.toString());

      await new Future.delayed(const Duration(seconds: 1));

      setState(() {
        downloadList();
        startBuild = true;
        for (int i=0; i<emoticonsList.length; i++){
          print(
            emoticonsList[i].id.toString() + " " + 
            emoticonsList[i].favorite.toString() + " " + 
            emoticonsList[i].count.toString() + " " + 
            emoticonsList[i].emoji.toString());
        }
      });
    });

  }

  @override
  void initState() {
    super.initState();

    for (int i=0; i<emoticonsList.length; i++){
      emoticonsList[i].id = i;
    }

    _initApp();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ASCII Emoji',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: startBuild ? HomePage() : SplashScreen(),
    );
  }
}
