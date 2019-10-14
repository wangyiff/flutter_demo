import 'package:flutter/material.dart';

/// * 我的建议
class MyAdvicePage extends StatefulWidget {
  @override
  _MyAdvicePageState createState() => new _MyAdvicePageState();
}

class _MyAdvicePageState extends State<MyAdvicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: new Container(
                child: new Row(children: <Widget>[
          new Expanded(child: new Container(child: new Text("My Advice"))),
          new FlatButton(
              onPressed: () {
                showDialog<Null>(
                    context: context,
                    builder: (BuildContext context) {
                      return new SimpleDialog(
                          title: new Text('提示'),
                          children: <Widget>[
                            new SimpleDialogOption(
                                child: new Text('提交成功'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                })
                          ]);
                    }).then((val) {
                  print(val);
                });
              },
              child:
                  new Text("提交", style: new TextStyle(color: Colors.white70)))
        ]))),
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Container(
                child: new TextField(
                  decoration: new InputDecoration(
                      hintText: "请输入内容",
                      hintStyle: new TextStyle(color: Colors.white70)),
                ),
                margin: const EdgeInsets.all(16.0),
              )
            ],
          ),
        ));
  }
}
