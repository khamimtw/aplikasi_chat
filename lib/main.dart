import 'package:aplikasi_chat/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        title: 'ZIPPO',
        theme: ThemeData(fontFamily: 'Proxima Nova'),
        debugShowCheckedModeBanner: false,
        initialRoute: 'splash',
        routes: routes,
      ),
    ); // Material App
