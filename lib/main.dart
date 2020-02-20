import 'package:flutter/material.dart';
import 'package:stopwatch_app/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Color.fromRGBO(27, 44, 86, 1.0),
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}