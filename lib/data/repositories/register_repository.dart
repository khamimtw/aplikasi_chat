import 'dart:convert';

import 'package:aplikasi_chat/data/models/custom_error.dart';
import 'package:aplikasi_chat/data/models/user.dart';
import 'package:aplikasi_chat/utils/custom_http_client.dart';
import 'package:aplikasi_chat/utils/custom_shared_preferences.dart';

import '../../constans.dart';

class RegisterRepository {
  CustomHttpClient http = CustomHttpClient();

  /// Register: https://github.com/evaleries/sischat#post-authregister
  Future<dynamic> register(
      String username, String email, String password) async {
    try {
      var body = jsonEncode(
          {'username': username, 'email': email, 'password': password});
      var response = await http.post(
        '$apiUrl/auth/register',
        body: body,
      );

      final dynamic registerResponse = jsonDecode(response.body);

      if (registerResponse['error']) {
        return CustomError.fromJson(registerResponse);
      }

      final User user = User.fromJson(registerResponse['user']);
      return user;
    } catch (err) {
      throw err;
    }
  }
}
