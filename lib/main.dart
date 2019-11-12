import 'package:flutter/material.dart';
import 'package:ungmushroom/screens/home.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ung MushRoom',
      home: Home(),
    );
  }
}