import 'package:flutter/material.dart';


class WeekGrid extends StatelessWidget {
  final String day;
  final Icon icon;

  WeekGrid(this.day,this.icon);
  @override
  Widget build(BuildContext context) {
    final device= MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
       gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(110, 149, 252, 1),
                      Color.fromRGBO(61, 110, 234, 1)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
        borderRadius: BorderRadius.all(Radius.circular(17))
      ),
      height: device.height*0.12,
      width: device.width * 0.27,
      
    );
    
  }
}