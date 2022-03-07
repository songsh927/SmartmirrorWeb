import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        //mainPage
        Container(
          padding: EdgeInsets.all(40),
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: TimerBuilder.periodic(
            const Duration(seconds: 1),
            builder: (context) {
              return Text(
                formatDate(DateTime.now(), [hh, ' : ', nn, ' ', am]),
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              );
            },
          ),
        ),
        //calendar
        Container(
          padding: EdgeInsets.all(40),
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: Text('Calendar',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.white)),
        ),
        //schedule
        Container(
          padding: EdgeInsets.all(40),
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: Text('Schedule',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.white)),
        ),
        //Controller
        Container(
          padding: EdgeInsets.all(40),
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: Text('Controller',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.white)),
        ),
      ][tab],
      //
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.black,
        //unselectedItemColor: Colors.grey,
        //selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.timelapse_outlined,
              color: tab == 0 ? Colors.white : Colors.grey,
            ),
            label: 'Main',
            //activeIcon: Icon(Icons.timelapse_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month_outlined,
              color: tab == 1 ? Colors.white : Colors.grey,
            ),
            label: 'Calendar',
            //activeIcon: Icon(Icons.calendar_month),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.schedule_outlined,
              color: tab == 2 ? Colors.white : Colors.grey,
            ),
            label: 'Schedule',
            //activeIcon: Icon(Icons.schedule),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.cloud_circle_outlined,
              color: tab == 3 ? Colors.white : Colors.grey,
            ),
            label: 'Controller',
            //activeIcon: Icon(Icons.cloud),
          ),
        ],
        onTap: (i) {
          setState(() {
            tab = i;
          });
        },
      ),
    );
  }
}
