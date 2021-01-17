import 'dart:convert';

import 'package:aplikasi_chat/screens/login/login_screen.dart';
import 'package:aplikasi_chat/size_config.dart';
import 'package:aplikasi_chat/widgets/my_button.dart';
import 'package:aplikasi_chat/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../constans.dart';

class RegisterScreen extends StatefulWidget {
  static final String routeName = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _selectedGender;
  List<String> _genders = ['L', 'P'];

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();

  bool _isLoading = false;

  _handleRegister(String username, String email, String password, String gender,
      String alamat) async {
    try {
      Map<String, String> body = {
        'username': username,
        'email': email,
        'password': password,
        'jenis_kelamin': gender,
        'alamat': alamat
      };

      var response = await http.post('$apiUrl/auth/register', body: body);
      var jsonResponse = jsonDecode(response.body);
      print('STatus ${response.statusCode}');
      print(jsonResponse);

      if (jsonResponse != null && response.statusCode == 201) {
        setState(() {
          _isLoading = false;
        });

        await _showAlertDialog(
            jsonResponse['message'], 'Silahkan Login', context);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
            (route) => false);
      }

      if (jsonResponse != null && response.statusCode == 500) {
        setState(() {
          _isLoading = false;
        });

        _showAlertDialog('Gagal!', jsonResponse['message'], context);
      }
    } catch (e) {
      _showAlertDialog('Terjadi Kesalahan!', e.toString(), context);
    }
  }

  _showAlertDialog(String title, String content, BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        okButton,
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
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
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
                    width: 350,
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
                    hint: 'Email',
                    controller: _emailController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildTextFieldAlamat("Alamat",
                      controller: _alamatController),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                    hint: Text(
                      "  Kelamin",
                      style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 1.5,
                          color: Colors.black54,
                          fontWeight: FontWeight.w900),
                    ),
                    value: _selectedGender,
                    items: _genders.map((value) {
                      return DropdownMenuItem(child: Text(value), value: value);
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
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
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MyButton(
                      title: 'Register',
                      onTap: () {
                        if (_usernameController.text == "" &&
                            _emailController.text == "" &&
                            _passwordController.text == "" &&
                            _selectedGender == "" &&
                            _alamatController.text == "") {
                          return null;
                        }

                        _isLoading = true;

                        _handleRegister(
                            _usernameController.text,
                            _emailController.text,
                            _passwordController.text,
                            _selectedGender,
                            _alamatController.text);
                      }),
                  SizedBox(
                    height: 50,
                  ),
                  _buildLoginSectionWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginSectionWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Already have an account ?",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
          child: Text(
            'Login',
            style: TextStyle(
                //  decoration: TextDecoration.underline,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildTextFieldAlamat(String hintText,
      {bool obscureText = false, TextEditingController controller}) {
    return TextField(
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black),
      controller: controller ?? null,
      obscureText: obscureText,
      minLines: 2,
      maxLines: 4,
      decoration: InputDecoration(
        counter: Offstage(),
        hintText: '  $hintText',
        hintStyle: TextStyle(
            fontSize: 15,
            letterSpacing: 1.5,
            color: Colors.black54,
            fontWeight: FontWeight.w900),
      ),
    );
  }
}
