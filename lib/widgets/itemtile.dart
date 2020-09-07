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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$startTime\n  $am',
            style: GoogleFonts.autourOne(fontSize: 20, color: Colors.grey),
          ),
          Container(
            padding: EdgeInsets.only(left:device.width*0.05),
            decoration: BoxDecoration(
                color: currentItem.subject.color,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            height: device.height * 0.1,
            width: device.width * 0.75,
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Icon(
                currentItem.subject.iconpara,
                size: device.height * 0.05,
              ),
              SizedBox(width: device.width*0.05,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${currentItem.subject.subjectName}',
                    style: GoogleFonts.lato(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${currentItem.subject.teacher}',
                    style: GoogleFonts.lato(fontSize: 20),
                  ),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
