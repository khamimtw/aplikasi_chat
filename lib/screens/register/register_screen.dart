import 'package:aplikasi_chat/size_config.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static final String routeName = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return StreamBuilder(
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
                          'Username',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _buildTextFieldWidget(
                          'Email',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _buildTextFieldWidget(
                          'Password',
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _buildTextFieldWidget(
                          'Password Confirmation',
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: _buildButtonWidget('Sign up', () {
                              Navigator.pushNamed(context, 'add_friend');
                            })),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Already have an account ?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'login');
                              },
                              child: Text(
                                'Sign in',
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
      },
    );
  }

  Widget _buildTextFieldWidget(String hint, {bool obscureText = false}) {
    return Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: TextFormField(
          obscureText: obscureText,
          cursorColor: Colors.black,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 14,
                letterSpacing: 1,
                color: Colors.black54,
                fontWeight: FontWeight.w200),
          ),
        ));
  }

  Widget _buildButtonWidget(String title, Function onTap) {
    return ButtonTheme(
        buttonColor: Color.fromRGBO(50, 66, 120, 100),
        minWidth: MediaQuery.of(context).size.width,
        height: 50,
        child: RaisedButton(
          onPressed: onTap,
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ));
  }
}
