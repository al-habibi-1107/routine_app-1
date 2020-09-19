import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = "/settings-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 01, 30, 1),
        title: Text(
          'Schedulo',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(),
        ),
      ),
      body: ListView(children: [
        ListTile(
          leading:
              Image.asset("assets/info.png", scale: 15, fit: BoxFit.contain),
          title: Text(
            "About App",
            style:
                GoogleFonts.ubuntu(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Text("Version,Suggesions and Developer Contact"),
        ),
      ]),
    );
  }
}
