import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/subject.dart';

class ItemTile extends StatelessWidget {
  final Item currentItem;
  ItemTile(this.currentItem);

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final startTime = DateFormat.Hm().format(currentItem.startTime);
    String am = DateFormat.H().format(currentItem.startTime);
    int pm = int.parse(am);

    if (pm >= 12) {
      am = 'PM';
    } else
      am = 'AM';

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: device.height * 0.01, horizontal: device.width * 0.04),
      child: Row(
        children: [
          Text(
            '$startTime\n  $am',
            style: GoogleFonts.autourOne(fontSize: 20),
          ),
          Container(
            height: device.height*0.1,
            width: device.width*0.75,
            color:currentItem.subject.color
          )
        ],
      ),
    );
  }
}
