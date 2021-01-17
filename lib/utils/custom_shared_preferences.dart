import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPreferences {
  static Future<void> setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<dynamic> getUserToken(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(key) != '') {
      Map<String, String> user = jsonDecode(prefs.getString(key));
      return user['token'];
    }
    return null;
  }

  static Future<dynamic> getUser(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(key) != '') {
      var user = jsonDecode(prefs.getString(key));
      Map<String, String> userObj = {
        'username': user['username'],
        'email': user['email'],
        'alamat': user['alamat'],
        '_id': user['_id']
      };
      return userObj;
    }
    return null;
  }
}
