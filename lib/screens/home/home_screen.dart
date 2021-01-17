import 'package:aplikasi_chat/size_config.dart';
import 'package:aplikasi_chat/utils/custom_shared_preferences.dart';
import 'package:aplikasi_chat/widgets/my_app_bar.dart';
import 'package:aplikasi_chat/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    super.initState();
    print(_getUser());
  }

  _getUser() async {
    String user = await CustomSharedPreferences.getUser('user');
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(_getUser()),
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
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
                        return _buildContactItemWidget();
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

  Widget _buildContactItemWidget() {
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
                Navigator.pushNamed(context, '/chats');
              })
        ],
      ),
    );
  }
}
