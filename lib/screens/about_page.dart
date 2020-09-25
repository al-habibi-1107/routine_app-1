import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  static const routeName = "/about-page";

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final _formKey = GlobalKey<FormState>();

  String response = " ";

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    
    // A submit function to launch the mail
    Future<void> submit() async {
      String subject = "Schedulo Issue";
      // validate the form with its formKey
      bool isValid = _formKey.currentState.validate();
      if (isValid) {
        // if the form is validated then save the form
        _formKey.currentState.save();
        print(response);
        // get the url
        var url =
            'mailto:devpro.Inc@outlook.com?subject=$subject&body=$response';
        // first check if the url can be launched or not
        if (await canLaunch(url)) {
          // if true , launch the url
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                Text("Any Issues/Bugs in the Application",style: GoogleFonts.montserrat(),),
                Text("Report here:",style: GoogleFonts.montserrat(),),
                // Make a form to use as a body
                // for the email
                Form(
                  key: _formKey,
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Start here.."),
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
                // A button to launch the function
                // causes to submit thr form
                FlatButton(
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(7)),
                  color: Color.fromRGBO(0, 01, 30, 1),
                  splashColor: Colors.grey,
                  onPressed: () {
                    submit();
                  },
                  child: Text(
                    "Submit",style: GoogleFonts.montserrat(fontWeight:FontWeight.w600,color: Colors.white),
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
                  width: device.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Kamil Anwar"),
                      Text("kamilanwar2001@gmail.com")
                    ],
                  ),
                ),
                Container(
                  width: device.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Aditya"),
                      Text("kamilanwar2001@gmail.com")
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                "Made in India",
                style: GoogleFonts.montserrat(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
