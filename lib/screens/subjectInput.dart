import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../models/items.dart';
import '../models/subject.dart';

class SubjectInput extends StatefulWidget {
  static const routeName = '/subject-input';

  @override
  _SubjectInputState createState() => _SubjectInputState();
}

class _SubjectInputState extends State<SubjectInput> {
  final _formKey = GlobalKey<FormState>();

  String _className = 'Class Name';
  String _teacher = '';
  IconData _icon = Icons.android;
  Color _color = Colors.white;

  List<IconData> iconList = [
    Icons.add,
    Icons.subscriptions,
    Icons.tablet_android,
    Icons.theaters,
    Icons.time_to_leave,
    Icons.track_changes,
    Icons.people_outline,
    Icons.mode_edit,
    Icons.monetization_on,
    Icons.graphic_eq,
    Icons.functions,
    Icons.headset,
    Icons.import_contacts,
    Icons.kitchen,
    Icons.language,
    Icons.local_library,
    Icons.map,
    Icons.memory,
    Icons.movie_filter,
    Icons.music_video,
    Icons.public,
    Icons.g_translate,
    Icons.wifi_tethering,
    Icons.computer,
  ];

  void changeColor(Color newcolor) {
    if (newcolor == null) {
      return;
    }
    setState(() {
      _color = newcolor;
    });
  }

  void onFormSubmit() {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      _formKey.currentState.save();
      Subject currentSubject =
          Provider.of<Items>(context, listen: false).makeSubject(
        _className,
        _teacher,
        _icon,
        _color,
      );
      Navigator.of(context).pop(currentSubject);
    }
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    _icon,
                    color: Colors.black,
                    size: 48,
                  ),
                  title: _className.length == 0
                      ? Text(
                          'Class Name',
                          style: GoogleFonts.arvo(fontSize: 20),
                        )
                      : Text(
                          '$_className',
                          style: GoogleFonts.arvo(fontSize: 20),
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Pick a color',
                                style: GoogleFonts.arvo(),
                              ),
                              FloatingActionButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(Icons.check),
                                backgroundColor: Color.fromRGBO(0, 01, 30, 1),
                              ),
                            ],
                          ),
                          content: SingleChildScrollView(
                            child: BlockPicker(
                              //availableColors: [],
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
                      child: ListTile(
                        leading: Icon(Icons.color_lens, color: Colors.black),
                        title: Text(
                          'Tap to Choose.',
                          style: GoogleFonts.breeSerif(
                              fontSize: 20, color: Colors.grey),
                        ),
                        trailing: CircleAvatar(
                          backgroundColor: _color,
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        child: AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          scrollable: true,
                          title: Text('Choose Icon'),
                          content: Container(
                            height: device.height * 0.3,
                            width: device.width * 0.5,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 20,
                                      childAspectRatio: 3 / 2),
                              itemBuilder: (ctx, i) {
                                return IconButton(
                                    icon: Icon(
                                      iconList[i],
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _icon = iconList[i];
                                      });
                                      Navigator.of(context).pop();
                                    });
                              },
                              itemCount: iconList.length,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      height: device.height * 0.08,
                      width: device.width + 0.5,
                      child: ListTile(
                        leading: Icon(_icon, color: Colors.black),
                        title: Text(
                          'Select Icon',
                          style: GoogleFonts.breeSerif(
                              fontSize: 20, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                ],
              ),
              key: _formKey),
          Container(
            margin: EdgeInsets.only(
                top: device.height * 0.15, left: device.width * 0.75),
            child: FloatingActionButton(
              onPressed: onFormSubmit,
              child: Icon(Icons.check),
            ),
          ),
        ],
      ),
    );
  }
}
