import 'dart:convert';

import 'package:aplikasi_chat/constans.dart';
import 'package:aplikasi_chat/data/models/custom_error.dart';
import 'package:aplikasi_chat/data/models/user.dart';
import 'package:aplikasi_chat/utils/custom_http_client.dart';
import 'package:aplikasi_chat/utils/custom_shared_preferences.dart';

class LoginRepository {
  CustomHttpClient http = CustomHttpClient();

  /// Login: https://github.com/evaleries/sischat#post-authlogin
  Future<dynamic> login(String username, String password) async {
    try {
      var body = jsonEncode({'username': username, 'password': password});
      var response = await http.post('$apiUrl/auth/login', body: body);
      print('RESPONSE' + response.body);
      final dynamic loginResponse = jsonDecode(response.body);
      if (loginResponse['error']) {
        return CustomError.fromJson(loginResponse);
      }

      await CustomSharedPreferences.setString('token', loginResponse['token']);
      final User user = User.fromJson(loginResponse['user']);
      await CustomSharedPreferences.setString('user', user.toString());
      return user;
    } catch (e) {
      print(e);
      return CustomError(
        error: true,
        message: e.toString(),
      );
    }
  }
}
