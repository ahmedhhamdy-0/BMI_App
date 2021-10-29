import 'package:bmi/result_screen.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.black,
        iconTheme:const IconThemeData(color: Colors.white,),
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          headline2: TextStyle(
              fontSize: 35, color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
      // ignore: prefer_const_constructors
      home: Scaffold(
        // ignore: prefer_const_constructors
        body: HomePage()
      ),
    );
  }
}
