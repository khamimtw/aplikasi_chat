import 'package:flutter/material.dart';

class ChangeUsernameScreen extends StatefulWidget {
  static final String routeName = '/change_username';

  @override
  _ChangeUsernameScreenState createState() => _ChangeUsernameScreenState();
}

class _ChangeUsernameScreenState extends State<ChangeUsernameScreen> {
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
                    "Change Username",
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
                    validator: (String value) {
                      if (value.isEmpty) {
                        return '   Harap Masukin Username Baru';
                      }
                      return null;
                    },
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    maxLength: 50,
                    maxLengthEnforced: true,
                    controller: myUsernameController,
                    decoration: InputDecoration(
                      hintText: '  Username',
                      hintStyle: TextStyle(
                          fontSize: 13,
                          letterSpacing: 1.5,
                          color: Colors.black54,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
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
                      hintText: '  Enter Your Password to Confirm changes',
                      hintStyle: TextStyle(
                          fontSize: 13,
                          letterSpacing: 1.5,
                          color: Colors.black54,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 250, right: 0),
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'account');
                      },
                      child: const Icon(Icons.bookmark),
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
