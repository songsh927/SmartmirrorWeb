import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:date_format/date_format.dart';
import 'package:http/http.dart' as http;

//lat=36.33990040535273
//lon=127.39051453027105

class topinfobar extends StatefulWidget {
  const topinfobar({Key? key}) : super(key: key);

  @override
  State<topinfobar> createState() => _topinfobarState();
}

class _topinfobarState extends State<topinfobar> {
  var data = {};
  var weatherData = {
    'location': '',
    'temp': '',
  };
  getData() async {
    var res = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=36.33990040535273&lon=127.39051453027105&appid=${key}&units=metric'));
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        TimerBuilder.periodic(
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
        Text(
          '${weatherData['location']} \n ${weatherData['temp']} \'C',
          style: TextStyle(color: Colors.white),
        ),
        Text(
          '미세먼지',
          style: TextStyle(color: Colors.white),
        )
      ]),
    );
  }
}
