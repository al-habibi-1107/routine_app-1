import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../widgets/grid.dart';
import '../screens/weekDayScreen.dart';
import './settings_screen.dart';
import '../models/items.dart';
import '../models/subject.dart';

class HomeScreen extends StatelessWidget {
  // Variables to get Current Date and Day used
  // in the code
  final todayDate = DateFormat.yMMMMEEEEd().format(DateTime.now());
  final todayDay = DateFormat.EEEE().format(DateTime.now());
   
   // A List of Lists to hold all the weekDays
  final  List<List<Object>> weekDays = [
    ['Monday', Icon(Icons.tag_faces)],
    ['Tuesday', Icon(Icons.tag_faces)],
    ['Wednesday', Icon(Icons.tag_faces)],
    ['Thursday', Icon(Icons.tag_faces)],
    ['Friday', Icon(Icons.tag_faces)],
    ['Saturday', Icon(Icons.tag_faces)],
  ];
  
  @override
  Widget build(BuildContext context) {
  
    // print(todayDay);
    // Variable to get the device Size
    final device = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      // Properties of App Bar
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 01, 30, 1),
        title: Text(
          'Schedulo',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(),
        ),
        actions: [
          IconButton(icon: Icon(Icons.settings), onPressed: (){
            Navigator.of(context).pushNamed(SettingsScreen.routeName);
          }),
        ],
      ),
      // In Body we Stack up Widgets for an
      // Interactive UI which is easier to build
      body: Stack(
        children: [
      // Stack Level 1, A background Container
          Container(
            height: device.height * 0.35,
            width: device.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 01, 30, 0.5),
                  blurRadius: 5.0, // soften the shadow
                  spreadRadius: 1.0, //extend the shadow
                  offset: Offset(
                    0.5, // Move to right 10  horizontally
                    1.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
              color: Color.fromRGBO(0, 01, 30, 1),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(45),
              ),
            ),
          ),
      // Stack Level 2 - A Colum with Title Texts
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: device.width * 0.1, top: device.height * 0.015),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello..!',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 30,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Classes on your way',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                height: device.height * 0.15,
              ),
              // The UI Build of the Grid of the Days
              // With Custom Rows and columns
              Column(
                children: <Widget>[
                  Container(
                    
                    margin:
                        EdgeInsets.symmetric(horizontal: device.width * 0.04),
              // ROW -1 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // WeekGrid is A custom Widget for the 
                        // Grid Items
                        WeekGrid(weekDays[0][0], weekDays[0][1]),
                        WeekGrid(weekDays[1][0], weekDays[1][1]),
                        WeekGrid(weekDays[2][0], weekDays[2][1]),
                      ],
                    ),
                  ),
                  // Some Space to Seperate the Rows
                  SizedBox(
                    height: device.height * 0.019,
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: device.width * 0.04),
                  // ROW -2
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WeekGrid(weekDays[3][0], weekDays[3][1]),
                        WeekGrid(weekDays[4][0], weekDays[4][1]),
                        WeekGrid(weekDays[5][0], weekDays[5][1]),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: device.height * 0.14,
              ),
              // Setting up a clickable Container
              // with custom Colors and contents
              GestureDetector(
                // On Tap we Navigate to another Screen Showing The Schedule for the current day
                // we pass the current day as an argument 
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(WeekDayScreen.routeName, arguments: todayDay);
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: device.width * 0.04),
                  margin: EdgeInsets.symmetric(
                      horizontal: device.width * 0.07,
                      vertical: device.height * 0.01),
                  height: 95,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(253, 52, 75, 0.5),
                        blurRadius: 10.0, // soften the shadow
                        spreadRadius: 0.5, //extend the shadow
                        offset: Offset(
                          0.0, // Move to right 10  horizontally
                          2.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                    border: Border.all(color: Color.fromRGBO(253, 52, 75, 1)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromRGBO(253, 52, 75, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'TODAY',
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 40),
                          ),
                          Text(
                            todayDate,
                            style: GoogleFonts.arvo(color: Colors.white),
                          ),
                        ],
                      ),

                      // Image.asset('assets/calender.png')
                      Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                        size: 46.0,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(

                ),
                margin: EdgeInsets.symmetric(
                    horizontal: device.width * 0.07,
                    vertical: device.height * 0.01),
                height: device.height * 0.1,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(30, 54, 164, 0.5),
                      blurRadius: 10.0, // soften the shadow
                      spreadRadius: 0.5, //extend the shadow
                      offset: Offset(
                        0.0, // Move to right 10  horizontally
                        2.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  border: Border.all(color: Color.fromRGBO(30, 54, 164, 1)),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(30, 54, 164, 1),
                ),
                // child: Text('hello'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
