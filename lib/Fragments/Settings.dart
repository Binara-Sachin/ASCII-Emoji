import 'package:flutter/material.dart';

class SettingsFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
            "Licence info",
            style: TextStyle(fontSize: 16.0),
          ),
          onTap: null,
        ),  
      ],
    );
  }
}