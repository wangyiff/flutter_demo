import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/pages/nice/page/empty_page.dart';
import 'package:flutter_demo/pages/nice/page/feed/FeedPageEleven.dart';
import 'package:flutter_demo/pages/nice/page/feed/FeedPageFour.dart';
import 'package:flutter_demo/pages/nice/page/feed/FeedPageOne.dart';
import 'package:flutter_demo/pages/nice/page/feed/FeedPageTen.dart';
import 'package:flutter_demo/pages/nice/page/feed/FeedPageThirteen.dart';
import 'package:flutter_demo/pages/nice/page/feed/FeedPageTwelve.dart';
import 'package:flutter_demo/pages/nice/page/feed/FeedPageTwo.dart';
import 'package:flutter_demo/pages/nice/page/feed/feed_five_page.dart';
import 'package:flutter_demo/pages/nice/page/feed/feed_three_page.dart';
import 'package:flutter_demo/pages/nice/page/nice_home_page.dart';
import 'package:flutter_demo/pages/nice/page/navigation/navigation1/coordinator.dart';
import 'package:flutter_demo/pages/nice/page/profile/ProfilePageOne.dart';
import 'package:flutter_demo/pages/nice/page/profile/ProfilePageTwo.dart';
import 'package:flutter_demo/pages/nice/page/signup/SignPageEight.dart';
import 'package:flutter_demo/pages/nice/page/signup/SignPageEleven.dart';
import 'package:flutter_demo/pages/nice/page/signup/SignPageFive.dart';
import 'package:flutter_demo/pages/nice/page/signup/SignPageFour.dart';
import 'package:flutter_demo/pages/nice/page/signup/SignPageNine.dart';
import 'package:flutter_demo/pages/nice/page/signup/SignPageOne.dart';
import 'package:flutter_demo/pages/nice/page/signup/SignPageSeven.dart';
import 'package:flutter_demo/pages/nice/page/signup/SignPageSix.dart';
import 'package:flutter_demo/pages/nice/page/signup/SignPageThree.dart';
import 'package:flutter_demo/pages/nice/page/signup/SignPageTwo.dart';
import 'package:flutter_demo/pages/nice/page/signup/SingPageTen.dart';

import 'const/color_const.dart';
import 'const/page_str_const.dart';
import 'const/string_const.dart';

class NicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
        title: StringConst.APP_NAME,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: BLUE_DEEP,
            accentColor: YELLOW,
            fontFamily: "Montserrat"),
        home: NiceHomePage(),
        routes: {
          //PROFILE pages
          SIGN_UP_PAGES[0]: (context) => SignPageOne(),
          SIGN_UP_PAGES[1]: (context) => SignPageTwo(),
          SIGN_UP_PAGES[2]: (context) => SignPageThree(),
          SIGN_UP_PAGES[3]: (context) => SignPageFour(),
          SIGN_UP_PAGES[4]: (context) => SignPageFive(),
          SIGN_UP_PAGES[5]: (context) => SignPageSix(),
          SIGN_UP_PAGES[6]: (context) => SignPageSeven(),
          SIGN_UP_PAGES[7]: (context) => SignPageEight(),
          SIGN_UP_PAGES[8]: (context) => SignPageNine(),
          SIGN_UP_PAGES[9]: (context) => SignPageTeen(),
          SIGN_UP_PAGES[10]: (context) => SignPageEleven(),

          NAVIGATION_PAGES[0]: (context) => NavigationOneCoordinator(),

          PROFILE_PAGES[0]: (context) => ProfilePageOne(),
          PROFILE_PAGES[1]: (context) => ProfilePageTwo(),

          FEED_PAGES[0]: (context) => FeedPageOne(),
          FEED_PAGES[1]: (context) => FeedPageTwo(),
          FEED_PAGES[2]: (context) => FeedThreePage(),
          FEED_PAGES[3]: (context) => FeedPageFour(),
          FEED_PAGES[4]: (context) => FeedFivePage(),
          FEED_PAGES[9]: (context) => FeedPageTen(),
          FEED_PAGES[10]: (context) => FeedPageEleven(),
          FEED_PAGES[11]: (context) => FeedPageTwelve(),
          FEED_PAGES[12]: (context) => FeedPageThirteen()
        },
        onUnknownRoute: (setting) =>
            MaterialPageRoute(builder: (context) => EmptyPage()));
  }
}
