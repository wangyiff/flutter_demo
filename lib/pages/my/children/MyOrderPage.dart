import 'package:flutter/material.dart';

/// * 我的订单
class MyOrderPage extends StatefulWidget {
  @override
  _MyOrderPageState createState() => new _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("My Order", style: TextStyle(color: Colors.white)),
            iconTheme: IconThemeData(color: Colors.white)),
        body: Center(child: Text("ORDER PAGE")));
  }
}
