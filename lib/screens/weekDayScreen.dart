import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeekDayScreen extends StatefulWidget {
  static const routeName='/week-day-screen';
  @override
  _WeekDayScreenState createState() => _WeekDayScreenState();
}

class _WeekDayScreenState extends State<WeekDayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Timetable',style:GoogleFonts.zillaSlab()),
        backgroundColor: Color.fromRGBO(0, 01, 19, 1),
        centerTitle: true,
      ),




    );
  }
}