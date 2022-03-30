import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:smartmirror_webview/topinfobar.dart';

class schedule extends StatefulWidget {
  const schedule({Key? key, this.weatherData}) : super(key: key);

  final weatherData;
  @override
  _scheduleState createState() => _scheduleState();
}

class _scheduleState extends State<schedule> {
  var scroll = ScrollController();

  var _todaySchedule = [];
  var todayDate = DateFormat("yyyyMMdd").format(DateTime.now());
  getTodaySchedule(todayDate) async {
    var res = await http
        .get(Uri.parse('http://localhost:3000/schedule?date=${todayDate}'));

    if (res.statusCode == 200) {
      setState(() {
        _todaySchedule = jsonDecode(res.body);
      });
      ;
    }
  }

  @override
  void initState() {
    super.initState();
    getTodaySchedule(todayDate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: Column(
        children: [
          topinfobar(weatherData: widget.weatherData),
          Flexible(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _todaySchedule.length,
                  controller: scroll,
                  itemBuilder: (c, i) {
                    return Container(
                        height: 70,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                            color: Colors.black,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 6.0)
                            ]),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              // height: ,
                              child: Text(
                                'date: ${_todaySchedule[i]['date'].toString()}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    // height: ,
                                    child: Text(
                                      'title: ${_todaySchedule[i]['title'].toString()}',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                  SizedBox(
                                    child: Text(
                                      'text: ${_todaySchedule[i]['text'].toString()}',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ]),
                          ],
                        ));
                  }))
        ],
      ),
    );
  }
}
