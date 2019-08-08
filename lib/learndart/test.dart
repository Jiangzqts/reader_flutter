import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter WebView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new CupertinoTabScaffold(
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Page 1 of tab $index'),
              ),
              child: Center(
                child: CupertinoButton(
                  child: const Text('Next page'),
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute<void>(
                        builder: (BuildContext context) {
                          return CupertinoPageScaffold(
                            navigationBar: CupertinoNavigationBar(
                              middle: Text('Page 2 of tab $index'),
                            ),
                            child: Center(
                              child: CupertinoButton(
                                child: const Text('Back'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
      tabBar: new CupertinoTabBar(items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(icon: Icon(Icons.add), title: Text("你好")),
        new BottomNavigationBarItem(icon: Icon(Icons.add), title: Text("不哈哈")),
        new BottomNavigationBarItem(icon: Icon(Icons.add), title: Text("你哈哈哈")),
        new BottomNavigationBarItem(icon: Icon(Icons.add), title: Text("咳咳")),
      ]),
    );
  }
}
