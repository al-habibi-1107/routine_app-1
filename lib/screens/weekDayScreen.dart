import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

import '../models/subject.dart';
import '../models/items.dart';
import '../widgets/itemtile.dart';
import '../widgets/itemBottomSheet.dart';

class WeekDayScreen extends StatefulWidget {
  static const routeName = '/week-day-screen';

  @override
  _WeekDayScreenState createState() => _WeekDayScreenState();
}

class _WeekDayScreenState extends State<WeekDayScreen> {
  final List<String> weekDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];
  int currentTab = 0;
  bool isEmpty;
  String currentDay;
  bool first = true;

  bool editmode = false;
  @override
  Widget build(BuildContext context) {
    if (first) {
      currentDay = ModalRoute.of(context).settings.arguments;
      first = false;
    }

    currentTab = weekDays.indexWhere((element) => element == currentDay);
    List<Item> currentElements =
        Provider.of<Items>(context).getDayItems(currentDay);
    isEmpty = currentElements.isEmpty;

    void changeCurrentDay(int index) {
      setState(() {
        currentDay = weekDays[index];
        currentElements =
            Provider.of<Items>(context, listen: false).getDayItems(currentDay);
        isEmpty = currentElements.isEmpty;
        print(currentDay);
      });
    }

    final device = MediaQuery.of(context).size;
    return DefaultTabController(
      initialIndex: currentTab,
      length: weekDays.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Timetable', style: GoogleFonts.zillaSlab()),
          backgroundColor: Color.fromRGBO(0, 01, 30, 1),
          centerTitle: true,
          actions: <Widget>[
            editmode
                ? IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () {
                      setState(() {
                        editmode = false;
                      });
                    },
                  )
                : IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      setState(() {
                        editmode = true;
                      });
                    },
                  ),
          ],
          bottom: TabBar(
            onTap: (index) {
              currentTab = index;
              changeCurrentDay(index);
            },
            isScrollable: true,
            tabs: [
              Text(
                weekDays[0],
                style: TextStyle(fontSize: 20),
              ),
              Text(
                weekDays[1],
                style: TextStyle(fontSize: 20),
              ),
              Text(
                weekDays[2],
                style: TextStyle(fontSize: 20),
              ),
              Text(
                weekDays[3],
                style: TextStyle(fontSize: 20),
              ),
              Text(
                weekDays[4],
                style: TextStyle(fontSize: 20),
              ),
              Text(
                weekDays[5],
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            isEmpty
                ? Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: device.width * 0.25,
                      vertical: device.height * 0.25,
                    ),
                    child: Center(
                        child: Image.asset(
                      'assets/empty_msg.png',
                      fit: BoxFit.scaleDown,
                    )),
                  )
                : ListView.builder(
                    itemBuilder: (ctx, i) {
                      return ItemTile(currentElements[i],editmode);
                    },
                    itemCount: currentElements.length,
                  ),
            editmode
                ? Positioned(
                    bottom: device.height * 0.03,
                    right: device.width * 0.05,
                    child: FloatingActionButton(
                      backgroundColor: Color.fromRGBO(0, 1, 35, 1),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ItemBottomSheet(currentDay);
                            });
                            
                      },
                      child: Icon(Icons.add),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
