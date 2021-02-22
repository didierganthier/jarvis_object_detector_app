import 'package:flutter/material.dart';
import 'package:jarvis_object_detector_app/MySplashPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jarvis Object Detector App',
      home: MySplashPage(),
    );
  }
}

