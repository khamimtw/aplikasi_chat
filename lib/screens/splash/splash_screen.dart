import 'package:aplikasi_chat/screens/account/account_screen.dart';
import 'package:aplikasi_chat/screens/add_friend/add_friend_screen.dart';
import 'package:aplikasi_chat/screens/change_password/change_password_screen.dart';
import 'package:aplikasi_chat/screens/change_username/change_username_screen.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_chat/screens/login/login_screen.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return AddFriendScreen();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(150, 160, 200, 100),
      body: Center(
        child: Image.asset(
          "images/adadad.png",
          width: 400.0,
          height: 200.0,
        ),
      ),
    );
  }
}
