import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:date_format/date_format.dart';

class mirror extends StatefulWidget {
  const mirror({Key? key}) : super(key: key);

  @override
  _mirrorState createState() => _mirrorState();
}

class _mirrorState extends State<mirror> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(40),
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
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
          '날씨',
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
