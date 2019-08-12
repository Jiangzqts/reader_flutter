import 'package:json_annotation/json_annotation.dart';

part 'articlebean.g.dart';


@JsonSerializable()
class articlebean extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  Data data;

  articlebean(this.code,this.msg,this.data,);

  factory articlebean.fromJson(Map<String, dynamic> srcJson) => _$articlebeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$articlebeanToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'docId')
  String docId;

  @JsonKey(name: 'contentType')
  String contentType;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'origin')
  String origin;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'publishTime')
  String publishTime;

  @JsonKey(name: 'readTime')
  String readTime;

  @JsonKey(name: 'browseCnt')
  int browseCnt;

  @JsonKey(name: 'commentCnt')
  int commentCnt;

  @JsonKey(name: 'likeCnt')
  int likeCnt;

  @JsonKey(name: 'liked')
  bool liked;

  @JsonKey(name: 'cover')
  String cover;

  @JsonKey(name: 'introduction')
  String introduction;

  @JsonKey(name: 'miniCover')
  String miniCover;

  @JsonKey(name: 'shareUrl')
  String shareUrl;

  @JsonKey(name: 'topics')
  List<dynamic> topics;

  @JsonKey(name: 'publishDt')
  String publishDt;

  @JsonKey(name: 'priceSuffix')
  String priceSuffix;

  @JsonKey(name: 'browseCntNm')
  String browseCntNm;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'unscramble')
  String unscramble;

  @JsonKey(name: 'defaultSize')
  String defaultSize;


  @JsonKey(name: 'appraised')
  bool appraised;




  Data(this.docId,this.contentType,this.title,this.author,this.origin,this.content,this.publishTime,this.readTime,this.browseCnt,this.commentCnt,this.likeCnt,this.liked,this.cover,this.introduction,this.miniCover,this.shareUrl,this.topics,this.publishDt,this.priceSuffix,this.browseCntNm,this.type,this.appraised,this.unscramble,this.defaultSize);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


