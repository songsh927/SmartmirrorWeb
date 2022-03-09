import 'package:flutter/material.dart';
import 'package:smartmirror_webview/topinfobar.dart';

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
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: topinfobar(),
    );
  }
}
