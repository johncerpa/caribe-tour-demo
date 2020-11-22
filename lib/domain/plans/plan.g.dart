// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Plan _$_$_PlanFromJson(Map<String, dynamic> json) {
  return _$_Plan(
    id: json['id'] as String,
    active: json['active'] as bool,
    name: json['name'] as String,
    source: json['source'] as String,
    destination: json['destination'] as String,
    accepted: json['accepted'] as bool,
    places: (json['places'] as List)?.map((e) => e as String)?.toList(),
    guide: json['guide'] as String,
    kidsFilter: json['kidsFilter'] as bool,
    disableFilter: json['disableFilter'] as bool,
    byDepartment: json['byDepartment'] as bool,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    citdepart: (json['citdepart'] as List)?.map((e) => e as String)?.toList(),
    touristE: json['touristE'] as String,
    namesInOrder:
        (json['namesInOrder'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$_$_PlanToJson(_$_Plan instance) => <String, dynamic>{
      'id': instance.id,
      'active': instance.active,
      'name': instance.name,
      'source': instance.source,
      'destination': instance.destination,
      'accepted': instance.accepted,
      'places': instance.places,
      'guide': instance.guide,
      'kidsFilter': instance.kidsFilter,
      'disableFilter': instance.disableFilter,
      'byDepartment': instance.byDepartment,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'citdepart': instance.citdepart,
      'touristE': instance.touristE,
      'namesInOrder': instance.namesInOrder,
    };
