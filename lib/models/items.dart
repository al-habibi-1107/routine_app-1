import 'package:flutter/material.dart';

import './subject.dart';
import '../helpers/Dbhelper.dart';

class Items with ChangeNotifier {
  List<Item> _items = [
    // Item(
    //     id: "12355609asb",
    //     subject: Subject(
    //       subjectName: 'Maths',
    //       teacher: 'DRM',
    //       iconpara: Icons.functions,
    //       color: Colors.purpleAccent,
    //     ),
    //     startTime: DateTime.now(),
    //     endTime: DateTime.now().add(Duration(minutes: 30)),
    //     day: 'Monday'),
    // Item(
    //     id: "2234habd77",
    //     subject: Subject(
    //       subjectName: 'DCLD',
    //       teacher: 'MDR',
    //       iconpara: Icons.wb_iridescent,
    //       color: Colors.lime,
    //     ),
    //     startTime: DateTime.now(),
    //     endTime: DateTime.now().add(Duration(minutes: 30)),
    //     day: 'Tuesday'),
    // Item(
    //     id: "gg3jj23389",
    //     subject: Subject(
    //       subjectName: 'COA',
    //       teacher: 'MDR',
    //       iconpara: Icons.laptop_mac,
    //       color: Colors.lightGreen,
    //     ),
    //     startTime: DateTime.now().add(Duration(minutes: 15)),
    //     endTime: DateTime.now().add(Duration(hours: 1)),
    //     day: 'Tuesday'),
  ];

  get items {
    return _items;
  }

  Future<void> getFromDb() async {
      final dbItems = await DBHelper().getData('classes');
//        Color hexToColor(String code) {
//   return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
// }
      _items = dbItems.map((itemDb) {
        return Item(
          id: itemDb['id'],
          subject: Subject(
              subjectName: itemDb['subject'],
              teacher: itemDb['teacher'],
              iconpara:Icons.cake,
              color:Color(itemDb['color'])),
          startTime: DateTime.tryParse(itemDb['startTime']) ,
          endTime: DateTime.tryParse(itemDb['endTime']) ,
          day: itemDb['day'],
        );
      }).toList();
    }

  List<Item> getDayItems(String day) {
    
    getFromDb();
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

  Future<void>getIntoDb(Item newItem)async{
    
    await DBHelper().insertDB('classes',{
      'id':newItem.id,
      'subject': newItem.subject.subjectName,
      'teacher':newItem.subject.teacher,
      'icon':newItem.subject.iconpara.toString(),
      'color':newItem.subject.color.value,
      'startTime':newItem.startTime.toString(),
      'endTime':newItem.endTime.toString(),
      'day':newItem.day,
    } );

    }

  void addItem(Subject newSubject, DateTime start, DateTime end, String day) {
    Item newItem = Item(
        id: DateTime.now().toString(),
        subject: newSubject,
        startTime: start,
        endTime: end,
        day: day);

    _items.add(newItem);
    getIntoDb(newItem);
    

    notifyListeners();
  }

  void deleteItem(Item newItem) {
    _items.remove(newItem);
    DBHelper().removeItem('classes', newItem.id);
    notifyListeners();
  }

  void editItem(String id, String subName, String techName, DateTime startTime,
      DateTime endTime) {
    Item editItem = _items.firstWhere((element) => element.id == id);
    _items.removeWhere((element) => element.id == id);

    editItem.subject.subjectName = subName;
    editItem.subject.teacher = techName;
    editItem.startTime = startTime;
    editItem.endTime = endTime;

    _items.add(editItem);

    notifyListeners();
  }
}
