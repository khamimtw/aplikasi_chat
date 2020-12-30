import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  String nUsername, nPassword;

  //tambahkan form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          //image: DecorationImage(
          //  image: AssetImage('images/adadad.png'), fit: BoxFit.cover),
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
          child: Form(
            key: _formKey,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Harap Masukin Email';
                        }
                        return null;
                      },
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black),
                      maxLength: 100,
                      maxLengthEnforced: true,
                      controller: myUsernameController,
                      decoration: InputDecoration(
                        hintText: '  Email',
                        hintStyle: TextStyle(
                            fontSize: 15,
                            letterSpacing: 1.5,
                            color: Colors.black54,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return '   Harap Masukin Password';
                        }
                        return null;
                      },
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black),
                      maxLength: 50,
                      maxLengthEnforced: true,
                      controller: myPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '  Password',
                        hintStyle: TextStyle(
                            fontSize: 15,
                            letterSpacing: 1.5,
                            color: Colors.black54,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/reset');
                        },
                        child: Container(
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: ButtonTheme(
                        buttonColor: Color.fromRGBO(50, 66, 120, 100),
                        minWidth: MediaQuery.of(context).size.width,
                        height: 50,
                        child: RaisedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              Navigator.pushNamed(context, '/');
                            }
                            return false;
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Want to start chatting ?",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          'Sign up, it is free!',
                          style: TextStyle(
                              //  decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      )
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
