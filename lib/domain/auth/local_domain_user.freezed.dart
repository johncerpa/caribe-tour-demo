// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'local_domain_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$LocalDomainUser {
  UniqueId get id;
  Name get firstName;
  Name get lastName;
  EmailAddress get email;
  DateTime get birthday;
  Gender get gender;
  bool get isGuide;
  String get phone;
  dynamic get profileImageUrl;
  String get department;

  LocalDomainUser copyWith(
      {UniqueId id,
      Name firstName,
      Name lastName,
      EmailAddress email,
      DateTime birthday,
      Gender gender,
      bool isGuide,
      String phone,
      dynamic profileImageUrl,
      String department});
}

class _$LocalDomainUserTearOff {
  const _$LocalDomainUserTearOff();

  _LocalDomainUser call(
      {@required UniqueId id,
      @required Name firstName,
      @required Name lastName,
      @required EmailAddress email,
      @required DateTime birthday,
      @required Gender gender,
      @required bool isGuide,
      String phone,
      dynamic profileImageUrl,
      String department}) {
    return _LocalDomainUser(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      birthday: birthday,
      gender: gender,
      isGuide: isGuide,
      phone: phone,
      profileImageUrl: profileImageUrl,
      department: department,
    );
  }
}

const $LocalDomainUser = _$LocalDomainUserTearOff();

class _$_LocalDomainUser
    with DiagnosticableTreeMixin
    implements _LocalDomainUser {
  const _$_LocalDomainUser(
      {@required this.id,
      @required this.firstName,
      @required this.lastName,
      @required this.email,
      @required this.birthday,
      @required this.gender,
      @required this.isGuide,
      this.phone,
      this.profileImageUrl,
      this.department})
      : assert(id != null),
        assert(firstName != null),
        assert(lastName != null),
        assert(email != null),
        assert(birthday != null),
        assert(gender != null),
        assert(isGuide != null);

  @override
  final UniqueId id;
  @override
  final Name firstName;
  @override
  final Name lastName;
  @override
  final EmailAddress email;
  @override
  final DateTime birthday;
  @override
  final Gender gender;
  @override
  final bool isGuide;
  @override
  final String phone;
  @override
  final dynamic profileImageUrl;
  @override
  final String department;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalDomainUser(id: $id, firstName: $firstName, lastName: $lastName, email: $email, birthday: $birthday, gender: $gender, isGuide: $isGuide, phone: $phone, profileImageUrl: $profileImageUrl, department: $department)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocalDomainUser'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('birthday', birthday))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('isGuide', isGuide))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('profileImageUrl', profileImageUrl))
      ..add(DiagnosticsProperty('department', department));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocalDomainUser &&
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
            (identical(other.profileImageUrl, profileImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.profileImageUrl, profileImageUrl)) &&
            (identical(other.department, department) ||
                const DeepCollectionEquality()
                    .equals(other.department, department)));
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
      const DeepCollectionEquality().hash(profileImageUrl) ^
      const DeepCollectionEquality().hash(department);

  @override
  _$_LocalDomainUser copyWith({
    Object id = freezed,
    Object firstName = freezed,
    Object lastName = freezed,
    Object email = freezed,
    Object birthday = freezed,
    Object gender = freezed,
    Object isGuide = freezed,
    Object phone = freezed,
    Object profileImageUrl = freezed,
    Object department = freezed,
  }) {
    return _$_LocalDomainUser(
      id: id == freezed ? this.id : id as UniqueId,
      firstName: firstName == freezed ? this.firstName : firstName as Name,
      lastName: lastName == freezed ? this.lastName : lastName as Name,
      email: email == freezed ? this.email : email as EmailAddress,
      birthday: birthday == freezed ? this.birthday : birthday as DateTime,
      gender: gender == freezed ? this.gender : gender as Gender,
      isGuide: isGuide == freezed ? this.isGuide : isGuide as bool,
      phone: phone == freezed ? this.phone : phone as String,
      profileImageUrl: profileImageUrl == freezed
          ? this.profileImageUrl
          : profileImageUrl as dynamic,
      department:
          department == freezed ? this.department : department as String,
    );
  }
}

abstract class _LocalDomainUser implements LocalDomainUser {
  const factory _LocalDomainUser(
      {@required UniqueId id,
      @required Name firstName,
      @required Name lastName,
      @required EmailAddress email,
      @required DateTime birthday,
      @required Gender gender,
      @required bool isGuide,
      String phone,
      dynamic profileImageUrl,
      String department}) = _$_LocalDomainUser;

  @override
  UniqueId get id;
  @override
  Name get firstName;
  @override
  Name get lastName;
  @override
  EmailAddress get email;
  @override
  DateTime get birthday;
  @override
  Gender get gender;
  @override
  bool get isGuide;
  @override
  String get phone;
  @override
  dynamic get profileImageUrl;
  @override
  String get department;

  @override
  _LocalDomainUser copyWith(
      {UniqueId id,
      Name firstName,
      Name lastName,
      EmailAddress email,
      DateTime birthday,
      Gender gender,
      bool isGuide,
      String phone,
      dynamic profileImageUrl,
      String department});
}
