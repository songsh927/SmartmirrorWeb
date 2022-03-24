import 'package:flutter/material.dart';
import 'package:smartmirror_webview/topinfobar.dart';
import 'package:table_calendar/table_calendar.dart';

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
            child: SizedBox(
              height: 400,
              child: TableCalendar(
                calendarBuilders: CalendarBuilders(
                  dowBuilder: (context, day) {},
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
        ],
      ),
    );
  }
}
