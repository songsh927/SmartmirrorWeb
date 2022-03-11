import 'package:flutter/material.dart';
import 'package:smartmirror_webview/topinfobar.dart';

class schedule extends StatefulWidget {
  const schedule({Key? key, this.weatherData}) : super(key: key);

  final weatherData;

  @override
  _scheduleState createState() => _scheduleState();
}

class _scheduleState extends State<schedule> {
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
            child: Text('Schedule',
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
