import 'package:flutter/material.dart';

import './subject.dart';

class Items with ChangeNotifier {
  final List<Item> _items = [
    Item(
        subject: Subject(
          subjectName: 'Maths',
          teacher: 'DRM',
          iconpara: Icons.functions,
          color: Colors.purpleAccent,
        ),
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(minutes: 30)),
        day: 'Monday'),
    Item(
        subject: Subject(
          subjectName: 'DCLD',
          teacher: 'MDR',
          iconpara: Icons.wb_iridescent,
          color: Colors.lime,
        ),
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(minutes: 30)),
        day: 'Tuesday'),
    Item(
        subject: Subject(
          subjectName: 'COA',
          teacher: 'MDR',
          iconpara: Icons.laptop_mac,
          color: Colors.lightGreen,
        ),
        startTime: DateTime.now().add(Duration(minutes: 15)),
        endTime: DateTime.now().add(Duration(hours: 1)),
        day: 'Tuesday'),
  ];

  get items {
    return _items;
  }

  List<Item> getDayItems(String day) {
    List<Item> list = _items.where((element) => element.day == day).toList();
    //print(list[0].day);

    return list;
  }
}
