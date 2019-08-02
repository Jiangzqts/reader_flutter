import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class MePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<MePage> with AutomaticKeepAliveClientMixin{
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: new Container(
          child: new Stack(
            children: <Widget>[
              new Image.asset("images/my_bg.png"),
              new Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 60),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new GestureDetector(child:new Container(
                          margin: EdgeInsets.only(right: 10),
                          child: new CircleAvatar(
                            backgroundImage: new NetworkImage(
                                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564140579347&di=8b1a983127c7ce44b9e9c395da55e991&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20130416%2FImg372885486.jpg"),
                          ),
                          width: 60,
                          height: 60,
                        ),onTap: (){
                             getImage();
                             print("答应");
                        } ),

                        new Text(
                          "强强打太极",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        new Expanded(
                            child: new Container(
                          child: new Image.asset(
                            "images/res_icon_213.png",
                            width: 20,
                            height: 20,
                          ),
                          alignment: Alignment.centerRight,
                        )),
                      ],
                    ),
                    new Container(
                      decoration: new BoxDecoration(
                          border: new Border.all(
                              color: Color(0x093f504b), width: 2),
                          color: Colors.white,
                          borderRadius: new BorderRadius.circular(5)),
                      height: 98,
                      margin: EdgeInsets.only(top: 33),
                      child: Row(
                        children: <Widget>[
                          new Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Image.asset("images/res_icon_130.png",
                                      width: 20, height: 20),
                                  new Container(
                                    child: new Text(
                                      "喜欢",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff666666)),
                                    ),
                                    margin: EdgeInsets.only(top: 5),
                                  )
                                ],
                              ),
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Image.asset("images/res_icon_131.png",
                                      width: 20, height: 20),
                                  new Container(
                                    child: new Text(
                                      "下载",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff666666)),
                                    ),
                                    margin: EdgeInsets.only(top: 5),
                                  )
                                ],
                              ),
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Image.asset("images/res_icon_132.png",
                                      width: 20, height: 20),
                                  new Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: new Text(
                                      "投稿",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff666666)),
                                    ),
                                  )
                                ],
                              ),
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Image.asset("images/res_icon_133.png",
                                      width: 20, height: 20),
                                  new Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: new Text(
                                      "钱包",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff666666)),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                    new Container(
                        alignment: Alignment.centerLeft,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              height: 50,
                              child: new Row(
                                children: <Widget>[
                                  new Image.asset(
                                    "images/res_icon_246.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  new Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: new Text(
                                      "我的消息",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff666666)),
                                    ),
                                  ),
                                  new Expanded(
                                      child: new Container(
                                    child: new Image.asset(
                                      "images/res_icon_311.png",
                                      width: 20,
                                      height: 20,
                                    ),
                                    alignment: Alignment.centerRight,
                                  )),
                                ],
                              ),
                            ),
                            new Container(
                              height: 50,
                              child: new Row(
                                children: <Widget>[
                                  new Image.asset(
                                    "images/res_icon_246.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  new Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: new Text(
                                      "浏览历史",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff666666)),
                                    ),
                                  ),
                                  new Expanded(
                                      child: new Container(
                                    child: new Image.asset(
                                      "images/res_icon_311.png",
                                      width: 20,
                                      height: 20,
                                    ),
                                    alignment: Alignment.centerRight,
                                  )),
                                ],
                              ),
                            ),
                            new Container(
                              height: 50,
                              child: new Row(
                                children: <Widget>[
                                  new Image.asset(
                                    "images/res_icon_246.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  new Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: new Text(
                                      "管理兴趣标签",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff666666)),
                                    ),
                                  ),
                                  new Expanded(
                                      child: new Container(
                                    child: new Image.asset(
                                      "images/res_icon_311.png",
                                      width: 20,
                                      height: 20,
                                    ),
                                    alignment: Alignment.centerRight,
                                  )),
                                ],
                              ),
                            ),
                            new Container(
                              height: 50,
                              child: new Row(
                                children: <Widget>[
                                  new Image.asset(
                                    "images/res_icon_246.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  new Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: new Text(
                                      "优惠专区",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff666666)),
                                    ),
                                  ),
                                  new Expanded(
                                      child: new Container(
                                    child: new Image.asset(
                                      "images/res_icon_311.png",
                                      width: 20,
                                      height: 20,
                                    ),
                                    alignment: Alignment.centerRight,
                                  )),
                                ],
                              ),
                            ),
                            new Container(
                              height: 50,
                              child: new Row(
                                children: <Widget>[
                                  new Image.asset(
                                    "images/res_icon_246.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  new Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: new Text(
                                      "兑换中心",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff666666)),
                                    ),
                                  ),
                                  new Expanded(
                                      child: new Container(
                                    child: new Image.asset(
                                      "images/res_icon_311.png",
                                      width: 20,
                                      height: 20,
                                    ),
                                    alignment: Alignment.centerRight,
                                  )),
                                ],
                              ),
                            ),
                            new Container(
                              height: 50,
                              child: new Row(
                                children: <Widget>[
                                  new Image.asset(
                                    "images/res_icon_246.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  new Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: new Text(
                                      "意见反馈",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff666666)),
                                    ),
                                  ),
                                  new Expanded(
                                      child: new Container(
                                    child: new Image.asset(
                                      "images/res_icon_311.png",
                                      width: 20,
                                      height: 20,
                                    ),
                                    alignment: Alignment.centerRight,
                                  )),
                                ],
                              ),
                            ),
                            new Container(
                              height: 50,
                              child: new Row(
                                children: <Widget>[
                                  new Image.asset(
                                    "images/res_icon_246.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  new Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: new Text(
                                      "设置",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff666666)),
                                    ),
                                  ),
                                  new Expanded(
                                      child: new Container(
                                    child: new Image.asset(
                                      "images/res_icon_311.png",
                                      width: 20,
                                      height: 20,
                                    ),
                                    alignment: Alignment.centerRight,
                                  )),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
