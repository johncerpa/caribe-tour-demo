// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Gallery _$_$_GalleryFromJson(Map<String, dynamic> json) {
  return _$_Gallery(
    id: json['id'] as String,
    imUrl: json['imUrl'] as String,
    author: json['author'] as String,
    time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
  );
}

Map<String, dynamic> _$_$_GalleryToJson(_$_Gallery instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imUrl': instance.imUrl,
      'author': instance.author,
      'time': instance.time?.toIso8601String(),
    };
