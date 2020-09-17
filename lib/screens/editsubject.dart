import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/subject.dart';
import '../models/items.dart';

class EditSubject extends StatefulWidget {
  static const routeName = 'edit-screen';
  @override
  _EditSubjectState createState() => _EditSubjectState();
}

class _EditSubjectState extends State<EditSubject> {
  // A formkey to select a form an perform operations on it
  final _formKey = GlobalKey<FormState>();
  bool flag = true;
  String _subject;
  String _teacher;
  DateTime _startTime;
  String _startString;
  DateTime _endTime;
  String _endString;

  // A function to Show a time Picker to edit the starttime variable
  Future<TimeOfDay> _selectTime(BuildContext context) {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: _startTime.hour,
        minute: _startTime.minute,
      ),
    );
  }

  // A function to Show a time Picker to edit the endtime variable
  Future<TimeOfDay> _selectendTime(BuildContext context) {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: _endTime.hour,
        minute: _endTime.minute,
      ),
    );
  }

  // A function to save the form and edit the
  // current Subject item
  void _saveForm(Item currentItem) {
    final isValid = _formKey.currentState.validate();

    if (isValid) {
      _formKey.currentState.save();
      Provider.of<Items>(context, listen: false)
          .editItem(currentItem.id, _subject, _teacher, _startTime, _endTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    Item currentItem = ModalRoute.of(context).settings.arguments;
    final device = MediaQuery.of(context).size;
    // This code only runs once to initialise all
    // The variables at time of navigation
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
          // Create a form with a formKey
          Form(
            key: _formKey,
            child: Container(
              width: device.width * 0.8,
              height: device.height * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // A formfield to Edit the Subject
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
                  // A FormFeild to edit the teacher name
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
                  // A Row containing Two Clickable
                  // Time Pickers
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final selectedTime = await _selectTime(context);
                          if (selectedTime != null) {
                            final now = DateTime.now();
                            setState(
                              () {
                                _startTime = DateTime(
                                    now.year,
                                    now.month,
                                    now.day,
                                    selectedTime.hour,
                                    selectedTime.minute);
                                _startString =
                                    DateFormat.jm().format(_startTime);
                              },
                            );
                          }
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
                      GestureDetector(
                        onTap: () async {
                          final selectedTime = await _selectendTime(context);
                          if (selectedTime != null) {
                            final now = DateTime.now();

                            setState(() {
                              _endTime = DateTime(
                                now.year,
                                now.month,
                                now.day,
                                selectedTime.hour,
                                selectedTime.minute,
                              );
                              _endString = DateFormat.jm().format(_endTime);
                            });
                          }
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
                                Text('End Time:'),
                                Text('$_endString')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                splashColor: Colors.yellow,
                onPressed: () {
                  // Deletes the current Item we were working on
                  Provider.of<Items>(context, listen: false)
                      .deleteItem(currentItem);
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.delete),
              ),
              IconButton(
                // On Clicking the tick icon, The form
                // Is validated and the Saved
                onPressed: () {
                  _saveForm(currentItem);
                  Navigator.of(context).pop();
                },
                splashColor: Colors.yellow,
                icon: Icon(Icons.check),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
