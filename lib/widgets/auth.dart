import 'package:aplikasi_chat/size_config.dart';
import 'package:flutter/material.dart';

Widget buildTextFieldAuth(String hintText,
    {bool obscureText = false, TextEditingController controller}) {
  return TextField(
    cursorColor: Colors.black,
    style: TextStyle(color: Colors.black),
    controller: controller ?? null,
    obscureText: obscureText,
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

Widget buildButtonAuth(String title, Function onPress) {
  return ButtonTheme(
      buttonColor: Color.fromRGBO(50, 66, 120, 100),
      height: 45,
      minWidth: SizeConfig.screenWidth,
      child: RaisedButton(
        onPressed: onPress,
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ));
}

Widget buildGradientBackgroundAuth() {
  return Container(
    width: SizeConfig.screenWidth,
    height: SizeConfig.screenHeight,
    decoration: BoxDecoration(
      gradient: LinearGradient(
          colors: [Color.fromRGBO(104, 153, 255, 100), Colors.white],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter),
    ),
  );
}
