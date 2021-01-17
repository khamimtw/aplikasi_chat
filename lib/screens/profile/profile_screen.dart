import 'package:aplikasi_chat/size_config.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static final String routeName = '/profile';

  final String username;
  final String email;
  final String alamat;

  ProfileScreen(this.username, this.email, this.alamat);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenHeight(25)),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Table(
                border: TableBorder.all(width: 0.3),
                children: [
                  TableRow(children: [
                    _buildTableContent('Username', username),
                  ]),
                  TableRow(children: [
                    _buildTableContent('Email', email),
                  ]),
                  TableRow(children: [
                    _buildTableContent('Alamat', alamat),
                  ]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTableContent(String title, String body) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontSize: 15, letterSpacing: 1, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            body,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
