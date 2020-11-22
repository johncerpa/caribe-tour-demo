// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dept_and_cities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeptAndCities _$_$_DeptAndCitiesFromJson(Map<String, dynamic> json) {
  return _$_DeptAndCities(
    departmentName: json['departmentName'] as String,
    cities: (json['cities'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$_$_DeptAndCitiesToJson(_$_DeptAndCities instance) =>
    <String, dynamic>{
      'departmentName': instance.departmentName,
      'cities': instance.cities,
    };
