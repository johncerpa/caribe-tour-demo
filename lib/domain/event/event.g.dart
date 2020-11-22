// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$_$_EventFromJson(Map<String, dynamic> json) {
  return _$_Event(
    name: json['name'] as String,
    department: json['department'] as String,
    city: json['city'] as String,
    description: (json['description'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    imgUrl: json['imgUrl'] as String,
    evtDate: json['evtDate'] == null
        ? null
        : DateTime.parse(json['evtDate'] as String),
  );
}

Map<String, dynamic> _$_$_EventToJson(_$_Event instance) => <String, dynamic>{
      'name': instance.name,
      'department': instance.department,
      'city': instance.city,
      'description': instance.description,
      'imgUrl': instance.imgUrl,
      'evtDate': instance.evtDate?.toIso8601String(),
    };
