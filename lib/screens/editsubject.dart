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

  void delete(Item currentItem) {
    showDialog(
      context: context,
      child: AlertDialog(
        title: Text("Are you sure you want to delete the item?"),
        actions: [
          FlatButton(
              onPressed: () {
                Provider.of<Items>(context, listen: false)
                    .deleteItem(currentItem);
                    var count=0;
                Navigator.popUntil(context, (route) => count++==2);
              },
              child: Text(
                "Yes",
                style: GoogleFonts.ubuntu(color: Colors.green),
              )),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "No",
              style: GoogleFonts.ubuntu(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

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
      _endString = DateFormat.jm().format(_endTime);

      flag = false;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                height: device.height * 0.095,
                width: device.width * 0.8,
                decoration: BoxDecoration(
                    color: currentItem.subject.color,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      currentItem.subject.iconpara,
                      size: 45,
                      color: Colors.white70,
                    ),
                    SizedBox(width: device.width * 0.02),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '$_subject',
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                        Text('$_teacher',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.white,
                            ))
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
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: device.height * 0.02),
                    padding:
                        EdgeInsets.symmetric(horizontal: device.width * 0.04),
                    height: 50,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(253, 52, 75, 0.5),
                            blurRadius: 2.0, // soften the shadow
                            spreadRadius: 0, //extend the shadow
                            offset: Offset(
                              1.0, // Move to right 10  horizontally
                              2.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        color: Color.fromRGBO(253, 52, 75, 1),
                        borderRadius: BorderRadius.all(Radius.circular(17))),
                    child: TextFormField(
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 20),
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
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  // A FormFeild to edit the teacher name
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: device.height * 0.02),
                    padding:
                        EdgeInsets.symmetric(horizontal: device.width * 0.04),
                    height: 50,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(255, 208, 13, 0.5),
                            blurRadius: 2.0, // soften the shadow
                            spreadRadius: 0, //extend the shadow
                            offset: Offset(
                              1.0, // Move to right 10  horizontally
                              2.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        color: Color.fromRGBO(255, 208, 13, 1),
                        borderRadius: BorderRadius.all(Radius.circular(17))),
                    child: TextFormField(
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 20),
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
                          color: Colors.white,
                          size: 40,
                        ),
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
                              mainAxisAlignment: MainAxisAlignment.center,
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
                              mainAxisAlignment: MainAxisAlignment.center,
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
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(253, 52, 75, 0.5),
                        blurRadius: 2.0, // soften the shadow
                        spreadRadius: 0, //extend the shadow
                        offset: Offset(
                          1.0, // Move to right 10  horizontally
                          2.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                    color: Color.fromRGBO(253, 52, 75, 1),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: IconButton(
                  splashColor: Colors.yellow,
                  onPressed: () {
                    // Deletes the current Item we were working on
                    delete(currentItem);
                  },
                  icon: Icon(Icons.delete, color: Colors.white),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(253, 52, 75, 0.5),
                        blurRadius: 2.0, // soften the shadow
                        spreadRadius: 0, //extend the shadow
                        offset: Offset(
                          1.0, // Move to right 10  horizontally
                          2.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                    color: Color.fromRGBO(253, 52, 75, 1),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: IconButton(
                  // On Clicking the tick icon, The form
                  // Is validated and the Saved
                  onPressed: () {
                    _saveForm(currentItem);
                    Navigator.of(context).pop();
                  },
                  splashColor: Colors.yellow,
                  icon: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
