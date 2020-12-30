import 'package:aplikasi_chat/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_chat/login.dart';
import 'package:aplikasi_chat/register.dart';
import 'package:aplikasi_chat/resetpass.dart';
import 'package:aplikasi_chat/addFriend.dart';
import 'package:aplikasi_chat/editUsrnm.dart';
import 'package:aplikasi_chat/editPass.dart';
import 'package:aplikasi_chat/account.dart';

void main() => runApp(
      MaterialApp(
        title: 'ZIPPO',
        theme: ThemeData(fontFamily: 'Proxima Nova'),
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          //    '/': (context) => HomeScreen(),
          //  '/profile': (context) => ProfilePage(),
          '/login': (context) => loginScreen(),
          '/signup': (context) => SignUpScreen(),
          '/splash': (context) => SplashScreenPage(),
          '/reset': (context) => ResetScreen(),
          '/add': (context) => addScreen(),
          '/editUs': (context) => editUsrnmScreen(),
          '/editPass': (context) => editPassScreen(),
          '/account': (context) => accountScreen(),
        },
      ),
    ); // Material App
