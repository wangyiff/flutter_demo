import 'package:flutter/material.dart';

/// * 授权协议
class MyAgreementPage extends StatefulWidget {
  @override
  _MyAgreementPageState createState() => new _MyAgreementPageState();
}

class _MyAgreementPageState extends State<MyAgreementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("My Agreement", style: TextStyle(color: Colors.white)),
            iconTheme: IconThemeData(color: Colors.white)),
        body: Center(child: Text("AGREEMENT PAGE")));
  }
}
