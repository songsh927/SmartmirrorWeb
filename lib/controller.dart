import 'package:flutter/material.dart';
import 'package:smartmirror_webview/topinfobar.dart';

class controller extends StatefulWidget {
  const controller({Key? key}) : super(key: key);

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
          topinfobar(),
          Container(
            padding: EdgeInsets.all(40),
            child: Text('Controller',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
