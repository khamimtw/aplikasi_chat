import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final TextEditingController controller;

  MyTextField({@required this.hint, this.obscure, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black),
      controller: controller ?? null,
      obscureText: obscure ?? false,
      decoration: InputDecoration(
        counter: Offstage(),
        hintText: '  $hint',
        hintStyle: TextStyle(
            fontSize: 15,
            letterSpacing: 1.5,
            color: Colors.black54,
            fontWeight: FontWeight.w900),
      ),
    );
  }
}

Widget buildTextAlamatFieldAuth(String hintText,
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
