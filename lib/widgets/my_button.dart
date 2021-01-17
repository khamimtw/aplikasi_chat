import 'package:flutter/material.dart';

import '../size_config.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Function onTap;

  MyButton({
    @required this.title,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        buttonColor: Color.fromRGBO(50, 66, 120, 100),
        height: 45,
        minWidth: SizeConfig.screenWidth,
        child: RaisedButton(
          onPressed: onTap,
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ));
  }
}
