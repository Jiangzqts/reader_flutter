import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/services.dart' show rootBundle;

class ArticleDetail extends StatefulWidget {
  @override
  State createState() {
    return new ArticleState();
  }
}

class ArticleState extends State<ArticleDetail> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  Future<String> _getFile() async {
    return await rootBundle.loadString('web/html/bookDetails.html');
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new MAppBar(
          child: new Row(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(left: 16),
            child: new Image.asset(
              "images/res_icon_205.png",
              width: 22,
              height: 22,
            ),
          ),
          new Expanded(
              child: Container(
            alignment: Alignment.centerRight,
            child: new Padding(
              padding: new EdgeInsets.only(right: 16),
              child: new Image.asset(
                'images/res_icon_206.png',
                width: 22,
                height: 22,
              ),
            ),
          ))
        ],
      )),
      body: FutureBuilder<String>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return new WebviewScaffold(
                url: new Uri.dataFromString(snapshot.data,
                        mimeType: 'text/html',
                        encoding: Encoding.getByName('utf-8'))
                    .toString());
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          return Scaffold(
            body: new Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
        future: _getFile(),
      )

//      new WebviewScaffold(url: "https://www.baidu.com")

      ,
    );
  }
  getData() async {
    Dio dio = new Dio();

    BaseOptions options = new BaseOptions();

    FormData formData = new FormData.from({"docId": 'cotpic1088ca70406d42e5bfacf746f498acc6'});
    final responsesss =
    await dio.post("http://devapi.duzhe.com/api/reader/discovery/article/detail", data: formData);
    print("responseJsonsssssssssss===" + responsesss.data.toString());
//    setState(() {
//      flutterWebviewPlugin.evalJavascript("javascript:Dz.refreshHtmlContent(${responsesss.data.toString()})");
//    });
  }
}

class MAppBar extends StatefulWidget implements PreferredSizeWidget {
  MAppBar({@required this.child}) : assert(child != null);
  final Widget child;

  @override
  Size get preferredSize {
    return new Size.fromHeight(56.0);
  }

  @override
  State createState() {
    return new MAppBarState();
  }
}

class MAppBarState extends State<MAppBar> {
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      top: true,
      child: widget.child,
    );
  }
}
