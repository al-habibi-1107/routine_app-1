import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/homescreen.dart';
import './models/items.dart';
import './screens/weekDayScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Items()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Routine App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomeScreen(),
          routes: {
            WeekDayScreen.routeName : (ctx)=>WeekDayScreen(),
          },
          ),
    );
  }
}
