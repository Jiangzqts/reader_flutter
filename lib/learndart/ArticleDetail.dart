import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

import 'articlebean.dart';

class ArticleDetail extends StatefulWidget {
  String docId;

  @override
  State createState() {
    return new ArticleState(docId: docId);
  }

  ArticleDetail({Key key, @required this.docId});
}

class ArticleState extends State<ArticleDetail> {
  String docId;

  ArticleState({Key key, @required this.docId});

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
//      body: FutureBuilder<String>(
//        builder: (context, snapshot) {
//          if (snapshot.hasData) {
//            return new WebviewScaffold(
//              withZoom: true,
//              url: new Uri.dataFromString(snapshot.data,
//                      mimeType: 'text/html',
//                      encoding: Encoding.getByName('utf-8'))
//                  .toString(),
//              withLocalStorage: true,
//            );
//          } else if (snapshot.hasError) {
//            return Scaffold(
//              body: Center(
//                child: Text("${snapshot.error}"),
//              ),
//            );
//          }
//          return Scaffold(
//            body: new Center(
//              child: CircularProgressIndicator(),
//            ),
//          );
//        },
//        future: _getFile(),
//      )

//      new WebviewScaffold(url: "https://www.baidu.com")
    );
  }

  getData() async {
    Dio dio = new Dio();

    BaseOptions options = new BaseOptions();
//    options.contentType=ContentType.json;
    dio.options = options;
    print("docId===" + docId);
    FormData formData = new FormData.from({"docId": docId});
    final responsesss = await dio.post(
        "http://devapi.duzhe.com/api/reader/discovery/article/detail",
        data: {"docId": docId});

    articlebean marticlebean = articlebean.fromJson(responsesss.data);
    marticlebean.data.type = 3;
    marticlebean.data.unscramble = "解读";
    marticlebean.data.defaultSize = "small";

//    String string = "<html><body>sss</body></html>";
//    string = string.replaceAll("sss", marticlebean.data.content);
//
//    flutterWebviewPlugin.launch(
//      new Uri.dataFromString(string,
//              mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
//          .toString(),
//      rect: new Rect.fromLTWH(
//        0.0,
//        70,
//        MediaQuery.of(context).size.width,
//        MediaQuery.of(context).size.height,
//      ),
//      withZoom: false,
//      scrollBar: true
//    );

    _readCounter().then((value){
        print("加载的html===="+value);
          flutterWebviewPlugin.launch(
      new Uri.dataFromString(value,
              mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
          .toString()

              ,
      rect: new Rect.fromLTWH(
        0.0,
        70,
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      withZoom: false,
      scrollBar: true
    );
    });

    flutterWebviewPlugin.evalJavascript("Dz.refreshHtmlContent(${marticlebean.data.toJson()})");

  }

  Future<File> _getLocalFile() async {
    // get the path to the document directory.
    String dir = (await getExternalStorageDirectory()).path;
    print("路径====" + dir);
    return new File('$dir/bookDetails.html');
  }

  Future<String> _readCounter() async {
    try {
      File file = await _getLocalFile();
      // read the variable as a string from the file.
      String contents = await file.readAsString();
      return contents;
    } on FileSystemException {
      return "";
    }
  }

  Future<String> _readCounters() async {
    try {
      String file = await _getFile();
      // read the variable as a string from the file.

      return file;
    } on FileSystemException {
      return "";
    }
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
