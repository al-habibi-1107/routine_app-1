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
  // A list of days 
  final List<String> weekDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];
  // Variable to contain the current tab which is being viewed
  int currentTab = 0;
  bool isEmpty;
  String currentDay;
  bool first = true;

  bool editmode = false;
  @override
  Widget build(BuildContext context) {
    // This code runs only for once , ang initialises the current Day
    if (first) {
      currentDay = ModalRoute.of(context).settings.arguments;
      first = false;
    }
    // Get the current Tab with the help of current day
    currentTab = weekDays.indexWhere((element) => element == currentDay);
    // Get all the items in the current Day via the Provider
    // in the Items model
    List<Item> currentElements =
        Provider.of<Items>(context).getDayItems(currentDay);
    isEmpty = currentElements.isEmpty;
    
    // A funtion to change the current Day in the tab and
    // to get all elements in the day
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
    // Returns a Tab Bar with Subjects
    return DefaultTabController(
      initialIndex: currentTab,
      length: weekDays.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Timetable', style: GoogleFonts.zillaSlab()),
          backgroundColor: Color.fromRGBO(0, 01, 30, 1),
          centerTitle: true,
          // When The button is tapped , the
          // edit mode icons are shown to add new items
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
          // Add a tabBar at the bottom of app bar
          bottom: TabBar(
            onTap: (index) {
              currentTab = index;
              changeCurrentDay(index);
            },
            isScrollable: true,
            // representing all the days
            // in the scrollabe tab
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
            // When there are no elements a image is shown
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
                  // A list of Items of Custom Item Tile is made
                : ListView.builder(
                    itemBuilder: (ctx, i) {
                      return ItemTile(currentElements[i], editmode);
                    },
                    itemCount: currentElements.length,
                  ),
                  // In Edit mode , A button is added to 
                  // Show a bottom Sheet fo adding new items
            editmode
                ? Positioned(
                    bottom: device.height * 0.03,
                    right: device.width * 0.05,
                    child: FloatingActionButton(
                      backgroundColor: Color.fromRGBO(110, 149, 252, 1),
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
