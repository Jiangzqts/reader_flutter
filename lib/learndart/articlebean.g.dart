// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articlebean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

articlebean _$articlebeanFromJson(Map<String, dynamic> json) {
  return articlebean(
      json['code'] as int,
      json['msg'] as String,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$articlebeanToJson(articlebean instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['docId'] as String,
      json['contentType'] as String,
      json['title'] as String,
      json['author'] as String,
      json['origin'] as String,
      json['content'] as String,
      json['publishTime'] as String,
      json['readTime'] as String,
      json['browseCnt'] as int,
      json['commentCnt'] as int,
      json['likeCnt'] as int,
      json['liked'] as bool,
      json['cover'] as String,
      json['introduction'] as String,
      json['miniCover'] as String,
      json['shareUrl'] as String,
      json['topics'] as List,
      json['publishDt'] as String,
      json['priceSuffix'] as String,
      json['browseCntNm'] as String,
      json['type'] as int,
      json['appraised'] as bool,
      json['unscramble'] as String,
      json['defaultSize'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'docId': instance.docId,
      'contentType': instance.contentType,
      'title': instance.title,
      'author': instance.author,
      'origin': instance.origin,
      'content': instance.content,
      'publishTime': instance.publishTime,
      'readTime': instance.readTime,
      'browseCnt': instance.browseCnt,
      'commentCnt': instance.commentCnt,
      'likeCnt': instance.likeCnt,
      'liked': instance.liked,
      'cover': instance.cover,
      'introduction': instance.introduction,
      'miniCover': instance.miniCover,
      'shareUrl': instance.shareUrl,
      'topics': instance.topics,
      'publishDt': instance.publishDt,
      'priceSuffix': instance.priceSuffix,
      'browseCntNm': instance.browseCntNm,
      'type': instance.type,
      'unscramble': instance.unscramble,
      'defaultSize': instance.defaultSize,
      'appraised': instance.appraised
    };
