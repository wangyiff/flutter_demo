import 'package:flutter_demo/config/UserConfig.dart';
import 'package:flutter_demo/pages/my/MyPageListItem.dart';
import 'package:flutter_demo/pages/my/children/MyAccountPage.dart';
import 'package:flutter_demo/pages/my/children/MyAdvicePage.dart';
import 'package:flutter_demo/pages/my/children/MyAgreementPage.dart';
import 'package:flutter_demo/pages/my/children/MyOrderPage.dart';
import 'package:flutter_demo/pages/my/children/MyStudentPage.dart';
import 'package:flutter_demo/pages/my/children/MyUserInfoPage.dart';
import 'package:flutter_demo/pages/my/children/MyWalletPage.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';

/// * 页面 - 我的
class MyPage extends StatelessWidget {
  static const String TAG_START = "startDivider";
  static const String TAG_END = "endDivider";
  static const String TAG_BLANK = "blankDivider";

  static const double IMAGE_ICON_WIDTH = 30.0;
  static const double ARROW_ICON_WIDTH = 16.0;

  final imagePaths = [
    "images/ic_my_blog.png",
    "images/ic_my_blog.png",
    "images/ic_my_team.png",
    "images/ic_nav_news_normal.png",
    "images/ic_discover_pos.png",
    "images/ic_comment.png",
    "images/ic_discover_shake.png"
  ];

  final titles = [
    "Account",
    "Wallet",
    "Student",
    "Order",
    "Agreement",
    "Advice",
    "Complaints"
  ];
  final rightArrowIcon = Image.asset('images/ic_arrow_right.png',
      width: ARROW_ICON_WIDTH, height: ARROW_ICON_WIDTH);
  final titleTextStyle = TextStyle(fontSize: 16.0);
  final List listData = [];

  MyPage() {
    _initData();
  }

  /// * 初始化列表骨架
  _initData() {
    listData.add(TAG_BLANK);
    listData.add(TAG_START);
    for (int i = 0; i < 5; i++) {
      listData.add(MyPageListItem(title: titles[i], icon: imagePaths[i]));
      listData.add(TAG_END);
    }

    listData.add(TAG_BLANK);
    listData.add(TAG_START);
    for (int i = 5; i < 7; i++) {
      listData.add(MyPageListItem(title: titles[i], icon: imagePaths[i]));
      listData.add(TAG_END);
    }
    listData.add(TAG_BLANK);
  }

  Widget _getIconImage(path) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
        child: Image.asset(path,
            width: IMAGE_ICON_WIDTH, height: IMAGE_ICON_WIDTH));
  }

  /// * 渲染页面
  _renderRow(BuildContext ctx, int i) {
    if (i == 0) {
      var avatarContainer = Container(
          margin: const EdgeInsets.only(top: 20.0, bottom: 6.0),
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
                    onPressed: () {
                      _openUserInfo(ctx);
                    },
                    child: new Column(children: <Widget>[
                      new Container(
                          child: new CircleAvatar(
                              backgroundImage:
                                  new NetworkImage(UserConfig.headImg),
                              radius: 40.0)),
                      new Container(
                          margin: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 15, bottom: 10.0),
                          child: new Text(UserConfig.nickname,
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black)))
                    ])))
          ]));
      return GestureDetector(
        child: avatarContainer,
      );
    }

    var item = listData[i];
    if (item is String) {
      switch (item) {
        case TAG_START:
        case TAG_END:
          return Divider(height: 1.0);
        case TAG_BLANK:
          return Container(height: 8.0, color: Colors.black12);
      }
    } else if (item is MyPageListItem) {
      var listItemContent = Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: Row(children: <Widget>[
            _getIconImage(item.icon),
            Expanded(child: Text(item.title, style: titleTextStyle)),
            rightArrowIcon
          ]));
      return InkWell(
          onTap: () {
            _handleListItemClick(ctx, item);
          },
          child: listItemContent);
    }
  }

  /// * 处理个人信息点击事件
  void _openUserInfo(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (context) {
      return MyUserInfoPage();
    }));
  }

  /// * 处理列表单项点击事件
  void _handleListItemClick(BuildContext ctx, MyPageListItem item) {
    String title = item.title;
    if (title == "Account") {
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) {
        return MyAccountPage();
      }));
    } else if (title == "Wallet") {
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) {
        return MyWalletPage();
      }));
    } else if (title == "Student") {
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) {
        return MyStudentPage();
      }));
    } else if (title == "Order") {
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) {
        return MyOrderPage();
      }));
    } else if (title == "Agreement") {
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) {
        return MyAgreementPage();
      }));
    } else if (title == "Advice") {
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) {
        return MyAdvicePage();
      }));
    } else if (title == "Complaints") {
      _launchPhone();
    }
  }

  _launchPhone() async {
    const url = 'tel:18311102507';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, i) => _renderRow(context, i),
      ),
    );
  }
}
