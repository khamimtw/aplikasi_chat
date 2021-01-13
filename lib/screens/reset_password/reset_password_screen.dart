import 'package:aplikasi_chat/screens/reset_password/reset_password_controller.dart';
import 'package:aplikasi_chat/size_config.dart';
import 'package:aplikasi_chat/widgets/auth.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ResetPasswordController _resetPasswordController;

  @override
  void initState() {
    super.initState();
    _resetPasswordController = ResetPasswordController(context: context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return StreamBuilder(builder: (context, snapshot) {
      return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    buildTextFieldAuth(
                        'Email', _resetPasswordController.emailController)
                  ],
                ),
              )
            ],
          ),
        )),
      );
    });
  }
}
