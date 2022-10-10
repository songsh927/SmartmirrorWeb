import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartmirror_webview/topinfobar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

class calendar extends StatefulWidget {
  const calendar({Key? key, this.weatherData}) : super(key: key);

  final weatherData;

  @override
  _calendarState createState() => _calendarState();
}

class _calendarState extends State<calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  var todayDate = DateTime.now();

  var todayEvent = [];

  void initState() {
    _getTodayEvent(todayDate);
    super.initState();
  }

  _getTodayEvent(_selectDay) async {
    String formattedDate = DateFormat("yyyyMMdd").format(_selectDay);
    var res = await http.get(
      Uri.parse('http://localhost:3000/schedule?date=${formattedDate}'),
      headers: {"Content-Type": "application/json"},
    );
    setState(() {
      todayEvent = jsonDecode(res.body);
    });
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
          Row(
            children: [
              Flexible(
                flex: 1,
                // padding: EdgeInsets.all(40),
                child: SizedBox(
                  child: TableCalendar(
                    rowHeight: 100,
                    headerStyle: const HeaderStyle(
                      titleTextStyle:
                          TextStyle(color: Colors.white, fontSize: 25),
                      formatButtonTextStyle:
                          TextStyle(color: Colors.black, fontSize: 16.0),
                      formatButtonDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                    daysOfWeekStyle: const DaysOfWeekStyle(
                      weekdayStyle: TextStyle(color: Colors.white),
                      weekendStyle: TextStyle(color: Colors.white),
                    ),
                    calendarStyle: const CalendarStyle(
                      weekendTextStyle: TextStyle(color: Colors.white),
                      defaultTextStyle: TextStyle(color: Colors.white),
                      // highlighted color for today
                      todayDecoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.blueGrey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    focusedDay: DateTime.now(),
                    firstDay: DateTime.utc(2010, 1, 1),
                    lastDay: DateTime.utc(2040, 12, 31),
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                        _getTodayEvent(_selectedDay);
                      });
                    },
                    calendarFormat: _calendarFormat,
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 600,
                height: 700,
                child: ListView.builder(
                    itemCount: todayEvent.length,
                    itemBuilder: (c, i) {
                      return Container(
                        width: double.infinity,
                        height: 100,
                        margin: EdgeInsets.fromLTRB(70, 10, 70, 10),
                        padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 6.0)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'title: ${todayEvent[i]['title']}',
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            Text(
                              'text: ${todayEvent[i]['text']}',
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
