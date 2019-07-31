import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'homebean.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomePage> {
  List<Data> _mDate = new List();

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '读者蜂巢',
            style: TextStyle(
                fontSize: 17,
                color: Color(0xff030303),
                fontWeight: FontWeight.normal),
          ),
          leading: new Icon(Icons.calendar_today),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.search),
              tooltip: "搜索",
            )
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            Data data = _mDate[index];
            String type = data.type;
            if (type == "banner") {
              List<Records> records = data.records;

              return Column(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(bottom: 11),
                    height: 211,
                    child: new Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return new Image.network(
                          records[index].cover,
                          fit: BoxFit.cover,
                        );
                      },
                      itemCount: records.length,
                      pagination: new SwiperPagination(),
                      autoplay: true,
                    ),
                  ),
                  new Container(
                    padding: EdgeInsets.only(bottom: 11),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 8, color: Color(0xFFf7f7f7)))),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new Column(
                          children: <Widget>[
                            new Image.asset(
                              'images/res_icon_101.png',
                              width: 30,
                              height: 30,
                            ),
                            new Text(
                              "听书",
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xff333333)),
                            ),
                          ],
                        ),
                        new Column(
                          children: <Widget>[
                            new Image.asset(
                              'images/res_icon_102.png',
                              width: 30,
                              height: 30,
                            ),
                            new Text(
                              "课程",
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xff333333)),
                            ),
                          ],
                        ),
                        new Column(
                          children: <Widget>[
                            new Image.asset(
                              'images/res_icon_103.png',
                              width: 30,
                              height: 30,
                            ),
                            new Text(
                              "专栏",
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xff333333)),
                            ),
                          ],
                        ),
                        new Column(
                          children: <Widget>[
                            new Image.asset(
                              'images/res_icon_104.png',
                              width: 30,
                              height: 30,
                            ),
                            new Text(
                              "杂志",
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xff333333)),
                            ),
                          ],
                        ),
                        new Column(
                          children: <Widget>[
                            new Image.asset(
                              'images/res_icon_105.png',
                              width: 30,
                              height: 30,
                            ),
                            new Text(
                              "读书会",
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xff333333)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              );
            } else if (type == "freeZone") {
              return new Container(
                margin: EdgeInsets.only(top: 20, left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      "免费专区",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff333333),
                          fontSize: 22),
                    ),

//                    //早安夜听
                    new ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, indexs) {
                        List<Recordss> locals =
                            _mDate[index].records[0].recordss;
                        if (indexs == 0) {
                          return new Column(
                            children: <Widget>[
                              new Container(
                                margin: EdgeInsets.only(top: 12),
                                child: new Row(
                                  children: <Widget>[
                                    new Text(
                                      _mDate[index].records[0].title,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff333333),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    new Expanded(
                                      child: new Container(
                                        alignment: Alignment.centerRight,
                                        child: new Text("查看全部",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff999999),
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              new Container(
                                margin: EdgeInsets.only(top: 8),
                                child: new Row(
                                  children: <Widget>[
                                    new Image.asset(
                                      "images/res_icon_228.png",
                                      width: 22,
                                      height: 22,
                                    ),
                                    new Expanded(
                                        child: new Container(
                                      margin: EdgeInsets.only(left: 4),
                                      child: new Text(
                                        locals[indexs].title,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff666666)),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else {
                          return new Container(
                            margin: EdgeInsets.only(top: 8),
                            child: new Row(
                              children: <Widget>[
                                new Image.asset(
                                  "images/res_icon_228.png",
                                  width: 22,
                                  height: 22,
                                ),
                                new Expanded(
                                    child: new Container(
                                  margin: EdgeInsets.only(left: 4),
                                  child: new Text(
                                    locals[indexs].title,
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xff666666)),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                )),
                              ],
                            ),
                          );
                        }
                      },
                      itemCount: _mDate[index].records[0].recordss.length,
                    ),
                    //主编问答
                    new ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, indexs) {
                        List<Recordss> locals =
                            _mDate[index].records[1].recordss;
                        if (indexs == 0) {
                          return new Column(
                            children: <Widget>[
                              new Container(
                                margin: EdgeInsets.only(top: 12),
                                child: new Row(
                                  children: <Widget>[
                                    new Text(
                                      _mDate[index].records[1].title,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff333333),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    new Expanded(
                                      child: new Container(
                                        alignment: Alignment.centerRight,
                                        child: new Text("查看全部",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff999999),
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              new Container(
                                margin: EdgeInsets.only(top: 8),
                                child: new Row(
                                  children: <Widget>[
                                    new Image.asset(
                                      "images/res_icon_228.png",
                                      width: 22,
                                      height: 22,
                                    ),
                                    new Expanded(
                                        child: new Container(
                                      margin: EdgeInsets.only(left: 4),
                                      child: new Text(
                                        locals[indexs].title,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff666666)),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else {
                          return new Container(
                            margin: EdgeInsets.only(top: 8),
                            child: new Row(
                              children: <Widget>[
                                new Image.asset(
                                  "images/res_icon_228.png",
                                  width: 22,
                                  height: 22,
                                ),
                                new Expanded(
                                    child: new Container(
                                  margin: EdgeInsets.only(left: 4),
                                  child: new Text(
                                    locals[indexs].title,
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xff666666)),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                )),
                              ],
                            ),
                          );
                        }
                      },
                      itemCount: _mDate[index].records[1].recordss.length,
                    ),
                  ],
                ),
              );

              return new Text("免费专区");
            } else if (type == "listenbook") {
              Data locals = _mDate[index];
              return new Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 8, color: Color(0xFFf7f7f7)))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Text(
                          locals.title,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff333333)),
                        ),
                        new Expanded(
                            child: new Container(
                          alignment: Alignment.centerRight,
                          child: new Text("查看全部",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff999999),
                              )),
                        ))
                      ],
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 12),
                      height: 202,
                      child: new ListView.builder(
                        itemCount: locals.records.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, listenindex) {
                          return Container(
                            margin: EdgeInsets.only(right: 20),
                            child: new Column(
                              children: <Widget>[
                                new Container(
                                  width: 90,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0x00000000)),
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          locals.records[listenindex].cover,
                                        ),
                                        fit: BoxFit.cover,
                                      )),
                                  margin: EdgeInsets.only(bottom: 4),
//                                  child: Stack(
//                                    children: <Widget>[
//                                      new Image.network(
//                                        locals.records[listenindex].cover,
//
//                                      ),
////                                    new Text("新上")
//                                    ],
//                                  ),
                                ),
                                new Center(
                                  child: new Container(
                                    width: 90,
                                    height: 50,
                                    child: new Text(
                                      locals.records[listenindex].title,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff333333),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                new Container(
                                  alignment: Alignment.bottomCenter,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(24.0)),
                                      color: Color(0xffF07D33)),
                                  width: 90,
                                  height: 28,
                                  child: new Center(
                                      child: new Container(
                                    child: new Text(
                                        "¥ " +
                                            locals.records[listenindex].price,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xffffffff),
                                        )),
                                  )),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );

              return new Text("听书推荐");
            } else if (type == "interview") {
              return new Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 8, color: Color(0xFFf7f7f7)))),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Text(data.title,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff333333),
                            )),
                        new Expanded(
                          child: new Container(
                              alignment: Alignment.centerRight,
                              child: new Text("查看全部",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff999999),
                                  ))),
                        )
                      ],
                    ),
                    new ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, interview) {
                        return new Container(
                          margin: EdgeInsets.only(top: 12),
                          child: new Row(
                            children: <Widget>[
                              new Container(
                                width: 90,
                                height: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        data.records[interview].cover,
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              new Expanded(
                                  child: new Container(
                                height: 120,
                                margin: EdgeInsets.only(left: 12),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text(data.records[interview].title,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff333333),
                                        )),
                                    new Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: new Text(
                                          data.records[interview].introduction,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff666666),
                                          )),
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        );
                      },
                      itemCount: data.records.length,
                    )
                  ],
                ),
              );

              return new Text("读者访谈");
            } else if (type == "special") {
              return new Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 8, color: Color(0xFFf7f7f7)))),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Text(data.title,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff333333),
                            )),
                        new Expanded(
                          child: new Container(
                              alignment: Alignment.centerRight,
                              child: new Text("查看全部",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff999999),
                                  ))),
                        )
                      ],
                    ),
                    new ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, special) {
                        return new Container(
                          child: new Row(
                            children: <Widget>[
                              new Container(
                                width: 90,
                                height: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        data.records[special].cover,
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              new Expanded(
                                  child: new Container(
                                margin: EdgeInsets.only(left: 12),
                                height: 120,
                                child: new Column(
                                  children: <Widget>[
                                    new Text(
                                      data.records[special].title,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff333333),
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    new Container(
                                      margin: EdgeInsets.only(top: 4),
                                      child: new Text(
                                          data.records[special].introduction,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff666666),
                                          )),
                                    ),
                                    new Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: new Row(
                                        children: <Widget>[
                                          new Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                color: Color(0xf7f7f7)),
                                            width: 40,
                                            height: 20,
                                            child: new Center(
                                              child: new Text("最新",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xff999999),
                                                  )),
                                            ),
                                          ),
                                          new Container(
                                            margin: EdgeInsets.only(left: 8),
                                            child: new Text(
                                                data.records[special]
                                                    .latestTitle,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff999999),
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                    new Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: new Row(
                                        children: <Widget>[
                                          new Text(
                                              data.records[special].buyCntNm,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff999999),
                                              )),
                                          new Expanded(
                                              child: new Container(
                                            alignment: Alignment.centerRight,
                                            child: new Text(
                                                data.records[special]
                                                    .priceString,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xfff07D33),
                                                )),
                                          ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        );
                      },
                      itemCount: data.records.length,
                    )
                  ],
                ),
              );
              return new Text("名家专栏");
            } else if (type == "course") {
              return new Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 8, color: Color(0xFFf7f7f7)))),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Text(data.title,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff333333),
                            )),
                        new Expanded(
                          child: new Container(
                              alignment: Alignment.centerRight,
                              child: new Text("查看全部",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff999999),
                                  ))),
                        )
                      ],
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 12),
                      child: new GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 0.82,
                            crossAxisCount: 2),
                        itemBuilder: (context, courese) {
                          return new Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Color(0xffEBEBEB)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Container(
                                  height: 93,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          data.records[courese].cover,
                                        ),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                new Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: new Text(
                                    data.records[courese].title,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff333333),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                new Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: new Row(
                                    children: <Widget>[
                                      new Text(data.records[courese].author,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff666666),
                                          )),
                                      new Text("|",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff666666),
                                          )),
                                      new Text(
                                          "${data.records[courese].total}课时",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff666666),
                                          )),
                                    ],
                                  ),
                                ),
                                new Container(
                                  child: new Row(
                                    children: <Widget>[
                                      new Text(data.records[courese].buyCntNm,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff999999),
                                          )),
                                      new Text(
                                          "¥${data.records[courese].price}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xffF07D33),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: data.records.length,
                      ),
                    )
                  ],
                ),
              );

              return new Text("优选课程");
            } else if (type == "classify") {
              return new Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 8, color: Color(0xFFf7f7f7)))),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Text(data.title,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff333333),
                            )),
                        new Expanded(
                          child: new Container(
                              alignment: Alignment.centerRight,
                              child: new Text("查看全部",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff999999),
                                  ))),
                        )
                      ],
                    ),
                    new GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 9.0,
                          mainAxisSpacing: 4.0,
                          childAspectRatio: 1.9,
                          crossAxisCount: 3),
                      itemBuilder: (context, classify) {
                        return new Container(
                            margin: EdgeInsets.only(top: 12),
                            height: 10,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: ExactAssetImage(
                                        'images/res_icon_catagory_bg.png'),
                                    fit: BoxFit.fill)),
                            child: new Center(
                              child: Text(data.records[classify].name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xffffffff),
                                  )),
                            ));
                      },
                      itemCount: data.records.length,
                    )
                  ],
                ),
              );

              return new Text("热门分类");
            } else if (type == "booklist") {
              if (data.records.length == 0) {
                return new Text("");
              }
              return new Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 8, color: Color(0xFFf7f7f7)))),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Text(data.title,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff333333),
                            )),
                        new Expanded(
                          child: new Container(
                              alignment: Alignment.centerRight,
                              child: new Text("查看全部",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff999999),
                                  ))),
                        )
                      ],
                    ),
                    new ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, ming) {
                        return new Container(
                          child: new Row(
                            children: <Widget>[
                              new Container(
                                margin: EdgeInsets.only(top: 12),
                                width: 105,
                                height: 105,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        data.records[ming].cover,
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              new Expanded(
                                  child: new Container(
                                margin: EdgeInsets.only(left: 12),
                                height: 105,
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text(data.records[ming].title,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff333333),
                                        )),
                                    new Text(
                                      data.records[ming].introduction,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff666666),
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    new Expanded(
                                        child: new Container(
                                      alignment: Alignment.bottomLeft,
                                      child: new Row(
                                        children: <Widget>[
                                          new Text(data.records[ming].totalNm,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff999999),
                                              )),
                                          new Container(
                                            margin: EdgeInsets.only(left: 12),
                                            child: new Text(
                                                data.records[ming].browseCntNm,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff999999),
                                                )),
                                          )
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                              )),
                            ],
                          ),
                        );
                      },
                      itemCount: data.records.length,
                    )
                  ],
                ),
              );

              return new Text("精选书单");
            } else if (type == "editorChoise") {
              if (data?.records?.length == 0) {
                return new Text("");
              }
              return new Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 8, color: Color(0xFFf7f7f7)))),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Text(data.title,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff333333),
                            )),
                        new Expanded(
                          child: new Container(
                              alignment: Alignment.centerRight,
                              child: new Text("查看全部",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff999999),
                                  ))),
                        )
                      ],
                    ),
                    new ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, ming) {
                        return new Container(
                          child: new Row(
                            children: <Widget>[
                              new Container(
                                margin: EdgeInsets.only(top: 12),
                                width: 90,
                                height: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        data.records[ming].cover,
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              new Expanded(
                                child: new Container(
                                  height: 120,
                                  margin: EdgeInsets.only(left: 12),
                                  child: new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Text(data.records[ming].title,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff333333),
                                          )),
//                                  new Text(data.records[ming]?.introduction),
                                      new Container(
                                        margin: EdgeInsets.only(top: 4),
                                        child: new Row(
                                          children: <Widget>[
//                                          new Text("最新"),
                                            new Expanded(
                                              child: new Text(
                                                  data.records[ming]
                                                      .latestTitle,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff666666),
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                      new Expanded(
                                          child: new Container(alignment: Alignment.bottomLeft,
                                        child: new Row(
                                          children: <Widget>[
                                            new Text(
                                                data.records[ming].buyCntNm,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff999999),
                                                )),
                                            new Text(data.records[ming].price,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xffF07D33),
                                                )),
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: data.records.length,
                    )
                  ],
                ),
              );

              return new Text("主编推荐");
            } else if (type == "activity") {
              if (data.records.length == 0) {
                return new Text("");
              }
              return new Container(
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Text(data.title),
                        new Text("查看全部")
                      ],
                    ),
                    new ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, activity) {
                        return new Container(
                          child: Column(
                            children: <Widget>[
                              Image.network(data.records[activity].cover),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    new Text(data.records[activity].title),
                                    new Text(
                                        data.records[activity].introduction),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: data.records.length,
                    )
                  ],
                ),
              );

              return new Text("专题活动");
            }
          },
          itemCount: _mDate.length,
        ));
  }

  getData() async {
    Dio dio = new Dio();

    BaseOptions options = new BaseOptions();

    FormData formData = new FormData.from({"current": '1', 'size': '50'});
    final responsesss =
        await dio.post("http://api.duzhe.com/api/reader/index", data: formData);
    print("responseJsonsssssssssss===" + responsesss.toString());
    homebean dat = homebean.fromJson(responsesss.data);
    _mDate.addAll(dat.data);
    print("解析成功之后的个数${_mDate.length}" + _mDate.toString());
//
    setState(() {});
  }
}
