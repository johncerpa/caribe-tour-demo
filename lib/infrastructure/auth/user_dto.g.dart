// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDto _$_$_UserDtoFromJson(Map<String, dynamic> json) {
  return _$_UserDto(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    email: json['email'] as String,
    birthday: json['birthday'] == null
        ? null
        : DateTime.parse(json['birthday'] as String),
    gender: json['gender'] as String,
    isGuide: json['isGuide'] as bool,
    phone: json['phone'] as String,
    dep: json['dep'] as String,
  );
}

Map<String, dynamic> _$_$_UserDtoToJson(_$_UserDto instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'birthday': instance.birthday?.toIso8601String(),
      'gender': instance.gender,
      'isGuide': instance.isGuide,
      'phone': instance.phone,
      'dep': instance.dep,
    };
