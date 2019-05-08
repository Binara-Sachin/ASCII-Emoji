import 'package:flutter/material.dart';
import 'package:ascii_emoji/Libraries/SharedPreferencesClass.dart';

import 'package:ascii_emoji/Assets/GlobalData.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              "Sort by usage",
              style: TextStyle(fontSize: 16.0),
            ),
            trailing: Switch(
              value: globalSortByUsage,
              onChanged: (value) async {
                await SharedPreferencesManager().setSortByUsage(value);
                setState(() {
                  globalSortByUsage = value;
                });
              },
              activeTrackColor: Colors.lightBlueAccent,
              activeColor: Colors.lightBlue,
            ),
          ),
          ListTile(
            title: Text(
              "Show favorites on top",
              style: TextStyle(fontSize: 16.0),
            ),
            trailing: Switch(
              value: globalShowFavoritesOnTop,
              onChanged: (value) async {
                await SharedPreferencesManager().setShowFavoritesOnTop(value);
                setState(() {
                  globalShowFavoritesOnTop = value;
                });
              },
              activeTrackColor: Colors.lightBlueAccent,
              activeColor: Colors.lightBlue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
            child: Text(
              "About",
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text(
              "App Version",
              style: TextStyle(fontSize: 16.0),
            ),
            trailing: Text(
              "0.1.0",
              style: TextStyle(fontSize: 15.0, color: Colors.grey),
            ),
          ),
          ListTile(
            title: Text(
              "License info",
              style: TextStyle(fontSize: 16.0),
            ),
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LicensePage()),
                ),
          ),
        ],
      ),
    );
  }
}
