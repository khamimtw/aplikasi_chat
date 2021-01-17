import 'package:aplikasi_chat/models/user.dart';
import 'package:aplikasi_chat/size_config.dart';
import 'package:aplikasi_chat/utils/custom_shared_preferences.dart';
import 'package:aplikasi_chat/widgets/body_loading.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static final String routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User user;
  bool _isLoading;

  @override
  void initState() {
    if (user == null) {
      setState(() {
        _isLoading = true;
      });
    }

    CustomSharedPreferences.getMyUser().then((value) {
      user = value;
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
        ),
      ),
      body: user == null && _isLoading
          ? BodyLoading()
          : Padding(
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
                          _buildTableContent('Username', user.username),
                        ]),
                        TableRow(children: [
                          _buildTableContent('Email', user.email),
                        ]),
                        TableRow(children: [
                          _buildTableContent('Alamat', user.alamat),
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
