import 'package:flutter/material.dart';

class accountScreen extends StatefulWidget {
  @override
  _accountScreenState createState() => _accountScreenState();
}

class _accountScreenState extends State<accountScreen> {
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  final myEmailController = TextEditingController();
  String nUsername, nPassword, nEmail;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                AppBar(
                  backgroundColor: Colors.grey[200],
                  title: Text(
                    "My Account",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    controller: myUsernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          fontSize: 13,
                          letterSpacing: 1.5,
                          color: Colors.black54,
                          fontWeight: FontWeight.w900),
                      suffixText: 'thomasFriend',
                      suffixStyle: TextStyle(
                          fontSize: 13,
                          letterSpacing: 1.5,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w900),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.pushNamed(context, '/editUs');
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'email',
                      labelStyle: TextStyle(
                          fontSize: 13,
                          letterSpacing: 1.5,
                          color: Colors.black54,
                          fontWeight: FontWeight.w900),
                      suffixText: 'thomasFriend@email.com',
                      suffixStyle: TextStyle(
                          fontSize: 13,
                          letterSpacing: 1.5,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w900),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.pushNamed(context, '/editUs');
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    controller: myPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Change Password',
                      labelStyle: TextStyle(
                          fontSize: 13,
                          letterSpacing: 1.5,
                          color: Colors.black54,
                          fontWeight: FontWeight.w900),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.pushNamed(context, '/editPass');
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
