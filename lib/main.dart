import 'package:flutter/material.dart';
import 'package:yd/LoginPage.dart';
import 'package:yd/firstScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: LoginPage(),
      home: FirstScreen(),
      theme: ThemeData(primaryColor: Colors.yellow[600]),
    );
  }
}
