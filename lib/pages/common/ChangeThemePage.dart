import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/Constants.dart';
import 'package:flutter_demo/events/ChangeThemeEvent.dart';
import 'package:flutter_demo/config/ThemeConfig.dart';

/// * 切换主题
class ChangeThemePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChangeThemePageState();
}

class ChangeThemePageState extends State<ChangeThemePage> {
  List<Color> colors = ThemeConfig.supportColors;

  changeColorTheme(Color c) {
    Constants.eventBus.fire(ChangeThemeEvent(c));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('切换主题', style: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Padding(
            padding: const EdgeInsets.all(4.0),
            child: GridView.count(
                crossAxisCount: 4,
                children: List.generate(colors.length, (index) {
                  return InkWell(
                      onTap: () {
                        ThemeConfig.currentColorTheme = colors[index];
                        ThemeConfig.setColorTheme(index);
                        changeColorTheme(colors[index]);
                      },
                      child: Container(
                        color: colors[index],
                        margin: const EdgeInsets.all(3.0),
                      ));
                }))));
  }
}
