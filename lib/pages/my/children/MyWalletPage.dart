import 'package:flutter/material.dart';

/// * 我的钱包
class MyWalletPage extends StatefulWidget {
  @override
  _MyWalletPageState createState() => new _MyWalletPageState();
}

class _MyWalletPageState extends State<MyWalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("My Wallet", style: TextStyle(color: Colors.white)),
            iconTheme: IconThemeData(color: Colors.white)),
        body: Center(child: Text("WALLET PAGE")));
  }
}
