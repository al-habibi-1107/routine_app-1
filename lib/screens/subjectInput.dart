import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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
  Color _color = Colors.white;

  void changeColor(Color newcolor) {
    setState(() {
      _color = newcolor;
    });
  }

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
                width: device.width * 0.8,
                height: device.height * 0.09,
                decoration: BoxDecoration(
                    color: _color, borderRadius: BorderRadius.circular(10)),
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
                        border: InputBorder.none,
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
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(5),
                    width: device.width * 0.8,
                    child: TextFormField(
                      key: ValueKey('Teacher Name'),
                      decoration: InputDecoration(
                        border: InputBorder.none,
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
                  ),
                  Container(
                    width: device.width,
                    height: device.height * 0.03,
                    child: ColoredBox(color: Colors.grey[300]),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        child: AlertDialog(
                          title: Text('Pick a color'),
                          content: SingleChildScrollView(
                            child: BlockPicker(
                              pickerColor: _color,
                              onColorChanged: changeColor,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      height: device.height * 0.08,
                      width: device.width,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(Icons.color_lens, color: Colors.black),
                          Container(
                           
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: _color,
                              border:Border.all(color:Colors.black)
                            ),
                              child: Text(
                            'Tap to Choose.',
                            style: GoogleFonts.breeSerif(fontSize: 20),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Divider()
                ],
              ),
              key: _formKey),
        ],
      ),
    );
  }
}
