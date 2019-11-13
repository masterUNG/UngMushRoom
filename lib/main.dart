import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ungmushroom/screens/home.dart';
import 'package:ungmushroom/screens/my_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ung MushRoom',
      home: Home(),
    );
  }
}
