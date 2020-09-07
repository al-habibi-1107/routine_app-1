import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: device.height * 0.015),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Add To Timetable',
              style: GoogleFonts.arvo(
                fontSize: 20,
                wordSpacing: 3,
              ),
            ),
            FloatingActionButton(
              elevation: 5,
              onPressed: () {},
              child: Icon(Icons.check),
            )
          ],
        ),
      ]),
    );
  }
}
