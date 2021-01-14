import 'package:aplikasi_chat/size_config.dart';
import 'package:aplikasi_chat/widgets/my_button.dart';
import 'package:aplikasi_chat/widgets/my_text_field.dart';
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
                  MyTextField(hint: 'Username'),
                  SizedBox(
                    height: 20,
                  ),
                  MyTextField(hint: 'Email'),
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
                  MyTextField(
                    hint: 'Confirm password',
                    obscure: true,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MyButton(
                      title: 'Sign up',
                      onTap: () {
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
                            color: Colors.black, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
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
          ),
        ),
      ),
    );
  }
}
