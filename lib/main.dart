import 'package:aplikasi_chat/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_chat/login.dart';
import 'package:aplikasi_chat/register.dart';

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
        },
      ),
    ); // Material App
