import 'package:aplikasi_chat/utils/custom_shared_preferences.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final _user;

  MyDrawer(this._user);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('sdsdsd'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
