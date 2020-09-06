import 'package:flutter/material.dart';

import './subject.dart';

class Items with ChangeNotifier {
  final List<Item> _items = [
    Item(
      subject: Subject(
        subjectName: 'Maths',
        teacher: 'DRM',
        icon: Icon(Icons.tag_faces),
        color: Colors.brown,
      ),
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(minutes:30)),
      day: 'Monday'
    ),
    Item(
      subject: Subject(
        subjectName: 'DCLD',
        teacher: 'MDR',
        icon: Icon(Icons.tag_faces),
        color: Colors.pink,
      ),
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(minutes:30)),
      day: 'Tuesday'
    ),
  ];

  get items {
    return _items;
  }

  List<Item> getDayItems(String day) {
   List<Item>list= _items.where((element) => element.day==day).toList();
     //print(list[0].day);
     
     return list;
     
  }
}
