import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  static const routeName = "/about-page";
  @override
  Widget build(BuildContext context) {
    final device= MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();
    String response = " ";

    Future<void> submit() async {
      String subject = "Schedulo Issue";
      bool isValid = _formKey.currentState.validate();
      if (isValid) {
        var url =
            'mailto:kamilanwar2001@gmail.com?subject=$subject&body=$response';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 01, 30, 1),
        title: Text(
          'About App',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Schedulo - The Routine App",
                      style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text("Version 1.0.0 beta"),
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Any Issues/Bugs in the Application"),
                Text("Report here:"),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Start Here",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Response must be atleast 7 charecters";
                      } else
                        return null;
                    },
                    onSaved: (value) {
                      response = value;
                    },
                    maxLines: 5,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    submit();
                  },
                  child: Text(
                    "Submit",
                  ),
                ),
              ],
            ),
            Text(
              "Contact Developer",
              style: GoogleFonts.ubuntu(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width:device.width*0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text("Kamil Anwar"),
                      Text("kamilanwar2001@gmail.com")
                    ],
                  ),
                ),
                Container(
                  width:device.width*0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text("Aditya"),
                      Text("kamilanwar2001@gmail.com")
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
