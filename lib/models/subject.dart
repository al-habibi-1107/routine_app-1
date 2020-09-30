import 'package:flutter/material.dart';
// A class definition of a Subject 
// With its various attributes
class Subject {
   String subjectName;
   String teacher;
   IconData iconpara;
   Color color;
   String note;

  Subject({
    @required this.subjectName,
    @required this.teacher,
    @required this.iconpara,
    @required this.color,
    this.note,
  });
}

// A class defenition of an Item
// With its different items
class Item {
 String id;
  Subject subject;
  DateTime startTime;
  DateTime endTime;
  String day;

  Item({
   @required this.id,
    @required this.subject,
    @required this.startTime,
    @required this.endTime,
    @required this.day,
  });
}
