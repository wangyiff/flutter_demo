import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'BannerView.dart';
import 'HomeDetailPage.dart';
import 'BannerViewIndicator.dart';

final bannerViewIndicatorStateKey = GlobalKey<BannerViewIndicatorState>();

class HomeListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeListPageState();
}

class _HomeListPageState extends State<HomeListPage> {
  final TextStyle titleTextStyle = TextStyle(fontSize: 18.0);
  final TextStyle subtitleStyle = TextStyle(fontSize: 15.0);

  var productList;
  var bannerList;
  BannerView bannerView;
  BannerViewIndicator bannerViewIndicator;

  @override
  void initState() {
    super.initState();
    getHomeDataList();
  }

  Future<Null> _pullToRefresh() async {
    getHomeDataList();
  }

  @override
  Widget build(BuildContext context) {
    // 无数据时，显示Loading
    if (productList == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      Widget listView = ListView.builder(
          itemCount: productList.length * 2,
          itemBuilder: (context, i) => renderRow(i));
      return RefreshIndicator(child: listView, onRefresh: _pullToRefresh);
    }
  }

  getHomeDataList() {
    Future<String> loadString =
        DefaultAssetBundle.of(context).loadString("file/home_data.json");
    loadString.then((String val) {
      Map<String, dynamic> map = json.decode(val);
      var _productList = map['product'];
      var _bannerList = map['banner'];
      setState(() {
        productList = _productList;
        bannerList = _bannerList;
        initBanner();
      });
    });
  }

  void initBanner() {
    bannerViewIndicator = BannerViewIndicator(bannerList.length,
        key: bannerViewIndicatorStateKey);
    bannerView = BannerView(
        bannerList, bannerViewIndicator, bannerViewIndicatorStateKey);
  }

  Widget renderRow(i) {
    if (i == 0) {
      return Container(
          height: 180.0,
          child: Stack(children: <Widget>[
            bannerView,
            Container(
                alignment: Alignment.bottomCenter, child: bannerViewIndicator)
          ]));
    }
    i -= 1;
    if (i.isOdd) {
      return Divider(height: 1.0);
    }
    i = i ~/ 2;
    var itemData = productList[i];
    var titleRow = Row(children: <Widget>[
      Expanded(child: Text(itemData['title'], style: titleTextStyle))
    ]);
    var timeRow = Row(children: <Widget>[
      Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: Text(itemData['money'], style: subtitleStyle))
    ]);
    var thumbImgUrl = itemData['thumb'];
    var thumbImg = Container(
        margin: const EdgeInsets.all(10.0),
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFECECEC),
            image: DecorationImage(
                image: ExactAssetImage('./images/ic_img_default.jpg'),
                fit: BoxFit.cover),
            border: Border.all(color: const Color(0xFFECECEC), width: 2.0)));

    if (thumbImgUrl != null && thumbImgUrl.length > 0) {
      thumbImg = Container(
          margin: const EdgeInsets.all(10.0),
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFECECEC),
              image: DecorationImage(
                  image: NetworkImage(thumbImgUrl), fit: BoxFit.cover)));
    }

    var row = Row(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          width: 100.0,
          height: 80.0,
          child: Center(
            child: thumbImg,
          ),
        ),
      ),
      Expanded(
          flex: 1,
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: <Widget>[
                titleRow,
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                  child: timeRow,
                )
              ])))
    ]);

    return InkWell(
        child: row,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) =>
                  HomeDetailPage(detailUrl: itemData['detailUrl'])));
        });
  }
}
