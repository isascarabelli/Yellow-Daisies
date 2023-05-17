import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  const CalendarButton({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 135,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.yellow[600],
          ),
          child:Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 15.0),
            child: Text(
                label,
                style: GoogleFonts.lato()
            ),
          )
      ),
    );
  }
}
