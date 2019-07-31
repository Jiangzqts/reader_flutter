// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homebean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

homebean _$homebeanFromJson(Map<String, dynamic> json) {
  return homebean(
      json['code'] as int,
      json['msg'] as String,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$homebeanToJson(homebean instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['type'] as String,
      json['title'] as String,
      json['showMore'] as bool,
      (json['records'] as List)
          ?.map((e) =>
              e == null ? null : Records.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'showMore': instance.showMore,
      'records': instance.records
    };

Records _$RecordsFromJson(Map<String, dynamic> json) {
  return Records(
      (json['records'] as List)
          ?.map((e) =>
              e == null ? null : Recordss.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['docId'] as String,
      json['contentType'] as String,
      json['price'] as String,
      json['title'] as String,
      json['author'] as String,
      json['cover'] as String,
      json['buy'] as int,
      json['free'] as int,
      json['buyCnt'] as int,
      json['introduction'] as String,
      json['total'] as int,
      json['miniCover'] as String,
      json['tag'] as String,
      json['chargeType'] as String,
      json['discount'] == null
          ? null
          : Discount.fromJson(json['discount'] as Map<String, dynamic>),
      json['latestTitle'] as String,
      json['updateCnt'] as int,
      json['appraised'] as bool,
      json['priceSuffix'] as String,
      json['priceString'] as String,
      json['chargeState'] as int,
      json['buyCntNm'] as String,
      json['totalNm'] as String,
      json['id'] as int,
      json['name'] as String,
      json['browseCntNm'] as String);
}

Map<String, dynamic> _$RecordsToJson(Records instance) => <String, dynamic>{
      'records': instance.recordss,
      'docId': instance.docId,
      'contentType': instance.contentType,
      'price': instance.price,
      'title': instance.title,
      'author': instance.author,
      'cover': instance.cover,
      'buy': instance.buy,
      'free': instance.free,
      'buyCnt': instance.buyCnt,
      'introduction': instance.introduction,
      'total': instance.total,
      'miniCover': instance.miniCover,
      'tag': instance.tag,
      'chargeType': instance.chargeType,
      'discount': instance.discount,
      'latestTitle': instance.latestTitle,
      'updateCnt': instance.updateCnt,
      'appraised': instance.appraised,
      'priceSuffix': instance.priceSuffix,
      'priceString': instance.priceString,
      'chargeState': instance.chargeState,
      'buyCntNm': instance.buyCntNm,
      'totalNm': instance.totalNm,
      'id': instance.id,
      'name': instance.name,
      'browseCntNm': instance.browseCntNm
    };

Recordss _$RecordssFromJson(Map<String, dynamic> json) {
  return Recordss(
      json['docId'] as String,
      json['contentType'] as String,
      json['title'] as String,
      json['publishTime'] as String,
      json['cover'] as String,
      json['duration'] as int,
      json['mediaUrl'] as String,
      json['miniCover'] as String,
      json['year'] as int,
      json['month'] as int,
      json['day'] as int,
      json['publishDt'] as String,
      json['priceSuffix'] as String,
      json['durationNm'] as String);
}

Map<String, dynamic> _$RecordssToJson(Recordss instance) => <String, dynamic>{
      'docId': instance.docId,
      'contentType': instance.contentType,
      'title': instance.title,
      'publishTime': instance.publishTime,
      'cover': instance.cover,
      'duration': instance.duration,
      'mediaUrl': instance.mediaUrl,
      'miniCover': instance.miniCover,
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
      'publishDt': instance.publishDt,
      'priceSuffix': instance.priceSuffix,
      'durationNm': instance.durationNm
    };

Discount _$DiscountFromJson(Map<String, dynamic> json) {
  return Discount(json['hasDiscount'] as bool, json['discountPrice'] as String,
      json['desc'] as String);
}

Map<String, dynamic> _$DiscountToJson(Discount instance) => <String, dynamic>{
      'hasDiscount': instance.hasDiscount,
      'discountPrice': instance.discountPrice,
      'desc': instance.desc
    };
