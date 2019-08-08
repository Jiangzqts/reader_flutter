import 'package:flutter/material.dart';
import 'ArticleDetail.dart';
import 'entity.dart';
import 'package:dio/dio.dart';

class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<FindPage>
    with AutomaticKeepAliveClientMixin {
  ScrollController _controller;

  @override
  void initState() {
    getData();

    _controller = new ScrollController();
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixel = _controller.position.pixels;

      if (maxScroll == pixel) {
        getData();
      }
    });
    super.initState();
  }

  List<Records> _mDate = new List();

  Future _pullToRefresh() async {
    getData();
    return null;
  }

  @override
  bool get wantKeepAlive {
    return true;
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
    entity dat = entity.fromJson(responsesss.data);
    _mDate.addAll(dat.data.articles.records);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("发现",
            style: new TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Color(0xff333333))),
        centerTitle: true,
      ),
      body: _mDate.length == 0
          ? new Center(child: new CircularProgressIndicator())
          : new RefreshIndicator(
              child: new ListView.builder(
                cacheExtent: 3,
                controller: _controller,
                itemBuilder: (contex, index) {
                  return new GestureDetector(
                    child: new Container(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                      child: new Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new Column(
                                  children: <Widget>[
                                    new Container(
                                      width: 239,
                                      child: new Text(
                                        _mDate[index].title,
                                        style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    new Container(
                                      padding: EdgeInsets.only(top: 8),
                                      width: 239,
                                      child: new Text(
                                        _mDate[index].introduction,
                                        style: TextStyle(
                                            color: Color(0xff666666),
                                            fontSize: 14),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              new Container(
                                width: 105,
                                height: 105,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(_mDate[index].cover),
                                        fit: BoxFit.cover)),
                              )
                            ],
                          ),
                          new Container(
                            padding: EdgeInsets.only(top: 8),
                            child: new Row(
                              children: <Widget>[
                                //底部
                                new Image.asset(
                                  'images/res_icon_307.png',
                                  width: 16,
                                  height: 16,
                                ),
                                new Text(_mDate[index].browseCntNm,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff999999))),
                                new Container(
                                  padding: EdgeInsets.only(left: 64),
                                  child: new Row(
                                    children: <Widget>[
                                      new Image.asset(
                                        'images/res_icon_306.png',
                                        width: 16,
                                        height: 16,
                                      ),
                                      new Text(
                                        _mDate[index].likeCnt.toString(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff999999)),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          new Container(
                            padding: EdgeInsets.only(top: 20),
                            child: new Divider(),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {

                      Navigator.push(context, new MaterialPageRoute(builder: (context)=>new ArticleDetail(docId:_mDate[index].docId)));
                    },
                  );
                },
                itemCount: _mDate.length,
              ),
              onRefresh: _pullToRefresh),
    );
  }
}
