import 'package:flutter/material.dart';
import 'package:smartmirror_webview/topinfobar.dart';

class controller extends StatefulWidget {
  const controller({Key? key, this.weatherData}) : super(key: key);

  final weatherData;

  @override
  _controllerState createState() => _controllerState();
}

class _controllerState extends State<controller> {
  bool _isCheckedLight = false;
  bool _isCheckedCurtain = false;
  bool _isCheckedTemp = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: Column(
        children: [
          topinfobar(weatherData: widget.weatherData),
          //
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 6.0)
                  ]),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '전등',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w100,
                        color: Colors.white),
                  ),
                  Text(
                    'State',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w100,
                        color: Colors.white),
                  ),
                  Switch(
                    value: _isCheckedLight,
                    onChanged: (value) {
                      setState(() {
                        _isCheckedLight = value;
                      });
                    },
                    activeColor: Colors.white,
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                    inactiveThumbColor: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          //
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 6.0)
                  ]),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '커튼',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w100,
                        color: Colors.white),
                  ),
                  Text(
                    'State',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w100,
                        color: Colors.white),
                  ),
                  Switch(
                    value: _isCheckedCurtain,
                    onChanged: (value) {
                      setState(() {
                        _isCheckedCurtain = value;
                      });
                    },
                    activeColor: Colors.white,
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                    inactiveThumbColor: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          //
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 6.0)
                  ]),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '에어컨',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w100,
                        color: Colors.white),
                  ),
                  Text(
                    'State',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w100,
                        color: Colors.white),
                  ),
                  Switch(
                    value: _isCheckedTemp,
                    onChanged: (value) {
                      setState(() {
                        _isCheckedTemp = value;
                      });
                    },
                    activeColor: Colors.white,
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                    inactiveThumbColor: Colors.grey,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
