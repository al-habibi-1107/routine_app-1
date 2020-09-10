import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/subject.dart';

class EditSubject extends StatefulWidget {
  static const routeName = 'edit-screen';
  @override
  _EditSubjectState createState() => _EditSubjectState();
}

class _EditSubjectState extends State<EditSubject> {
  @override
  Widget build(BuildContext context) {
    Item currentItem = ModalRoute.of(context).settings.arguments;
    final device = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 01, 30, 1),
        title: Text('Edit Timetable'),
      ),
      body: Column(children: [
        Container(
          width: device.width,
          height: device.height * 0.2,
          color: Color.fromRGBO(0, 01, 30, 1),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(10),
              height: device.height * 0.09,
              width: device.width * 0.8,
              decoration: BoxDecoration(
                  color: currentItem.subject.color,
                  borderRadius: BorderRadius.circular(15)),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  Icon(currentItem.subject.iconpara,size: 30,),
                  SizedBox(
                    width:device.width*0.06
                  ),
                  Column(
                    children: <Widget>[
                      Text('${currentItem.subject.subjectName}',style: GoogleFonts.arya(fontSize:27),)
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
