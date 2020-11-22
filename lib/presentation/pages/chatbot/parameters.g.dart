// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ParametersStart _$_$_ParametersStartFromJson(Map<String, dynamic> json) {
  return _$_ParametersStart(
    dias: json['dias'] as int,
    departamentos:
        (json['departamentos'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$_$_ParametersStartToJson(_$_ParametersStart instance) =>
    <String, dynamic>{
      'dias': instance.dias,
      'departamentos': instance.departamentos,
    };
