import 'package:flutter/material.dart';

class calendar extends StatefulWidget {
  const calendar({Key? key}) : super(key: key);

  @override
  _calendarState createState() => _calendarState();
}

class _calendarState extends State<calendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: Text('Calendar',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white)),
    );
  }
}
