import 'package:flutter/material.dart';

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
              value: true,
              onChanged: null,
            ),
          ),
          ListTile(
            title: Text(
              "Show favorites on top",
              style: TextStyle(fontSize: 16.0),
            ),
            trailing: Switch(
              value: false,
              onChanged: null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
            child: Text(
              "About",
              style: TextStyle(fontSize: 15.0, color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),
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
              MaterialPageRoute(builder: (context) => SettingsPage()),
            ),
          ),  
        ],
      ),
    );
  }
}