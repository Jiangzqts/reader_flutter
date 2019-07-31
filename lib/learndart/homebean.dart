import 'package:json_annotation/json_annotation.dart';

part 'homebean.g.dart';


@JsonSerializable()
class homebean extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  List<Data> data;

  homebean(this.code,this.msg,this.data,);

  factory homebean.fromJson(Map<String, dynamic> srcJson) => _$homebeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$homebeanToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'showMore')
  bool showMore;

  @JsonKey(name: 'records')
  List<Records> records;

  Data(this.type,this.title,this.showMore,this.records,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Records extends Object {

  @JsonKey(name: 'records')
  List<Recordss> recordss;

  @JsonKey(name: 'docId')
  String docId;

  @JsonKey(name: 'contentType')
  String contentType;

  @JsonKey(name: 'price')
  String price;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'cover')
  String cover;

  @JsonKey(name: 'buy')
  int buy;

  @JsonKey(name: 'free')
  int free;

  @JsonKey(name: 'buyCnt')
  int buyCnt;

  @JsonKey(name: 'introduction')
  String introduction;

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'miniCover')
  String miniCover;

  @JsonKey(name: 'tag')
  String tag;

  @JsonKey(name: 'chargeType')
  String chargeType;

  @JsonKey(name: 'discount')
  Discount discount;

  @JsonKey(name: 'latestTitle')
  String latestTitle;

  @JsonKey(name: 'updateCnt')
  int updateCnt;

  @JsonKey(name: 'appraised')
  bool appraised;

  @JsonKey(name: 'priceSuffix')
  String priceSuffix;

  @JsonKey(name: 'priceString')
  String priceString;

  @JsonKey(name: 'chargeState')
  int chargeState;

  @JsonKey(name: 'buyCntNm')
  String buyCntNm;

  @JsonKey(name: 'totalNm')
  String totalNm;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'browseCntNm')
  String browseCntNm;

  Records(this.recordss,this.docId,this.contentType,this.price,this.title,this.author,this.cover,this.buy,this.free,this.buyCnt,this.introduction,this.total,this.miniCover,this.tag,this.chargeType,this.discount,this.latestTitle,this.updateCnt,this.appraised,this.priceSuffix,this.priceString,this.chargeState,this.buyCntNm,this.totalNm,this.id,this.name,this.browseCntNm);

  factory Records.fromJson(Map<String, dynamic> srcJson) => _$RecordsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RecordsToJson(this);

}


@JsonSerializable()
class Recordss extends Object {

  @JsonKey(name: 'docId')
  String docId;

  @JsonKey(name: 'contentType')
  String contentType;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'publishTime')
  String publishTime;

  @JsonKey(name: 'cover')
  String cover;

  @JsonKey(name: 'duration')
  int duration;

  @JsonKey(name: 'mediaUrl')
  String mediaUrl;

  @JsonKey(name: 'miniCover')
  String miniCover;

  @JsonKey(name: 'year')
  int year;

  @JsonKey(name: 'month')
  int month;

  @JsonKey(name: 'day')
  int day;

  @JsonKey(name: 'publishDt')
  String publishDt;

  @JsonKey(name: 'priceSuffix')
  String priceSuffix;

  @JsonKey(name: 'durationNm')
  String durationNm;

  Recordss(this.docId,this.contentType,this.title,this.publishTime,this.cover,this.duration,this.mediaUrl,this.miniCover,this.year,this.month,this.day,this.publishDt,this.priceSuffix,this.durationNm,);

  factory Recordss.fromJson(Map<String, dynamic> srcJson) => _$RecordssFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RecordssToJson(this);

}


@JsonSerializable()
class Discount extends Object {

  @JsonKey(name: 'hasDiscount')
  bool hasDiscount;

  @JsonKey(name: 'discountPrice')
  String discountPrice;

  @JsonKey(name: 'desc')
  String desc;

  Discount(this.hasDiscount,this.discountPrice,this.desc,);

  factory Discount.fromJson(Map<String, dynamic> srcJson) => _$DiscountFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DiscountToJson(this);

}

  
