import 'package:aplikasi_chat/screens/account/account_screen.dart';
import 'package:aplikasi_chat/screens/add_friend/add_friend_screen.dart';
import 'package:aplikasi_chat/screens/change_password/change_password_screen.dart';
import 'package:aplikasi_chat/screens/change_username/change_username_screen.dart';
import 'package:aplikasi_chat/screens/home/home_screen.dart';
import 'package:aplikasi_chat/screens/login/login_screen.dart';
import 'package:aplikasi_chat/screens/register/register_screen.dart';
import 'package:aplikasi_chat/screens/setting/setting_screen.dart';
import 'package:aplikasi_chat/screens/splash/splash_screen.dart';
import 'package:aplikasi_chat/screens/profile/profile_screen.dart';
import 'package:aplikasi_chat/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  AccountScreen.routeName: (context) => AccountScreen(),
  AddFriendScreen.routeName: (context) => AddFriendScreen(),
  ChangePasswordScreen.routeName: (context) => ChangePasswordScreen(),
  ChangeUsernameScreen.routeName: (context) => ChangeUsernameScreen(),
  SettingScreen.routeName: (context) => SettingScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  ChatScreen.routeName: (context) => ChatScreen()
};
