import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/subject.dart';
import '../screens/editsubject.dart';

class ItemTile extends StatelessWidget {
  final Item currentItem;
  final bool editmode;
  ItemTile(this.currentItem, this.editmode);

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    String startTime = DateFormat.jm().format(currentItem.startTime);
    String startTimeT = startTime.substring(0, 5);
    String am = startTime.substring(5);

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: device.height * 0.01, horizontal: device.width * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$startTimeT\n $am',
            style:
                GoogleFonts.arvo(fontSize: 22, color: Colors.grey, shadows: []),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: device.height * 0.01),
            padding: EdgeInsets.only(left: device.width * 0.05),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3.5, // soften the shadow
                    spreadRadius: 1.0, //extend the shadow
                    offset: Offset(
                      2.5, // Move to right 10  horizontally
                      3.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
                color: currentItem.subject.color,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            height: device.height * 0.1,
            width: device.width * 0.75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  currentItem.subject.iconpara,
                  color: Colors.black45,
                  size: device.height * 0.05,
                ),
                SizedBox(
                  width: device.width * 0.05,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 39,
                      width: device.width * 0.28,
                      child: Text(
                        '${currentItem.subject.subjectName}',
                        style: GoogleFonts.arvo(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            letterSpacing: 1.2),
                      ),
                    ),
                    Text(
                      '${currentItem.subject.teacher}',
                      style: GoogleFonts.lato(
                          fontSize: 17,
                          color: Colors.white,
                          height: 0.1,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  width: device.width * 0.13,
                ),
                editmode
                    ? IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                         Navigator.of(context).pushNamed(EditSubject.routeName,arguments:currentItem );
                        },
                      )
                    : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
