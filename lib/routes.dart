import 'package:aplikasi_chat/screens/home/home_screen.dart';
import 'package:aplikasi_chat/screens/login/login_screen.dart';
import 'package:aplikasi_chat/screens/register/register_screen.dart';
import 'package:aplikasi_chat/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
