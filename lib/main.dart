import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:volvere/next.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "volvere",
            style: TextStyle(
              fontSize: 29.0,
              fontWeight: FontWeight.bold,
              color: Colors.indigo[900],
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: contentS(),
      ),
    );
  }
}

DateTime selectedDate = null;

class contentS extends StatefulWidget {
  @override
  _contentSState createState() => _contentSState();
}

class _contentSState extends State<contentS> {
  buildDateP(BuildContext context) async {
    final DateTime picker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
    if (picker != null && picker != selectedDate) {
      setState(() {
        selectedDate = picker;
      });
    }
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  buildColorP(BuildContext context) {
    showDialog(
      context: context,
      child: AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
            showLabel: true,
            pickerAreaHeightPercent: 0.8,
          ),
        ),
      ),
    );
  }

  final _key = GlobalKey<FormState>();
  final controlDate = TextEditingController();
  final controlColor = TextEditingController();
  int _value = 1;
  final userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
            color: Color.fromRGBO(199, 202, 211, 1),
          ),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                    left: 20.0,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      // border: Border.all(
                      //   // color: Colors.indigo[900],
                      //   width: 0.0,
                      // ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        3.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          blurRadius: 5.0,
                          offset: Offset(-5, 5),
                          spreadRadius: 5.0,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(.8),
                          blurRadius: 5.0,
                          offset: Offset(5, -5),
                          spreadRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                      ),
                      child: TextFormField(
                        controller: userController,
                        cursorColor: Colors.indigo[900],
                        style: TextStyle(
                          color: Colors.indigo[900],
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: "User name",
                          hintStyle: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 13.0,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please Enter your Name";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),

                // addresss
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                    left: 20.0,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      // border: Border.all(
                      //   // color: Colors.indigo[900],
                      //   width: 0.0,
                      // ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        3.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          blurRadius: 5.0,
                          offset: Offset(-5, 5),
                          spreadRadius: 5.0,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(.8),
                          blurRadius: 5.0,
                          offset: Offset(5, -5),
                          spreadRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                      ),
                      child: TextFormField(
                        cursorColor: Colors.indigo[900],
                        style: TextStyle(
                          color: Colors.indigo[900],
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: "Address",
                          hintStyle: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 13.0,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please Enter your Address";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                // dataPicker
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                    left: 20.0,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      // border: Border.all(
                      //   // color: Colors.indigo[900],
                      //   width: 0.0,
                      // ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        3.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          blurRadius: 5.0,
                          offset: Offset(-5, 5),
                          spreadRadius: 5.0,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(.8),
                          blurRadius: 5.0,
                          offset: Offset(5, -5),
                          spreadRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                      ),
                      child: TextFormField(
                        controller: controlDate,
                        onTap: () {
                          setState(() {
                            controlDate.text = '';
                          });
                          buildDateP(context);
                          print(selectedDate);
                          controlDate.text =
                              "${selectedDate.toLocal()}".split(' ')[0];
                        },
                        cursorColor: Colors.indigo[900],
                        style: TextStyle(
                          color: Colors.indigo[900],
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: "Date of Birth",
                          hintStyle: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 13.0,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please Enter your Date";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),

// color picker
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                    left: 20.0,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      // border: Border.all(
                      //   // color: Colors.indigo[900],
                      //   width: 0.0,
                      // ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        3.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          blurRadius: 5.0,
                          offset: Offset(-5, 5),
                          spreadRadius: 5.0,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(.8),
                          blurRadius: 5.0,
                          offset: Offset(5, -5),
                          spreadRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                      ),
                      child: TextFormField(
                        controller: controlColor,
                        onTap: () {
                          buildColorP(context);
                          controlColor.text = pickerColor.toString();
                        },
                        cursorColor: Colors.indigo[900],
                        style: TextStyle(
                          color: Colors.indigo[900],
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: "Pick Favorite Colour",
                          hintStyle: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 13.0,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please Enter your Favorite colour";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
// end of color picker
// state dropdown
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                    left: 20.0,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      // border: Border.all(
                      //   // color: Colors.indigo[900],
                      //   width: 0.0,
                      // ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        3.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          blurRadius: 5.0,
                          offset: Offset(-5, 5),
                          spreadRadius: 5.0,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(.8),
                          blurRadius: 5.0,
                          offset: Offset(5, -5),
                          spreadRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                      ),
                      child: DropdownButton(
                        value: _value,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "Chandigarh",
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.indigo[900],
                              ),
                            ),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "Mumbai",
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.indigo[900],
                              ),
                            ),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "Gujrat",
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.indigo[900],
                              ),
                            ),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "Punjab",
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.indigo[900],
                              ),
                            ),
                            value: 4,
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "Kerala",
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.indigo[900],
                              ),
                            ),
                            value: 5,
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
// end of state dropdown
// submit button
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                    left: 15.0,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      // border: Border.all(
                      //   // color: Colors.indigo[900],
                      //   width: 0.0,
                      // ),
                      color: Colors.white,

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          blurRadius: 5.0,
                          offset: Offset(-5, 5),
                          spreadRadius: 5.0,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(.8),
                          blurRadius: 5.0,
                          offset: Offset(5, -5),
                          spreadRadius: 5.0,
                        ),
                      ],
                    ),
                    child: RaisedButton(
                      color: Colors.indigo[900],
                      onPressed: () {
                        if (!controlColor.text.isEmpty) {
                          String s = controlColor.text
                              .split('Color')[1]
                              .split('(')[1]
                              .split(')')[0]
                              .toString();
                          String sS = s.split("0x")[1].toString();
                          // print(sS);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Next(userController.text, sS)));
                        }
                        print("something");
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    left: 150.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          blurRadius: 5.0,
                          offset: Offset(5, -5),
                          spreadRadius: 5.0,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(.8),
                          blurRadius: 5.0,
                          offset: Offset(-5, 5),
                          spreadRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Image.asset('./images/logo.png'),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
