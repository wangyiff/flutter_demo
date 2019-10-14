import 'package:flutter/material.dart';

/// * 投诉热线
class MyComplaintsPage extends StatefulWidget {
  @override
  _MyComplaintsPageState createState() => new _MyComplaintsPageState();
}

class _MyComplaintsPageState extends State<MyComplaintsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("My Complaints", style: TextStyle(color: Colors.white)),
            iconTheme: IconThemeData(color: Colors.white)),
        body: Center(child: Text("COMPLAINTS PAGE")));
  }
}
