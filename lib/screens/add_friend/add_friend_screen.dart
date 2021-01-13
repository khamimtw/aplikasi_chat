import 'package:flutter/material.dart';

class AddFriendScreen extends StatefulWidget {
  static final String routeName = '/add_friend';

  @override
  _AddFriendScreenState createState() => _AddFriendScreenState();
}

class _AddFriendScreenState extends State<AddFriendScreen> {
  final myFriendController = TextEditingController();
  String friend;
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
                    "Add Friend",
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
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/adadad.png",
                      alignment: Alignment.center,
                      width: 350,
                      height: 200,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      'Add Your Friend from ZIPPO',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Harap Masukin Email/Phone';
                      }
                      return null;
                    },
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    maxLength: 16,
                    maxLengthEnforced: true,
                    controller: myFriendController,
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintText: ' Username',
                      hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: 1.5,
                          color: Colors.black38,
                          fontWeight: FontWeight.w900),
                      filled: true,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      fillColor: Colors.grey.withOpacity(.3),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ButtonTheme(
                      buttonColor: Color.fromRGBO(50, 66, 120, 100),
                      minWidth: MediaQuery.of(context).size.width,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.pushNamed(context, 'change_username');
                          }
                          return false;
                        },
                        child: Text(
                          'Send Friend Request',
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
