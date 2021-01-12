import 'package:aplikasi_chat/screens/login/login_controller.dart';
import 'package:flutter/material.dart';
import '../../size_config.dart';

class LoginScreen extends StatefulWidget {
  static final String routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController _loginController;

  @override
  void initState() {
    _loginController = LoginController(context: context);
    super.initState();
  }

  @override
  void dispose() {
    _loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return StreamBuilder(
        stream: _loginController.streamController.stream,
        builder: (context, snapshot) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(104, 153, 255, 100),
                              Colors.white
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                      ),
                    ),
                    Padding(
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
                            height: 20,
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
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          _buildTextFieldWidget(
                              'Username', _loginController.usernameController),
                          SizedBox(
                            height: 20,
                          ),
                          _buildTextFieldWidget(
                              'Password', _loginController.passwordController,
                              obscureText: true),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'reset_password');
                              },
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(50)),
                              child: _buildButtonWidget(
                                  'Login', _loginController.submitForm)),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Want to start chatting ?",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, 'register');
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
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildTextFieldWidget(
      String hintText, TextEditingController controller,
      {bool obscureText = false}) {
    return TextField(
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black),
      maxLength: 50,
      maxLengthEnforced: true,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: '  $hintText',
        hintStyle: TextStyle(
            fontSize: 15,
            letterSpacing: 1.5,
            color: Colors.black54,
            fontWeight: FontWeight.w900),
      ),
    );
  }

  Widget _buildButtonWidget(String title, Function onTap) {
    return ButtonTheme(
        buttonColor: Color.fromRGBO(50, 66, 120, 100),
        minWidth: MediaQuery.of(context).size.width,
        height: 45,
        child: RaisedButton(
          onPressed: onTap,
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ));
  }
}
