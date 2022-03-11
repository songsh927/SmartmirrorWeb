import 'package:flutter/material.dart';
import 'package:smartmirror_webview/mirror.dart';
// import 'package:smartmirror_webview/topinfobar.dart';
// import 'package:weather_icons/weather_icons.dart';
// import 'package:weather/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'calendar.dart';
import 'controller.dart';
import 'schedule.dart';

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
///////////////////////
  var apikey = 'api key';
  var data = {};
  var weatherData = {
    'location': '',
    'temp': '',
  };
  getData() async {
    var res = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=36.33990040535273&lon=127.39051453027105&appid=${apikey}&units=metric'));
    if (res.statusCode == 200) {
      data = jsonDecode(res.body);
      setState(() {
        weatherData['location'] = data['name'].toString();
        weatherData['temp'] = data['main']['temp'].toString();
        print(weatherData);
      });
    } else {
      data['name'] = 'loading';
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        mirror(weatherData: weatherData),
        calendar(weatherData: weatherData),
        schedule(weatherData: weatherData),
        controller(weatherData: weatherData),
      ][tab],
      //
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.rectangle_outlined,
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
