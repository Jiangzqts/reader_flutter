// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

entity _$entityFromJson(Map<String, dynamic> json) {
  return entity(
      json['code'] as int,
      json['msg'] as String,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$entityToJson(entity instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['updatedCnt'] as int,
      json['hotTopics'] as List,
      (json['topArticles'] as List)
          ?.map((e) => e == null
              ? null
              : TopArticles.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['articles'] == null
          ? null
          : Articles.fromJson(json['articles'] as Map<String, dynamic>));
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'updatedCnt': instance.updatedCnt,
      'hotTopics': instance.hotTopics,
      'topArticles': instance.topArticles,
      'articles': instance.articles
    };

TopArticles _$TopArticlesFromJson(Map<String, dynamic> json) {
  return TopArticles(
      json['docId'] as String,
      json['title'] as String,
      json['publishTime'] as String,
      json['browseCnt'] as int,
      json['likeCnt'] as int,
      json['cover'] as String,
      json['introduction'] as String,
      json['publishDt'] as String,
      json['priceSuffix'] as String,
      json['browseCntNm'] as String);
}

Map<String, dynamic> _$TopArticlesToJson(TopArticles instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'title': instance.title,
      'publishTime': instance.publishTime,
      'browseCnt': instance.browseCnt,
      'likeCnt': instance.likeCnt,
      'cover': instance.cover,
      'introduction': instance.introduction,
      'publishDt': instance.publishDt,
      'priceSuffix': instance.priceSuffix,
      'browseCntNm': instance.browseCntNm
    };

Articles _$ArticlesFromJson(Map<String, dynamic> json) {
  return Articles(
      json['total'] as int,
      json['size'] as int,
      json['current'] as int,
      (json['records'] as List)
          ?.map((e) =>
              e == null ? null : Records.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['pages'] as int);
}

Map<String, dynamic> _$ArticlesToJson(Articles instance) => <String, dynamic>{
      'total': instance.total,
      'size': instance.size,
      'current': instance.current,
      'records': instance.records,
      'pages': instance.pages
    };

Records _$RecordsFromJson(Map<String, dynamic> json) {
  return Records(
      json['docId'] as String,
      json['title'] as String,
      json['publishTime'] as String,
      json['browseCnt'] as int,
      json['likeCnt'] as int,
      json['cover'] as String,
      json['introduction'] as String,
      json['publishDt'] as String,
      json['priceSuffix'] as String,
      json['browseCntNm'] as String);
}

Map<String, dynamic> _$RecordsToJson(Records instance) => <String, dynamic>{
      'docId': instance.docId,
      'title': instance.title,
      'publishTime': instance.publishTime,
      'browseCnt': instance.browseCnt,
      'likeCnt': instance.likeCnt,
      'cover': instance.cover,
      'introduction': instance.introduction,
      'publishDt': instance.publishDt,
      'priceSuffix': instance.priceSuffix,
      'browseCntNm': instance.browseCntNm
    };
