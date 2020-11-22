// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

mixin _$UserDto {
  @JsonKey(ignore: true)
  String get id;
  String get firstName;
  String get lastName;
  String get email;
  DateTime get birthday;
  String get gender;
  bool get isGuide;
  String get phone;
  String get dep;

  UserDto copyWith(
      {@JsonKey(ignore: true) String id,
      String firstName,
      String lastName,
      String email,
      DateTime birthday,
      String gender,
      bool isGuide,
      String phone,
      String dep});

  Map<String, dynamic> toJson();
}

class _$UserDtoTearOff {
  const _$UserDtoTearOff();

  _UserDto call(
      {@JsonKey(ignore: true) String id,
      @required String firstName,
      @required String lastName,
      @required String email,
      @required DateTime birthday,
      @required String gender,
      @required bool isGuide,
      @required String phone,
      String dep}) {
    return _UserDto(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      birthday: birthday,
      gender: gender,
      isGuide: isGuide,
      phone: phone,
      dep: dep,
    );
  }
}

const $UserDto = _$UserDtoTearOff();

@JsonSerializable()
class _$_UserDto implements _UserDto {
  const _$_UserDto(
      {@JsonKey(ignore: true) this.id,
      @required this.firstName,
      @required this.lastName,
      @required this.email,
      @required this.birthday,
      @required this.gender,
      @required this.isGuide,
      @required this.phone,
      this.dep})
      : assert(firstName != null),
        assert(lastName != null),
        assert(email != null),
        assert(birthday != null),
        assert(gender != null),
        assert(isGuide != null),
        assert(phone != null);

  factory _$_UserDto.fromJson(Map<String, dynamic> json) =>
      _$_$_UserDtoFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final DateTime birthday;
  @override
  final String gender;
  @override
  final bool isGuide;
  @override
  final String phone;
  @override
  final String dep;

  @override
  String toString() {
    return 'UserDto(id: $id, firstName: $firstName, lastName: $lastName, email: $email, birthday: $birthday, gender: $gender, isGuide: $isGuide, phone: $phone, dep: $dep)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.birthday, birthday) ||
                const DeepCollectionEquality()
                    .equals(other.birthday, birthday)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.isGuide, isGuide) ||
                const DeepCollectionEquality()
                    .equals(other.isGuide, isGuide)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.dep, dep) ||
                const DeepCollectionEquality().equals(other.dep, dep)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(birthday) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(isGuide) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(dep);

  @override
  _$_UserDto copyWith({
    Object id = freezed,
    Object firstName = freezed,
    Object lastName = freezed,
    Object email = freezed,
    Object birthday = freezed,
    Object gender = freezed,
    Object isGuide = freezed,
    Object phone = freezed,
    Object dep = freezed,
  }) {
    return _$_UserDto(
      id: id == freezed ? this.id : id as String,
      firstName: firstName == freezed ? this.firstName : firstName as String,
      lastName: lastName == freezed ? this.lastName : lastName as String,
      email: email == freezed ? this.email : email as String,
      birthday: birthday == freezed ? this.birthday : birthday as DateTime,
      gender: gender == freezed ? this.gender : gender as String,
      isGuide: isGuide == freezed ? this.isGuide : isGuide as bool,
      phone: phone == freezed ? this.phone : phone as String,
      dep: dep == freezed ? this.dep : dep as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserDtoToJson(this);
  }
}

abstract class _UserDto implements UserDto {
  const factory _UserDto(
      {@JsonKey(ignore: true) String id,
      @required String firstName,
      @required String lastName,
      @required String email,
      @required DateTime birthday,
      @required String gender,
      @required bool isGuide,
      @required String phone,
      String dep}) = _$_UserDto;

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$_UserDto.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  DateTime get birthday;
  @override
  String get gender;
  @override
  bool get isGuide;
  @override
  String get phone;
  @override
  String get dep;

  @override
  _UserDto copyWith(
      {@JsonKey(ignore: true) String id,
      String firstName,
      String lastName,
      String email,
      DateTime birthday,
      String gender,
      bool isGuide,
      String phone,
      String dep});
}
