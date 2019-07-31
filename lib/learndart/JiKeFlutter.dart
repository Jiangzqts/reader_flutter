import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class JiKeFlutter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<JiKeFlutter> {
  @override
  Widget build(BuildContext context) {
//    return new Text(
//      "你好打分风风风风付付付付付付付付付付付付付付付付付付付付付付付付付付付付付付",
//      textAlign: TextAlign.center,
//      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 20),
//
//    );

//    TextStyle blackStyle=TextStyle(fontWeight: FontWeight.w900,fontSize: 20,color: Colors.red);
//
//
//    TextStyle redStype=TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue);
//
//     return Text.rich(TextSpan(children: <TextSpan>[
//       TextSpan(text: "民愤ikgnelgmnelgnmelgmnelmgelgmlemglemglegmelgmlegm",style: blackStyle),
//       TextSpan(text: "我是蓝色",style: redStype),
//       TextSpan(text: "啦啦啦啦啦啦",style: blackStyle),
//       TextSpan(text: "抵扣积分欧冠meow每个可让我没看过",style: redStype),
//     ]),textAlign: TextAlign.center,);

//      return new FadeInImage.assetNetwork(placeholder: "images/lake.jpg", image: "http://pic60.nipic.com/file/20150129/6448355_204110337000_2.jpg",fit: BoxFit.cover,width: 200,height: 200,);

    return new Column(
      children: <Widget>[
        new Text("你好"),
        new FadeInImage.assetNetwork(
          placeholder: "images/lake.jpg",
          image:
              "http://pic60.nipic.com/file/20150129/6448355_204110337000_2.jpg",
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),
        new FloatingActionButton(
          onPressed: null,
          tooltip: "floatingactionbugtong",
          child: new Text("我是floatingactionbuttong"),
        ),
        new RaisedButton(
          onPressed: null,
          child: new Text("RaiseButtong"),
        ),
        new FlatButton(
          onPressed: null,
          child: new Text("FlatButton"),
          color: Colors.blue,
          colorBrightness: Brightness.light,
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
//        new CachedNetworkImage(
//          imageUrl: "http://pic60.nipic.com/file/20150129/6448355_204110337000_2.jpg",
//          placeholder: (context,url)=>new CircularProgressIndicator(),
//          errorWidget: (context,url,error)=>new Icon(Icons.error),
//        )
      ],
    );
  }
}
