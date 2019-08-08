import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'learndart/FindPage.dart';
import 'learndart/HavaBugPage.dart';
import 'learndart/HomePage.dart';
import 'learndart/JiKeFlutter.dart';
import 'learndart/MePage.dart';
import 'learndart/test.dart';

import 'package:flutter/services.dart';

void main() {
  runApp(new MyApp());
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor:Colors.white,statusBarIconBrightness: Brightness.dark);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
//          backgroundColor: Color(0xffffffff)
      ),
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandowmWordsState();
  }
}

class RandowmWordsState extends State<RandomWords>
    with SingleTickerProviderStateMixin {
  var tabImages;

  int _tabIndex = 0;

  var   _pageList;

  var appBarTitles = ['首页', '发现', '已购', '我的'];
  var _controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    // TODO: implement initState
    initDate();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          children: <Widget>[
            new HomePage(),
            new FindPage(),
            new HavaBugPage(),
            new MePage(),
//            new MyApps(),
          ],
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
        ),
//        _pageList[_tabIndex],
        bottomNavigationBar: new BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
            BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
            BottomNavigationBarItem(icon: getTabIcon(2), title: getTabTitle(2)),
            BottomNavigationBarItem(icon: getTabIcon(3), title: getTabTitle(3)),
          ],
          currentIndex: _tabIndex,
          iconSize: 22,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _tabIndex = index;
            });
          },
        ));
  }

  void initDate() {
    /*
     * 初始化选中和未选中的icon
     */
    tabImages = [
      [
        getTabImage('images/res_icon_236.png'),
        getTabImage('images/res_icon_201.png')
      ],
      [
        getTabImage('images/res_icon_202.png'),
        getTabImage('images/res_icon_237.png')
      ],
      [
        getTabImage('images/res_icon_203.png'),
        getTabImage('images/res_icon_238.png')
      ],
      [
        getTabImage('images/res_icon_204.png'),
        getTabImage('images/res_icon_239.png')
      ]
    ];

    _pageList = [
      new HomePage(),
      new FindPage(),
      new HavaBugPage(),
      new MePage(),
//      new JiKeFlutter(),
    ];
  }

  /*
   * 根据image路径获取图片
   */
  Image getTabImage(path) {
    return new Image.asset(path, width: 22.0, height: 22.0);
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 11, color: const Color(0xFF1FAF88)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 11, color: const Color(0xFFCCCCCC)));
    }
  }
}
