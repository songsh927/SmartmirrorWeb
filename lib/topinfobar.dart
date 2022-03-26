import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:date_format/date_format.dart';

class topinfobar extends StatefulWidget {
  const topinfobar({Key? key, this.weatherData}) : super(key: key);

  final weatherData;

  @override
  State<topinfobar> createState() => _topinfobarState();
}

class _topinfobarState extends State<topinfobar> {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.weatherData['location']} \n ${widget.weatherData['temp']} \'C',
              style: TextStyle(color: Colors.white),
            ),
            Image.network("http://openweathermap.org/img/w/" +
                widget.weatherData['icon'] +
                ".png"),
          ],
        ),
      ]),
    );
  }
}
