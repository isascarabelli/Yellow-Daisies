import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:yd/home_page.dart';
import 'package:yd/calendar.dart';
import 'package:sized_icon_button/sized_icon_button.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List Screens = [
    HomePage(),
    Calendar(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var heigth = MediaQuery.of(context).size.height;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      backgroundColor: Colors.cyan[200],
      bottomNavigationBar:
      Padding(
        padding: EdgeInsets.only(top: heigth*0.02),
        child: CurvedNavigationBar(
          backgroundColor: Colors.cyan.shade200,
          color: Colors.yellow.shade600,
          animationDuration: const Duration(milliseconds: 400),
          index: _selectedIndex,
          onTap: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            Icon(Icons.list),
            Icon(Icons.calendar_month),
          ],
        ),
      ),
      //aumentando tamanho App Bar
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(heigth*0.04),
          child: AppBar(
            backgroundColor: Colors.yellow[600],
            elevation: 0,
          )
      ),
      body: Screens[_selectedIndex],
    );
  }
}

