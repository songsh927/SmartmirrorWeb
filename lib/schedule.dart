import 'package:flutter/material.dart';
import 'package:smartmirror_webview/topinfobar.dart';

class schedule extends StatefulWidget {
  const schedule({Key? key, this.weatherData, this.scheduleData})
      : super(key: key);

  final weatherData;
  final scheduleData;
  @override
  _scheduleState createState() => _scheduleState();
}

class _scheduleState extends State<schedule> {
  var scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: Column(
        children: [
          topinfobar(weatherData: widget.weatherData),
          Flexible(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.scheduleData.length,
                  controller: scroll,
                  itemBuilder: (c, i) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0),
                                blurRadius: 6.0)
                          ]),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      alignment: Alignment.topLeft,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'title: ${widget.scheduleData[i]['title'].toString()}',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                                'text: ${widget.scheduleData[i]['text'].toString()}',
                                style: TextStyle(color: Colors.white)),
                          ]),
                    );
                  }))
        ],
      ),
    );
  }
}
