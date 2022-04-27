import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartmirror_webview/main.dart';
import 'package:smartmirror_webview/topinfobar.dart';
import 'package:http/http.dart' as http;

class controller extends StatefulWidget {
  const controller({Key? key, this.weatherData}) : super(key: key);

  final weatherData;

  @override
  _controllerState createState() => _controllerState();
}

class _controllerState extends State<controller> {
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
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 6.0)
                  ]),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.fromLTRB(50, 20, 50, 20),
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
                    value: context.read<ControllerStore>().isCheckedLight,
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          context
                              .read<ControllerStore>()
                              .changeStatus('lightcontroller', 'on');
                        } else {
                          context
                              .read<ControllerStore>()
                              .changeStatus('lightcontroller', 'off');
                        }
                        context.read<ControllerStore>().isCheckedLight = value;
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
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 6.0)
                  ]),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.fromLTRB(50, 20, 50, 20),
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
                    value: context.read<ControllerStore>().isCheckedCurtain,
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          context
                              .read<ControllerStore>()
                              .changeStatus('curtaincontroller', 'on');
                        } else {
                          context
                              .read<ControllerStore>()
                              .changeStatus('curtaincontroller', 'off');
                        }
                        context.read<ControllerStore>().isCheckedCurtain =
                            value;
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
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 6.0)
                  ]),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.fromLTRB(50, 20, 50, 20),
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
                    value: context.watch<ControllerStore>().isCheckedTemp,
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          context
                              .read<ControllerStore>()
                              .changeStatus('tempcontroller', 'on');
                        } else {
                          context
                              .read<ControllerStore>()
                              .changeStatus('tempcontroller', 'off');
                        }
                        context.read<ControllerStore>().isCheckedTemp = value;
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
