import 'package:flutter/material.dart';
import 'package:flutter_demo/config/UserConfig.dart';

/// * 个人资料
class MyUserInfoPage extends StatefulWidget {
  @override
  _MyUserInfoPageState createState() => new _MyUserInfoPageState();
}

class _MyUserInfoPageState extends State<MyUserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("个人资料", style: TextStyle(color: Colors.white)),
            iconTheme: IconThemeData(color: Colors.white)),
        body: Column(

            /// * 水平方向靠左对齐
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  padding: const EdgeInsets.only(top: 5.0),
                  child: new Column(children: <Widget>[
                    new Container(
                        width: 420,
                        margin: const EdgeInsets.only(
                            left: 16.0, right: 16.0, bottom: 15.0),
                        decoration: new BoxDecoration(
                            borderRadius:
                                new BorderRadius.all(new Radius.circular(6.0))),
                        child: new FlatButton(
                            child: new Column(children: <Widget>[
                          new Container(
                              child: new CircleAvatar(
                                  backgroundImage:
                                      new NetworkImage(UserConfig.headImg),
                                  radius: 40.0)),
                          new Container(
                              margin: const EdgeInsets.only(
                                  left: 20.0,
                                  right: 20.0,
                                  top: 15,
                                  bottom: 10.0),
                              child: new Text(UserConfig.nickname,
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black)))
                        ]))),
                  ])),
              Container(
                  margin: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 0, bottom: 10.0),
                  child: Row(children: <Widget>[
                    Text('昵称',
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.black54)),
                    Container(width: 60),
                    Text(UserConfig.nickname,
                        style: TextStyle(fontSize: 20.0, color: Colors.black))
                  ])),
              Container(
                  margin: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 5, bottom: 10.0),
                  child: Row(children: <Widget>[
                    Text('姓名',
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.black54)),
                    Container(width: 60),
                    Text(UserConfig.realName,
                        style: TextStyle(fontSize: 20.0, color: Colors.black))
                  ])),
              Container(
                  margin: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 5, bottom: 10.0),
                  child: Row(children: <Widget>[
                    Text('性别',
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.black54)),
                    Container(width: 60),
                    Text(UserConfig.gender,
                        style: TextStyle(fontSize: 20.0, color: Colors.black))
                  ])),
              Container(
                  margin: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 5, bottom: 10.0),
                  child: Row(children: <Widget>[
                    Text('身份证号',
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.black54)),
                    Container(width: 20),
                    Text(UserConfig.idCard,
                        style: TextStyle(fontSize: 20.0, color: Colors.black))
                  ])),
              Container(
                  margin: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 5, bottom: 10.0),
                  child: Row(children: <Widget>[
                    Text('手机号码',
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.black54)),
                    Container(width: 20),
                    Text(UserConfig.mobile,
                        style: TextStyle(fontSize: 20.0, color: Colors.black))
                  ])),
              Container(
                  margin: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 5, bottom: 20.0),
                  child: Row(children: <Widget>[
                    Text('所在地区',
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.black54)),
                    Container(width: 20),
                    Text(UserConfig.address,
                        style: TextStyle(fontSize: 20.0, color: Colors.black)),
                  ])),
              Container(color: Colors.black12, height: 6),
              Container(
                  margin: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 20, bottom: 10.0),
                  child: Row(children: <Widget>[
                    Text('推荐人',
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.black54)),
                    Container(width: 35),
                    Text(UserConfig.recommendPeopleName,
                        style: TextStyle(fontSize: 20.0, color: Colors.black))
                  ])),
              Container(
                  margin: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 5, bottom: 10.0),
                  child: Row(children: <Widget>[
                    Text('手机号码',
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.black54)),
                    Container(width: 15),
                    Text(UserConfig.recommendPeopleMobile,
                        style: TextStyle(fontSize: 20.0, color: Colors.black))
                  ])),
              Container(color: Colors.black12, height: 6),
              Container(height: 13),
              Center(
                  child: Text("如果个人资料有误，请联系招商老师修改",
                      style: TextStyle(fontSize: 16.0, color: Colors.black45)))
            ]));
  }
}
