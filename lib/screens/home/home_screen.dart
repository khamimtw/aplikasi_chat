import 'package:aplikasi_chat/models/user.dart';
import 'package:aplikasi_chat/screens/chat/chat_screen.dart';
import 'package:aplikasi_chat/screens/login/login_screen.dart';
import 'package:aplikasi_chat/screens/profile/profile_screen.dart';
import 'package:aplikasi_chat/size_config.dart';
import 'package:aplikasi_chat/utils/custom_shared_preferences.dart';
import 'package:aplikasi_chat/widgets/body_loading.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User user;
  bool _isLoading;

  @override
  initState() {
    if (user == null) {
      setState(() {
        _isLoading = true;
      });
    }

    CustomSharedPreferences.getMyUser().then((value) {
      user = value;
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: user == null && _isLoading ? null : _buildDrawerWidget(),
      appBar: AppBar(
        title: Text('Zippo Chat'),
      ),
      body: SingleChildScrollView(
        child: user == null && _isLoading
            ? BodyLoading()
            : Padding(
                padding: EdgeInsets.only(
                  top: getProportionateScreenHeight(20),
                ),
                child: Column(
                  children: [
                    Container(
                      child: Text('Users Online'),
                    ),
                    SizedBox(height: 20),
                    Container(
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight,
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return _buildUserOnline();
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                color: Colors.grey,
                              );
                            },
                            itemCount: 20)),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildUserOnline() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15),
          vertical: getProportionateScreenHeight(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            child: Icon(
              Icons.person,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'Person Name',
            style: TextStyle(
                fontWeight: FontWeight.w600, letterSpacing: 0.5, fontSize: 18),
          ),
          Spacer(),
          IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ChatScreen()));
              })
        ],
      ),
    );
  }

  Widget _buildDrawerWidget() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 35,
                    child: Icon(Icons.person, size: 40),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Hi, ${user.username}',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ProfileScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () async {
              await CustomSharedPreferences.remove('token');
              await CustomSharedPreferences.remove('user');
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
