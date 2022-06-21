import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smartmirror_webview/mirror.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

import 'calendar.dart';
import 'controller.dart';
import 'schedule.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (c) => ControllerStore()),
  ], child: MyApp()));
}

class ControllerStore extends ChangeNotifier {
  bool isCheckedLight = false;
  bool isCheckedCurtain = false;
  bool isCheckedTemp = false;

  getStatus() async {
    http.Response res = await http.get(
        Uri.parse('http://localhost:3000/remote/'),
        headers: {"Content-Type": "application/json"});
    var statusData = jsonDecode(res.body);
    if (statusData['lightStatus'] == 'on') {
      isCheckedLight = true;
    } else {
      isCheckedLight = false;
    }
    if (statusData['curtainStatus'] == 'on') {
      isCheckedCurtain = true;
    } else {
      isCheckedCurtain = false;
    }
    if (statusData['tempStatus'] == 'on') {
      isCheckedTemp = true;
    } else {
      isCheckedTemp = false;
    }
  }

  changeStatus(id, ctrl) async {
    var status = {"ctrl": ctrl};
    http.Response res = await http.post(
        Uri.parse('http://localhost:3000/remote/${id}'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(status));

    print(res);
  }
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var tab = 0;
///////////////////////
//TODO! secure api key  9b0570fdbc3e5439812a6963a8c89609
//37.55502717455552, 126.98458770865963
  var apikey = '9b0570fdbc3e5439812a6963a8c89609';
  var lat = 37.55502717455552;
  var lon = 126.98458770865963;

  var scheduleData = [];
  var resApiWeatherData = {};
  var weatherData = {
    'location': '',
    'temp': '',
    'icon': '',
  };
  getWeather() async {
    var res = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${apikey}&units=metric'));
    if (res.statusCode == 200) {
      resApiWeatherData = jsonDecode(res.body);
      setState(() {
        weatherData['location'] = resApiWeatherData['name'].toString();
        weatherData['temp'] = resApiWeatherData['main']['temp'].toString();
        weatherData['icon'] = resApiWeatherData['weather'][0]['icon'];
      });
    } else {
      resApiWeatherData['name'] = 'loading';
    }
    (Timer.periodic(Duration(minutes: 30), (timer) async {
      getWeather();
    }));
  }

  getSchedule() async {
    var res = await http.get(Uri.parse('http://localhost:3000/schedule'));
    if (res.statusCode == 200) {
      scheduleData = jsonDecode(res.body);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getWeather();
    getSchedule();
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
      bottomNavigationBar: SizedBox(
        height: 100,
        width: double.infinity,
        child: BottomNavigationBar(
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
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month_outlined,
                color: tab == 1 ? Colors.white : Colors.grey,
              ),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.schedule_outlined,
                color: tab == 2 ? Colors.white : Colors.grey,
              ),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.cloud_circle_outlined,
                color: tab == 3 ? Colors.white : Colors.grey,
              ),
              label: 'Controller',
            ),
          ],
          onTap: (i) {
            setState(() {
              tab = i;
            });
          },
        ),
      ),
    );
  }
}
