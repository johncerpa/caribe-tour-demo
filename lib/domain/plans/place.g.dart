// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Place _$_$_PlaceFromJson(Map<String, dynamic> json) {
  return _$_Place(
    id: json['id'] as String,
    name: json['name'] as String,
    description: (json['description'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    accesibility: json['accesibility'] as bool,
    forAdults: json['forAdults'] as bool,
    schedule: (json['schedule'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    type: (json['type'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    rating: (json['rating'] as num)?.toDouble(),
    imageUrl: json['imageUrl'] as String,
    city: json['city'] as String,
    department: json['department'] as String,
    tips: (json['tips'] as List)
        ?.map((e) => (e as Map<String, dynamic>)?.map(
              (k, e) => MapEntry(k, e as String),
            ))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_PlaceToJson(_$_Place instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'accesibility': instance.accesibility,
      'forAdults': instance.forAdults,
      'schedule': instance.schedule,
      'type': instance.type,
      'rating': instance.rating,
      'imageUrl': instance.imageUrl,
      'city': instance.city,
      'department': instance.department,
      'tips': instance.tips,
    };
