import 'package:flutter/material.dart';

/// * 我的账户
class MyAccountPage extends StatefulWidget {
  @override
  _MyAccountPageState createState() => new _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("My Account", style: TextStyle(color: Colors.white)),
            iconTheme: IconThemeData(color: Colors.white)),
        body: Center(child: Text("ACCOUNT PAGE")));
  }
}
