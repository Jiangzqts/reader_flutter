import 'package:json_annotation/json_annotation.dart'; 
  
part 'entity.g.dart';


@JsonSerializable()
  class entity extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  Data data;

  entity(this.code,this.msg,this.data,);

  factory entity.fromJson(Map<String, dynamic> srcJson) => _$entityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$entityToJson(this);

}

  
@JsonSerializable()
  class Data extends Object {

  @JsonKey(name: 'updatedCnt')
  int updatedCnt;

  @JsonKey(name: 'hotTopics')
  List<dynamic> hotTopics;

  @JsonKey(name: 'topArticles')
  List<TopArticles> topArticles;

  @JsonKey(name: 'articles')
  Articles articles;

  Data(this.updatedCnt,this.hotTopics,this.topArticles,this.articles,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
@JsonSerializable()
  class TopArticles extends Object {

  @JsonKey(name: 'docId')
  String docId;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'publishTime')
  String publishTime;

  @JsonKey(name: 'browseCnt')
  int browseCnt;

  @JsonKey(name: 'likeCnt')
  int likeCnt;

  @JsonKey(name: 'cover')
  String cover;

  @JsonKey(name: 'introduction')
  String introduction;

  @JsonKey(name: 'publishDt')
  String publishDt;

  @JsonKey(name: 'priceSuffix')
  String priceSuffix;

  @JsonKey(name: 'browseCntNm')
  String browseCntNm;

  TopArticles(this.docId,this.title,this.publishTime,this.browseCnt,this.likeCnt,this.cover,this.introduction,this.publishDt,this.priceSuffix,this.browseCntNm,);

  factory TopArticles.fromJson(Map<String, dynamic> srcJson) => _$TopArticlesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TopArticlesToJson(this);

}

  
@JsonSerializable()
  class Articles extends Object {

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'current')
  int current;

  @JsonKey(name: 'records')
  List<Records> records;

  @JsonKey(name: 'pages')
  int pages;

  Articles(this.total,this.size,this.current,this.records,this.pages,);

  factory Articles.fromJson(Map<String, dynamic> srcJson) => _$ArticlesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);

}

  
@JsonSerializable()
  class Records extends Object {

  @JsonKey(name: 'docId')
  String docId;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'publishTime')
  String publishTime;

  @JsonKey(name: 'browseCnt')
  int browseCnt;

  @JsonKey(name: 'likeCnt')
  int likeCnt;

  @JsonKey(name: 'cover')
  String cover;

  @JsonKey(name: 'introduction')
  String introduction;

  @JsonKey(name: 'publishDt')
  String publishDt;

  @JsonKey(name: 'priceSuffix')
  String priceSuffix;

  @JsonKey(name: 'browseCntNm')
  String browseCntNm;

  Records(this.docId,this.title,this.publishTime,this.browseCnt,this.likeCnt,this.cover,this.introduction,this.publishDt,this.priceSuffix,this.browseCntNm,);

  factory Records.fromJson(Map<String, dynamic> srcJson) => _$RecordsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RecordsToJson(this);

}

  
