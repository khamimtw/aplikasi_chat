import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SafeArea(
              // Agar tidak konflik dengan status bar default android diatas
              minimum: EdgeInsets.fromLTRB(20, 30, 0, 0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Chats',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 17.5),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.grey,
                      size: 45,
                    ),
                    padding: EdgeInsets.only(right: 40),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/chats');
                    },
                  )
                ],
              ),
            ),
            Container(
              // Search Bar
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Search',
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    filled: true,
                    fillColor: Color(0xfff1f1f1),
                  ),
                ),
              ),
            ),
            // Highlight pesan
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Person Name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                              fontSize: 17.5),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Content of the chats',
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          '11:45 AM',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff6c63fe),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CircleAvatar(
                          child: Text('3'),
                          radius: 10,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 30,
              endIndent: 20,
              indent: 20,
              color: Colors.black,
            ),
          ],
        ),
      ),
      // Bar dibawah
      bottomNavigationBar: BottomAppBar(
        child: SafeArea(
          minimum: EdgeInsets.only(bottom: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.chat),
                iconSize: 35,
                color: Colors.blueGrey,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.settings),
                iconSize: 35,
                color: Colors.blueGrey,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/setting');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
