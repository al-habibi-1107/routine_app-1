import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
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
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(45))),
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
                height: device.height * 0.17,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: device.width * 0.07,
                    vertical: device.height * 0.01),
                height: device.height * 0.07,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(245, 79, 98, 1),
                        offset: Offset.infinite)
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(245, 79, 98, 1),
                      Color.fromRGBO(253, 52, 75, 1)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                // child: Text('hello'),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: device.width * 0.07,
                    vertical: device.height * 0.01),
                height: device.height * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(110, 149, 252, 1),
                      Color.fromRGBO(61, 110, 234, 1)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
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
