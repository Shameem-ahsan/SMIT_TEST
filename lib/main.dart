import 'package:flutter/material.dart';
import 'package:smit_task/screens/profile_screen.dart';
import 'package:smit_task/screens/punch_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: punch_screen(),
      routes: <String, WidgetBuilder>{
        '/profile': (BuildContext context) => profile_screen(),
      },
    );
  }
}

