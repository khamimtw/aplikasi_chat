import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  String hint;
  bool issecured;

  CustomTextField({this.hint, this.issecured});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: TextFormField(
          obscureText: issecured,
          cursorColor: Colors.black,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            //   disabledBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.transparent),
            //    borderRadius: BorderRadius.circular(25),
            // ),
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 14,
                letterSpacing: 1,
                color: Colors.black54,
                fontWeight: FontWeight.w200),
            //filled: true,
            //  hoverColor: Colors.transparent,
            // focusColor: Colors.transparent,
            // fillColor: Colors.white.withOpacity(.3),
            // border: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.transparent),
            //  borderRadius: BorderRadius.circular(25),
            //  ),
            // enabledBorder: OutlineInputBorder(
            //  borderSide: BorderSide(color: Colors.transparent),
            //  borderRadius: BorderRadius.circular(25),
            // )
          ),
        ));
  }
}
