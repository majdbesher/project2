import 'package:flutter/material.dart';
import 'package:untitled1/sginUp.dart';
import 'package:untitled1/sginIn.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int i=0;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: i==0?signupPage(title: 'Flutter Demo Home Page'):signinPage(title: 'Flutter Demo Home Page'),
    );
  }
}


