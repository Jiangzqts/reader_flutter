import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HavaBugPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HavaBugPage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  int _currentIndex = 0; //选中下标

  @override
  void initState() {
    //初始化controller并添加监听
    controller = TabController(length: 4, vsync: this);
    controller.addListener(() => _onTabChanged());

    super.initState();
  }

  ///
  /// tab改变监听
  ///
  _onTabChanged() {
    if (controller.indexIsChanging) {
      if (this.mounted) {
        //赋值 并更新数据
        this.setState(() {
          _currentIndex = controller.index;
        });

//        getData();
      }
    }
  }

  getData() async {
    Dio dio = new Dio();

    BaseOptions options = new BaseOptions();

    FormData formData =
        new FormData.from({"lastDocId": "", "current": '1', 'size': '10'});
    final responsesss = await dio.post(
        "http://www.mocky.io/v2/5d3a6e812f000075b26ec079",
        data: formData);
    print("responseJson===" + responsesss.toString());
//    entity dat = entity.fromJson(responsesss.data);
//    _mDate.addAll(dat.data.articles.records);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 4,
        child: new Scaffold(
            appBar: new AppBar(
              centerTitle: true,
              title: new Text(
                "已购",
                style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
              bottom: new TabBar(
                indicatorColor: Color(0xff1FAF88),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Color(0xff1FAF88),
                unselectedLabelColor: Color(0xff000000),
                tabs: <Widget>[
                  new Tab(
                    child: new Text("听书"),
                  ),
                  new Tab(
                    child: new Text("课程"),
                  ),
                  new Tab(
                    child: new Text("专栏"),
                  ),
                  new Tab(
                    child: new Text("杂志"),
                  ),
                ],
//                controller: _tabController,
              ),
            ),
            body: new TabBarView(
//              controller: controller,

              children: <Widget>[
                getWidge(),
                getWidge(),
                getWidge(),
                getWidge(),
              ],
            )

        ));
  }
  Widget getWidge(){
    return new ListView(
      children: <Widget>[
        new ListTile(
          leading: new Icon(Icons.map),
          title: new Text('Maps'),
        ),
        new ListTile(
          leading: new Icon(Icons.photo_album),
          title: new Text('Album'),
        ),
        new ListTile(
          leading: new Icon(Icons.phone),
          title: new Text('Phone'),
        ),
      ],
    );
  }


}
