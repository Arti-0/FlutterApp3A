import 'package:flutter/material.dart';
import 'src/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game of Thrones Library',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        fontFamily: 'GameOfThrones',
      ),
      home: MyHomePage(),
    );
  }
}
