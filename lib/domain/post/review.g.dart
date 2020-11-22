// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Review _$_$_ReviewFromJson(Map<String, dynamic> json) {
  return _$_Review(
    id: json['id'] as String,
    comment: json['comment'] as String,
    userName: json['userName'] as String,
    rating: (json['rating'] as num)?.toDouble(),
    userID: json['userID'] as String,
    img: json['img'] as String,
    dat: json['dat'] == null ? null : DateTime.parse(json['dat'] as String),
  );
}

Map<String, dynamic> _$_$_ReviewToJson(_$_Review instance) => <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'userName': instance.userName,
      'rating': instance.rating,
      'userID': instance.userID,
      'img': instance.img,
      'dat': instance.dat?.toIso8601String(),
    };
