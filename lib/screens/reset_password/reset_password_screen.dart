import 'package:aplikasi_chat/size_config.dart';
import 'package:aplikasi_chat/widgets/auth.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  static final String routeName = '/reset_password';

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
                          'Please enter your email',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                buildTextFieldAuth('Email'),
                SizedBox(
                  height: 50,
                ),
                buildButtonAuth('Reset password', () {})
              ],
            ),
          ),
        ),
      )),
    );
  }
}
