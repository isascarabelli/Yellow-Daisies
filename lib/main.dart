import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yd/LoginPage.dart';
import 'package:get/get.dart';
import 'package:yd/db/db_helper.dart';

Future<void> main() async{
  await Hive.initFlutter();
  
  var box = await Hive.openBox('mybox');
  await DBHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      theme: ThemeData(primaryColor: Colors.yellow[600]),
    );
  }
}
