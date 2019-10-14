import 'package:flutter/material.dart';

/// * 我的学员
class MyStudentPage extends StatefulWidget {
  @override
  _MyStudentPageState createState() => new _MyStudentPageState();
}

class _MyStudentPageState extends State<MyStudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("My Student", style: TextStyle(color: Colors.white)),
            iconTheme: IconThemeData(color: Colors.white)),
        body: Center(child: Text("STUDENT PAGE")));
  }
}
