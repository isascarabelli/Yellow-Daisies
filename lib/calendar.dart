import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var heigth = MediaQuery.of(context).size.height;
    var today = DateTime.now();

    return Scaffold(
      backgroundColor: Colors.cyan[200],
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Padding(
              padding: EdgeInsets.all(heigth*0.03),
              child: const Text(
                "My Calendar",
                textDirection: TextDirection.ltr,
                style:
                TextStyle(
                  fontSize: 30,
                  //fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          SafeArea(
            child: TableCalendar(
              firstDay: DateTime.utc(2010,01,01),
              lastDay: DateTime.utc(2050,01,01),
              focusedDay: today,
              headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
            ),
          ),
        ],
      ),
    );
  }
}
