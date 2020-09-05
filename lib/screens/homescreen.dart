import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('MyClasses'),
      ),
      body: Stack(
        children: [
          Container(
            height: device.height,
            width: device.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.green,
                  Colors.blue,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
