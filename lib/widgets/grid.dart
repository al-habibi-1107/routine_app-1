import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import '../screens/weekDayScreen.dart';

class WeekGrid extends StatelessWidget {
  final String day;
  final Icon icon;

  WeekGrid(this.day, this.icon);
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: (){
            Navigator.of(context).pushNamed(WeekDayScreen.routeName,arguments:day );
        },
          child: Container(
        child: Column(
          children: [
            ClipRRect(
              child: Image.asset(
                'assets/$day.png',
                fit: BoxFit.scaleDown,
                width: device.width * 0.17,
                height: device.height * 0.09,
              ),
            ),
            Text('$day',
                style: GoogleFonts.poppins(fontStyle: FontStyle.normal))
          ],
        ),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(255, 208, 13, 0.5),
                blurRadius: 7.0, // soften the shadow
                spreadRadius: 0.5, //extend the shadow
                offset: Offset(
                  0.2, // Move to right 10  horizontally
                  1.0, // Move to bottom 10 Vertically
                ),
              )
            ],
            color: Color.fromRGBO(255, 208, 13, 1),
            // gradient: LinearGradient(
            //   colors: [
            //     Color.fromRGBO(110, 149, 252, 1),
            //     Color.fromRGBO(61, 110, 234, 1)
            //   ],
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            // ),
            borderRadius: BorderRadius.all(Radius.circular(17))),
        height: device.height * 0.14,
        width: device.width * 0.27,
      ),
    );
  }
}
