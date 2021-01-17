import 'dart:convert';
import 'package:aplikasi_chat/constans.dart';
import 'package:aplikasi_chat/models/user.dart';
import 'package:aplikasi_chat/screens/home/home_screen.dart';
import 'package:aplikasi_chat/utils/custom_shared_preferences.dart';
import 'package:aplikasi_chat/widgets/my_button.dart';
import 'package:aplikasi_chat/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import '../../size_config.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  static final String routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  handleLogin() async {
    try {
      Map<String, String> body = {
        'username': _usernameController.text,
        'password': _passwordController.text
      };

      var response = await http.post('$apiUrl/auth/login', body: body);

      final dynamic loginResponse = jsonDecode(response.body);

      if (loginResponse != null && response.statusCode == 200) {
        setState(() {
          _isLoading = false;
        });

        //Store Token
        await CustomSharedPreferences.setString(
            'token', loginResponse['token']);

        //Store User Profile
        final user = User.fromJson(loginResponse);
        await CustomSharedPreferences.setString('user', user.toString());

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
            (route) => false);
      }

      if (loginResponse != null && response.statusCode == 400) {
        setState(() {
          _isLoading = false;
        });

        showAlertDialog('Gagal!', loginResponse['message'], context);
      }
    } catch (e) {
      showAlertDialog('Terjadi Kesalahan!', e.toString(), context);
    }
  }

  showAlertDialog(String title, String content, BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        FlatButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );

    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromRGBO(104, 153, 255, 100), Colors.white],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(25),
                  vertical: getProportionateScreenHeight(50)),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "images/1.png",
                    alignment: Alignment.centerRight,
                    width: SizeConfig.screenWidth,
                    height: 150,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Z I P P O',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 35),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Please enter your email and password',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  MyTextField(
                    hint: 'Username',
                    controller: _usernameController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    hint: 'Password',
                    obscure: true,
                    controller: _passwordController,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MyButton(
                      title: 'Login',
                      onTap: () {
                        if (_usernameController.text == '' &&
                            _passwordController.text == '') {
                          return null;
                        }
                        setState(() {
                          _isLoading = true;
                        });
                        handleLogin();
                        // Navigator.pushNamed(context, '/home');
                      }),
                  SizedBox(
                    height: 50,
                  ),
                  _buildRegisterSectionWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterSectionWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Want to start chatting ?",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/register');
          },
          child: Text(
            'Sign up, it is free!',
            style: TextStyle(
                //  decoration: TextDecoration.underline,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
        ),
      ],
    );
  }
}
