import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class HomeDetailPage extends StatefulWidget {
  final String detailUrl;

  HomeDetailPage({Key key, this.detailUrl}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      HomeDetailPageState(detailUrl: this.detailUrl);
}

class HomeDetailPageState extends State<HomeDetailPage> {
  String detailUrl;
  String detailDataStr;
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  HomeDetailPageState({Key key, this.detailUrl});

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: this.detailUrl,
        appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            iconTheme: IconThemeData(color: Colors.white)),
        withZoom: false,
        withLocalStorage: true,
        withJavascript: true);
  }
}
