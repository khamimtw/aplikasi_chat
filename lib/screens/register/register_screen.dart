import 'package:aplikasi_chat/screens/register/register_controller.dart';
import 'package:aplikasi_chat/size_config.dart';
import 'package:aplikasi_chat/widgets/auth.dart';
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
                  buildGradientBackgroundAuth(),
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
                        buildTextFieldAuth(
                            'Username', _registerController.usernameController),
                        SizedBox(
                          height: 20,
                        ),
                        buildTextFieldAuth(
                            'Email', _registerController.emailController),
                        SizedBox(
                          height: 20,
                        ),
                        buildTextFieldAuth(
                          'Password',
                          _registerController.passwordController,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        buildButtonAuth('Sign up', () {
                          Navigator.pushNamed(context, 'add_friend');
                        }),
                        SizedBox(
                          height: 50,
                        ),
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
}
