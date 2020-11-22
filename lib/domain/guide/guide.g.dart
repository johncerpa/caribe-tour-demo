// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guide.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Guide _$_$_GuideFromJson(Map<String, dynamic> json) {
  return _$_Guide(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    email: json['email'] as String,
    gender: json['gender'] as String,
    phone: json['phone'] as String,
    profileImageUrl: json['profileImageUrl'] as String,
    rating: (json['rating'] as num)?.toDouble(),
    department: json['department'] as String,
  );
}

Map<String, dynamic> _$_$_GuideToJson(_$_Guide instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'gender': instance.gender,
      'phone': instance.phone,
      'profileImageUrl': instance.profileImageUrl,
      'rating': instance.rating,
      'department': instance.department,
    };
