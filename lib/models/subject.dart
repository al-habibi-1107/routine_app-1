import 'package:flutter/material.dart';

class Subject {
  final String subjectName;
  final String teacher;
  final IconData iconpara;
  final Color color;
  final String note;

  Subject({
    @required this.subjectName,
    @required this.teacher,
    @required this.iconpara,
    @required this.color,
    this.note,
  });
}

class Item {
  Subject subject;
  DateTime startTime;
  DateTime endTime;
  String day;

  Item({
    @required this.subject,
    @required this.startTime,
    @required this.endTime,
    @required this.day,
  });
}
