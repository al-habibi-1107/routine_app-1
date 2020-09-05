import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../widgets/grid.dart';

class HomeScreen extends StatelessWidget {
  List<List<Object>> weekDays = [
    ['Monday', Icon(Icons.tag_faces)],
    ['Tuesday', Icon(Icons.tag_faces)],
    ['Wednesday', Icon(Icons.tag_faces)],
    ['Thursday', Icon(Icons.tag_faces)],
    ['Friday', Icon(Icons.tag_faces)],
    ['Saturday', Icon(Icons.tag_faces)],
  ];

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 01, 19, 1),
        title: Text('MyClasses'),
      ),
      body: Stack(
        children: [
          Container(
            height: device.height * 0.35,
            width: device.width,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 01, 19, 1),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(45),
              ),
            ),
          ),
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
                      'Hello!',
                      style: GoogleFonts.gayathri(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Classes on your way',
                      style: GoogleFonts.gayathri(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                height: device.height * 0.15,
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: device.width * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WeekGrid(weekDays[0][0], weekDays[0][1]),
                        WeekGrid(weekDays[1][0], weekDays[1][1]),
                        WeekGrid(weekDays[2][0], weekDays[2][1]),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: device.height * 0.019,
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: device.width * 0.04),
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
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: device.width * 0.07,
                    vertical: device.height * 0.01),
                height: device.height * 0.1,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'TODAY',
                          style: GoogleFonts.merriweather(
                            color: Color.fromRGBO(110, 149, 252, 1),
                            fontSize: 40
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: device.width * 0.07,
                    vertical: device.height * 0.01),
                height: device.height * 0.07,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                // child: Text('hello'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Container(
//   margin: EdgeInsets.symmetric(
//       horizontal: device.width * 0.07,
//       vertical: device.height * 0.01),
//   height: device.height * 0.07,
//   decoration: BoxDecoration(
//     boxShadow: [
//       BoxShadow(
//           color: Color.fromRGBO(245, 79, 98, 1),
//           offset: Offset.infinite)
//     ],
//     borderRadius: BorderRadius.all(Radius.circular(10)),
//     gradient: LinearGradient(
//       colors: [
//         Color.fromRGBO(245, 79, 98, 1),
//         Color.fromRGBO(253, 52, 75, 1)
//       ],
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//     ),
//   ),
//   // child: Text('hello'),
// ),
