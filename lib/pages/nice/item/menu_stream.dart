import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/nice/const/images_const.dart';
import 'package:flutter_demo/pages/nice/const/page_str_const.dart';
import 'package:flutter_demo/pages/nice/item/Menu.dart';

const _MENU_STRINGS = [
  {'title': "Sign Up", 'items': SIGN_UP_PAGES},
  {'title': "Navigation", 'items': NAVIGATION_PAGES},
  {'title': "Profile", 'items': PROFILE_PAGES},
  {'title': "Feed", 'items': FEED_PAGES},
  {'title': "Chat", 'items': CHAT_PAGES},
  {'title': "Statistics", 'items': STATISTIC_PAGES}
];
const _MENU_COLORS = [
  0xff050505,
  0xffc7d8f4,
  0xff7f5741,
  0xff261d33,
  0xff2a8ccf,
  0xffe19b6b
];
const _MENU_ICONS = [
  Icons.airplanemode_active,
  Icons.location_on,
  Icons.account_box,
  Icons.feedback,
  Icons.chat,
  Icons.all_inclusive
];
const _IMAGE_PATHS = [
  MainImagePath.image_sign_up,
  MainImagePath.image_navigation,
  MainImagePath.image_profile,
  MainImagePath.image_feed,
  MainImagePath.image_chat,
  MainImagePath.image_statistic
];

class MenuController {
  final controller = StreamController<List<Menu>>();

  Stream<List<Menu>> get menuItems => controller.stream;

  MenuController({List<Menu> menus}) {
    controller.add(menus ?? _defaultMenus());
  }

  static String _title(index) {
    return _MENU_STRINGS[index % _MENU_STRINGS.length]['title'];
  }

  static List<String> _items(index) {
    return _MENU_STRINGS[index % _MENU_STRINGS.length]['items'];
  }

  List<Menu> _defaultMenus() {
    var list = List<Menu>();
    for (int i = 0; i < _MENU_STRINGS.length; i++) {
      list.add(Menu(
          title: _title(i),
          icon: _MENU_ICONS[i],
          menuColor: Color(_MENU_COLORS[i]),
          image: _IMAGE_PATHS[i],
          items: _items(i)));
    }
    return list;
  }
}
