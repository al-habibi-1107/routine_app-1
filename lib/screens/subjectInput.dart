import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectInput extends StatefulWidget {
  static const routeName = '/subject-input';

  @override
  _SubjectInputState createState() => _SubjectInputState();
}

class _SubjectInputState extends State<SubjectInput> {
  final _formKey = GlobalKey<FormState>();

  String _className = 'Class Name';
  String _teacher = '';
  IconData _icon;

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Class'),
        backgroundColor: Color.fromRGBO(0, 01, 30, 1),
      ),
      body: Column(
        children: [
          Container(
            width: device.width,
            height: device.height * 0.18,
            color: Color.fromRGBO(0, 01, 30, 1),
            child: Center(
              child: Container(
                width: device.width * 0.7,
                height: device.height * 0.07,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: Icon(
                    Icons.android,
                    color: Colors.black,
                    size: 48,
                  ),
                  title: _className.length == 0
                      ? Text(
                          'Class Name',
                          style: GoogleFonts.roboto(fontSize: 20),
                        )
                      : Text(
                          '$_className',
                          style: GoogleFonts.roboto(fontSize: 20),
                        ),
                  subtitle: _teacher.length == 0
                      ? Text(
                          'Teacher',
                          style: GoogleFonts.roboto(fontSize: 16),
                        )
                      : Text(
                          '$_teacher',
                          style: GoogleFonts.roboto(fontSize: 16),
                        ),
                ),
              ),
            ),
          ),
          Form(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    width: device.width * 0.8,
                    child: TextFormField(
                      key: ValueKey('ClassName'),
                      decoration: InputDecoration(
                        labelText: 'Class Name',
                        icon: Icon(
                          Icons.book,
                          color: Colors.black,
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty || value.length < 3) {
                          return 'Class name must be atleast 3 charecters';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _className = value;
                        });
                      },
                      onSaved: (value) {
                        _className = value;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    width: device.width * 0.8,
                    child: TextFormField(
                      key: ValueKey('Teacher Name'),
                      decoration: InputDecoration(
                        labelText: 'Teacher Name',
                        icon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty || value.length < 3) {
                          return 'Teacher name must be atleast 3 charecters';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _teacher = value;
                        });
                      },
                      onSaved: (value) {
                        _teacher = value;
                      },
                    ),
                  )
                ],
              ),
              key: _formKey),
        ],
      ),
    );
  }
}
