import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/homescreen.dart';
import './models/items.dart';
import './screens/weekDayScreen.dart';
import './screens/subjectInput.dart';
import './screens/editsubject.dart';
import './screens/settings_screen.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Setting up a provider so that all the
    // meembers can be accessed in different parts of code
    return MultiProvider(
      // A provider for Items
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
        // Defining a Home screen 
        home: HomeScreen(),
        // Defining Routes for easy navigation
        routes: {
          WeekDayScreen.routeName: (ctx) => WeekDayScreen(),
          SubjectInput.routeName : (ctx) => SubjectInput(),
          EditSubject.routeName : (ctx) => EditSubject(),
          SettingsScreen.routeName: (ctx) => SettingsScreen(),
        },
      ),
    );
  }
}
