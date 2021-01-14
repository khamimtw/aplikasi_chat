import 'package:aplikasi_chat/widgets/my_button.dart';
import 'package:aplikasi_chat/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import '../../size_config.dart';

class LoginScreen extends StatefulWidget {
  static final String routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  MyTextField(hint: 'Username'),
                  SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    hint: 'Password',
                    obscure: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/reset_password');
                        // Navigator.of(context).pushNamed('/reset_password');
                      },
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MyButton(
                      title: 'Login',
                      onTap: () {
                        Navigator.pushNamed(context, '/home');
                      }),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Want to start chatting ?",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400),
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
