import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/subject.dart';

class EditSubject extends StatefulWidget {
  static const routeName = 'edit-screen';
  @override
  _EditSubjectState createState() => _EditSubjectState();
}

class _EditSubjectState extends State<EditSubject> {
  final _formKey = GlobalKey<FormState>();
  bool flag = true;
  String _subject;
  String _teacher;
  DateTime _startTime;
  String _startString;
  DateTime _endTime;
  String _endString;
  @override
  Widget build(BuildContext context) {
    Item currentItem = ModalRoute.of(context).settings.arguments;
    final device = MediaQuery.of(context).size;

    if (flag) {
      _subject = currentItem.subject.subjectName;
      _teacher = currentItem.subject.teacher;
      _startTime = currentItem.startTime;
      _startString = DateFormat.jm().format(_startTime);
      _endTime = currentItem.endTime;
      _endString = DateFormat.jm().format(_startTime);

      flag = false;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 01, 30, 1),
        title: Text('Edit Timetable'),
      ),
      body: Column(
        children: [
          Container(
            width: device.width,
            height: device.height * 0.2,
            color: Color.fromRGBO(0, 01, 30, 1),
            child: Center(
              child: Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                height: device.height * 0.09,
                width: device.width * 0.8,
                decoration: BoxDecoration(
                    color: currentItem.subject.color,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      currentItem.subject.iconpara,
                      size: 30,
                    ),
                    SizedBox(width: device.width * 0.1),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '$_subject',
                          style: GoogleFonts.arya(fontSize: 25),
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                        Text(
                          '$_teacher',
                          style: GoogleFonts.arya(fontSize: 15),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Container(
              width: device.width * 0.8,
              height: device.height * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextFormField(
                    initialValue: _subject,
                    onSaved: (value) {
                      _subject = value;
                    },
                    onChanged: (value) {
                      setState(() {
                        _subject = value;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty || value.length < 3) {
                        return 'Class name must be atleast 3 charecters';
                      }
                      return null;
                    },
                    key: ValueKey('ClassName'),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.book,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                  ),
                  TextFormField(
                    initialValue: _teacher,
                    onSaved: (value) {
                      _teacher = value;
                    },
                    onChanged: (value) {
                      setState(() {
                        _teacher = value;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty || value.length < 3) {
                        return 'Teacher name must be atleast 3 charecters';
                      }
                      return null;
                    },
                    key: ValueKey('Teacher'),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                           
                        },
                        child: Container(
                          padding: EdgeInsets.all(4),
                          height: device.height * 0.08,
                          width: device.width * 0.4,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: <Widget>[
                                Text('Start Time:'),
                                Text('$_startString')
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        height: device.height * 0.08,
                        width: device.width * 0.4,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: <Widget>[
                              Text('End Time:'),
                              Text('$_endString')
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
