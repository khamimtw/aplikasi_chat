import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  static final String routeName = '/setting';

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Thomas and Friend',
                      style: TextStyle(
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Edit Profile'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.person),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'My Account',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                    height: 40,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.exit_to_app),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                    height: 40,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      // Bar dibawah
      bottomNavigationBar: BottomAppBar(
        child: SafeArea(
          minimum: EdgeInsets.only(bottom: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.chat),
                iconSize: 35,
                color: Colors.blueGrey,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
              ),
              IconButton(
                icon: Icon(Icons.settings),
                iconSize: 35,
                color: Colors.blueGrey,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/profile');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
