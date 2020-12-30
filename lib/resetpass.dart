import 'package:flutter/material.dart';

class ResetScreen extends StatefulWidget {
  @override
  _resetScreenState createState() => _resetScreenState();
}

class _resetScreenState extends State<ResetScreen> {
  final myUsernameController = TextEditingController();

  String nUsername;

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
                    height: 165,
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
                              Navigator.pushNamed(context, '/add');
                            }
                            return false;
                          },
                          child: Text(
                            'Reset Password',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
