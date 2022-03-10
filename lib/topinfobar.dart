import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:date_format/date_format.dart';
import 'package:http/http.dart' as http;

//292d927441fec4e541a809578e0870fe
//lat=36.33990040535273
//lon=127.39051453027105

class topinfobar extends StatefulWidget {
  const topinfobar({Key? key}) : super(key: key);

  @override
  State<topinfobar> createState() => _topinfobarState();
}

class _topinfobarState extends State<topinfobar> {
  // var data = {
  //   "coord": {"lon": 127.3905, "lat": 36.3399},
  //   "weather": [
  //     {
  //       "id": 804,
  //       "main": "Clouds",
  //       "description": "overcast clouds",
  //       "icon": "04d"
  //     }
  //   ],
  //   "base": "stations",
  //   "main": {
  //     "temp": 290.16,
  //     "feels_like": 288.83,
  //     "temp_min": 290.16,
  //     "temp_max": 290.98,
  //     "pressure": 1020,
  //     "humidity": 35,
  //     "sea_level": 1020,
  //     "grnd_level": 1014
  //   },
  //   "visibility": 10000,
  //   "wind": {"speed": 2.34, "deg": 260, "gust": 4.55},
  //   "clouds": {"all": 100},
  //   "dt": 1646901865,
  //   "sys": {
  //     "type": 1,
  //     "id": 8131,
  //     "country": "KR",
  //     "sunrise": 1646862564,
  //     "sunset": 1646904752
  //   },
  //   "timezone": 32400,
  //   "id": 1835224,
  //   "name": "Daejeon",
  //   "cod": 200
  // };

  var data = {};
  getData() async {
    var res = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=36.33990040535273&lon=127.39051453027105&appid=292d927441fec4e541a809578e0870fe'));
    if (res.statusCode == 200) {
      setState(() {
        data = jsonDecode(res.body);
        print(data);
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
          '${data['name']}',
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
