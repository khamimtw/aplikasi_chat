import 'package:aplikasi_chat/screens/account/account_screen.dart';
import 'package:aplikasi_chat/screens/add_friend/add_friend_screen.dart';
import 'package:aplikasi_chat/screens/change_password/change_password_screen.dart';
import 'package:aplikasi_chat/screens/change_username/change_username_screen.dart';
import 'package:aplikasi_chat/screens/home/home_screen.dart';
import 'package:aplikasi_chat/screens/login/login_screen.dart';
import 'package:aplikasi_chat/screens/register/register_screen.dart';
import 'package:aplikasi_chat/screens/reset_password/reset_password_screen.dart';
import 'package:aplikasi_chat/screens/setting/setting_screen.dart';
import 'package:aplikasi_chat/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  'account': (context) => AccountScreen(),
  'add_friend': (context) => AddFriendScreen(),
  'change_password': (context) => ChangePasswordScreen(),
  'change_username': (context) => ChangeUsernameScreen(),
  'home': (context) => HomeScreen(),
  'login': (context) => LoginScreen(),
  'register': (context) => RegisterScreen(),
  'reset_password': (context) => ResetPasswordScreen(),
  'setting': (context) => SettingScreen(),
  'splash': (context) => SplashScreen(),
};
