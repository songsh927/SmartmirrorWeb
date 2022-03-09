import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:date_format/date_format.dart';

class topinfobar extends StatelessWidget {
  const topinfobar({Key? key}) : super(key: key);

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
