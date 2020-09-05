import 'package:flutter/material.dart';

import './subject.dart';

class Item {
  final Subject subject;
  final DateTime startTime;
  final DateTime endTime;

  Item(
    this.subject,
    this.startTime,
    this.endTime,
  );
}
