import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Next extends StatefulWidget {
  @override
  _NextState createState() => _NextState();
  String color;
  String name;
  Next(this.name, this.color);
}

class _NextState extends State<Next> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: Hexcolor(widget.color)),
          child: ListTile(
            title: Text(
              "${widget.name}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
