import 'package:flutter/material.dart';
import 'package:smartmirror_webview/topinfobar.dart';

class calendar extends StatefulWidget {
  const calendar({Key? key, this.weatherData}) : super(key: key);

  final weatherData;

  @override
  _calendarState createState() => _calendarState();
}

class _calendarState extends State<calendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: Column(
        children: [
          topinfobar(weatherData: widget.weatherData),
          Container(
            padding: EdgeInsets.all(40),
            child: Text('Calendar',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
