import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static final String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Profil',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Center(
              heightFactor: 1.25,
              child: CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Input Name here',
                ),
              ),
            ),
            Divider(
              height: 0,
              indent: 30,
              endIndent: 30,
              color: Colors.black,
              thickness: 1.5,
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
