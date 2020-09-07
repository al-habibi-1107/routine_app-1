import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Add To Timetable',style: GoogleFonts.arvo(fontSize:20),),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.check),
            )
          ],
        ),
      ]),
    );
  }
}
