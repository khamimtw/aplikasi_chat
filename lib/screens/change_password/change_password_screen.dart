import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final myCurrentPassController = TextEditingController();
  final myPasswordController = TextEditingController();
  String nCurrent, nPassword;

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
                    "Edit Username",
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
                        return '   Harap Masukin Password lama';
                      }
                      return null;
                    },
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    maxLength: 50,
                    maxLengthEnforced: true,
                    controller: myCurrentPassController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: '  current password',
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
                        return '   Harap Masukin Password baru';
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
                      hintText: '  new password',
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
