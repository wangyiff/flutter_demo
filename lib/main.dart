import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/Constants.dart';
import 'package:flutter_demo/events/ChangeThemeEvent.dart';
import 'package:flutter_demo/config/ThemeConfig.dart';
import 'package:flutter_demo/pages/nice/NicePage.dart';
import 'pages/home/HomeListPage.dart';
import 'pages/my/MyPage.dart';
import 'pages/drawer/MyDrawer.dart';

/// * 1. main 为Dart程序的启动函数, 程序主入口
/// * </br>
/// * 2. main函数使用了(=>)符号, 这是Dart中单行函数或方法的简写,
/// *    等同于: void main() { return runApp(new Partner()); }
/// * </br>
/// * 3. runApp函数接收给定的Widget并使其成为widget树的根,
/// *    不使用该函数, 那么执行的就是一个Dart控制台应用
/// * </br>
void main() => runApp(new PartnerClient());

class PartnerClient extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PartnerClientState();
}

class _PartnerClientState extends State<PartnerClient> {
  final appBarTitles = ['Nice OS', 'Home', 'Mine'];
  final tabTextStyleSelected = TextStyle(color: const Color(0xff63ca6c));
  final tabTextStyleNormal = TextStyle(color: const Color(0xff969696));

  Color themeColor = ThemeConfig.currentColorTheme;
  int _tabIndex = 0;

  var _body;
  var pages;

  Image getTabImage(path) {
    return Image.asset(path, width: 20.0, height: 20.0);
  }

  @override
  void initState() {
    super.initState();
    ThemeConfig.getColorThemeIndex().then((index) {
      if (index != null) {
        ThemeConfig.currentColorTheme = ThemeConfig.supportColors[index];
        Constants.eventBus
            .fire(ChangeThemeEvent(ThemeConfig.supportColors[index]));
      }
    });
    Constants.eventBus.on<ChangeThemeEvent>().listen((event) {
      setState(() {
        themeColor = event.color;
      });
    });
    pages = <Widget>[NicePage(), HomeListPage(), MyPage()];
  }

  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  Text getTabTitle(int curIndex) {
    return Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
  }

  @override
  Widget build(BuildContext context) {
    _body = IndexedStack(children: pages, index: _tabIndex);
    return MaterialApp(
        theme: ThemeData(primaryColor: themeColor),
        home: Scaffold(
            appBar: AppBar(
                title: Text(appBarTitles[_tabIndex],
                    style: TextStyle(color: Colors.white)),
                iconTheme: IconThemeData(color: Colors.white)),
            body: _body,
            bottomNavigationBar: CupertinoTabBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: new Icon(Icons.ac_unit), title: getTabTitle(0)),
                  BottomNavigationBarItem(
                      icon: new Icon(Icons.assignment),
                      title: getTabTitle(1)),
                  BottomNavigationBarItem(
                      icon: new Icon(Icons.perm_identity),
                      title: getTabTitle(2))
                ],
                currentIndex: _tabIndex,
                onTap: (index) {
                  setState(() {
                    _tabIndex = index;
                  });
                }),
            drawer: MyDrawer()));
  }
}
