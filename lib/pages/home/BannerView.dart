import 'package:flutter/material.dart';

import 'HomeDetailPage.dart';
import 'BannerViewIndicator.dart';

class BannerView extends StatefulWidget {
  final List data;
  final BannerViewIndicator bannerViewIndicator;
  final GlobalKey<BannerViewIndicatorState> globalKey;

  BannerView(this.data, this.bannerViewIndicator, this.globalKey);

  @override
  State<StatefulWidget> createState() {
    return BannerViewState();
  }
}

class BannerViewState extends State<BannerView>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List bannerList;

  @override
  void initState() {
    super.initState();
    bannerList = this.widget.data;
    tabController = TabController(
        length: bannerList == null ? 0 : bannerList.length, vsync: this);
    tabController.addListener(() {
      this.widget.globalKey.currentState.setSelectedIndex(tabController.index);
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget generateCard() {
    return Card(
        color: Colors.blue,
        child: Image.asset("images/ic_avatar_default.png",
            width: 20.0, height: 20.0));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    if (bannerList != null && bannerList.length > 0) {
      for (var i = 0; i < bannerList.length; i++) {
        var item = bannerList[i];
        var imgUrl = item['imgUrl'];
        var detailUrl = item['detailUrl'];
        items.add(GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => HomeDetailPage(detailUrl: detailUrl)));
            },
            child: Stack(children: <Widget>[
              Image.network(imgUrl,
                  width: MediaQuery.of(context).size.width, fit: BoxFit.cover)
            ])));
      }
    }
    return TabBarView(controller: tabController, children: items);
  }
}
