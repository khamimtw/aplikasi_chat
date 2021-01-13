import 'package:aplikasi_chat/screens/register/register_controller.dart';
import 'package:aplikasi_chat/size_config.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static final String routeName = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  RegisterController _registerController;

  @override
  void initState() {
    _registerController = RegisterController(context: context);
    super.initState();
  }

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
                          _registerController.usernameController
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _buildTextFieldWidget(
                          'Email',
                          _registerController.emailController
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _buildTextFieldWidget(
                          'Password',
                          _registerController.passwordController,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 20,
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
