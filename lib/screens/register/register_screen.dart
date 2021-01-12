import 'package:flutter/material.dart';
import 'package:aplikasi_chat/widgets/customtextfield.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          //  image: DecorationImage(
          //    image: AssetImage('images/1.png'), fit: BoxFit.cover),
          gradient: LinearGradient(
              colors: [Color.fromRGBO(104, 153, 255, 100), Colors.white],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "images/1.png",
                      alignment: Alignment.centerRight,
                      width: 350,
                      height: 150,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      'Z I P P O',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      'Please enter your email and password',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )
                  ],
                ),
                SizedBox(
                  height: 65,
                ),
                CustomTextField(
                  hint: 'Username',
                  issecured: false,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hint: 'Email',
                  issecured: false,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hint: 'Password',
                  issecured: false,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hint: 'Confirm Password',
                  issecured: true,
                ),
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: ButtonTheme(
                      buttonColor: Color.fromRGBO(50, 66, 120, 100),
                      minWidth: MediaQuery.of(context).size.width,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'add_friend');
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
