import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../screens/subjectInput.dart';
import '../models/subject.dart';
import '../models/items.dart';

class ItemBottomSheet extends StatefulWidget {
  final String currentDay;

  ItemBottomSheet(this.currentDay);

  @override
  _ItemBottomSheetState createState() => _ItemBottomSheetState();
}

class _ItemBottomSheetState extends State<ItemBottomSheet> {
  Subject thisSubject;
  // Several Variables that are properties to a
  // Particular Subject
  bool isSubject = false;
  bool isPresent = false;
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay _time2 = TimeOfDay.now();
  DateTime _startTime = DateTime.now();
  String _startTimeString = 'Tap to add..';
  DateTime _endTime = DateTime.now();
  String _endTimeString = 'Tap to add..';
  Duration _duration = Duration(minutes: 10);

  void getStartTime(DateTime time) {
    setState(() {
      _startTime = time;
      _startTimeString = DateFormat.jm().format(_startTime);
      if (_endTime.isAfter(_startTime))
        _duration = _endTime.difference(_startTime);
    });
  }

  void onTimeChanged(TimeOfDay newtime) {
    setState(() {
      _time = newtime;
    });
  }

  void onEndTimeChanged(TimeOfDay newtime) {
    setState(() {
      _time2 = newtime;
    });
  }

  void getEndTime(DateTime time2) {
    setState(() {
      _endTime = time2;
      _endTimeString = DateFormat.jm().format(_endTime);

      _duration = _endTime.difference(_startTime);
    });
  }

  void createItem() {
    if (_duration.isNegative || _duration == Duration(minutes: 10)) {
      showDialog(
        context: context,
        child: AlertDialog(
          content: Text(
            'Please check the Start and End Class times',
            style: GoogleFonts.ubuntu(),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Continue Editing"),
            ),
            FlatButton(
                onPressed: () {
                  var count = 0;
                  Navigator.of(context).popUntil((route) => count++ == 2);
                },
                child: Text("Exit"))
          ],
        ),
      );
    } else {
      Provider.of<Items>(context, listen: false)
          .addItem(thisSubject, _startTime, _endTime, widget.currentDay);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return Container(
      height: 340,
      margin: EdgeInsets.symmetric(vertical: device.height * 0.015),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Add To Timetable',
                style: GoogleFonts.ubuntu(
                  fontSize: 20,
                  wordSpacing: 3,
                ),
              ),
              FloatingActionButton(
                backgroundColor: Color.fromRGBO(0, 01, 30, 1),
                splashColor: Colors.grey,
                mini: true,
                elevation: 5,
                onPressed: () {
                  createItem();
                },
                child: Icon(Icons.check),
              )
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Class',
                style: GoogleFonts.ubuntu(fontSize: 20),
              ),
              FlatButton(
                
                splashColor: Colors.grey,
                shape: CircleBorder(),
                color: Color.fromRGBO(0, 01, 30, 1),
                onPressed: () async {
                    try {
                      thisSubject = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubjectInput(),
                        ),
                      );
                    } catch (error) {
                      throw error;
                    }
                    if (thisSubject == null) {
                      isSubject = false;
                    } else {
                      setState(() {
                        isSubject = true;
                      });
                    }
                  },
                child: Icon(Icons.add,color: Colors.white,),
              ),

              Container(
                width: device.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.grey),
                  color: isSubject ? thisSubject.color : Colors.white,
                ),
                child: ListTile(
                  title: isSubject
                      ? Text('${thisSubject.subjectName}',style: GoogleFonts.ubuntu(),)
                      : Text('Subject',style: GoogleFonts.ubuntu(),),
                  leading: isSubject
                      ? Icon(
                          thisSubject.iconpara,
                          color: Colors.black,
                        )
                      : Icon(
                          Icons.book,
                          color: Colors.black,
                        ),
                ),
              ),
            ],
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Starts At',
                  style: GoogleFonts.ubuntu(fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      showPicker(
                          context: context,
                          value: _time,
                          onChange: onTimeChanged,
                          is24HrFormat: false,
                          onChangeDateTime: (DateTime time) {
                            getStartTime(time);
                          }),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey)),
                    width: device.width * 0.5,
                    child: Text(
                      '$_startTimeString',
                      style: GoogleFonts.ubuntu(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Ends At',
                  style: GoogleFonts.ubuntu(fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      showPicker(
                          context: context,
                          value: _time2,
                          onChange: onEndTimeChanged,
                          is24HrFormat: false,
                          onChangeDateTime: (DateTime time) {
                            getEndTime(time);
                          }),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(color: Colors.grey),
                    ),
                    width: device.width * 0.33,
                    child: Text(
                      '$_endTimeString',
                      style: GoogleFonts.montserrat(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Text(
                  '${_duration.inMinutes} min',
                  style: GoogleFonts.ubuntu(fontSize: 18),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
