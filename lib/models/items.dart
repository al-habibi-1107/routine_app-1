import 'package:flutter/material.dart';

import './subject.dart';

class Items with ChangeNotifier {
  final List<Item> _items = [
    Item(
        id:"12355609asb",
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
      id:"2234habd77",
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
     id:"gg3jj23389",
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

  Subject makeSubject(
      String className, String teacher, IconData icon, Color color) {
    return Subject(
      color: color,
      subjectName: className,
      teacher: teacher,
      iconpara: icon,
    );
  }

  void addItem(Subject newSubject,DateTime start,DateTime end,String day){
    Item newItem=Item(id:DateTime.now().toString(),
      subject: newSubject, startTime: start, endTime: end, day: day);

    _items.add(newItem);
    notifyListeners();
  }

  void deleteItem(Item newItem){
    _items.remove(newItem);
  notifyListeners();
  }

  void editItem(String id, String subName,String techName,DateTime startTime,DateTime endTime ){

    Item editItem= _items.firstWhere((element) => element.id==id);
    _items.removeWhere((element) => element.id==id);
    
    editItem.subject.subjectName=subName;
    editItem.subject.teacher=techName;
    editItem.startTime=startTime;
    editItem.endTime=endTime;

    _items.add(editItem);
    
    
    notifyListeners();
  }

}
