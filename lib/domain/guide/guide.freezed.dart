// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'guide.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Guide _$GuideFromJson(Map<String, dynamic> json) {
  return _Guide.fromJson(json);
}

mixin _$Guide {
  String get firstName;
  String get lastName;
  String get email;
  String get gender;
  String get phone;
  String get profileImageUrl;
  double get rating;
  String get department;

  Guide copyWith(
      {String firstName,
      String lastName,
      String email,
      String gender,
      String phone,
      String profileImageUrl,
      double rating,
      String department});

  Map<String, dynamic> toJson();
}

class _$GuideTearOff {
  const _$GuideTearOff();

  _Guide call(
      {@required String firstName,
      @required String lastName,
      @required String email,
      @required String gender,
      String phone,
      String profileImageUrl,
      double rating,
      String department}) {
    return _Guide(
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
      phone: phone,
      profileImageUrl: profileImageUrl,
      rating: rating,
      department: department,
    );
  }
}

const $Guide = _$GuideTearOff();

@JsonSerializable()
class _$_Guide with DiagnosticableTreeMixin implements _Guide {
  const _$_Guide(
      {@required this.firstName,
      @required this.lastName,
      @required this.email,
      @required this.gender,
      this.phone,
      this.profileImageUrl,
      this.rating,
      this.department})
      : assert(firstName != null),
        assert(lastName != null),
        assert(email != null),
        assert(gender != null);

  factory _$_Guide.fromJson(Map<String, dynamic> json) =>
      _$_$_GuideFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String gender;
  @override
  final String phone;
  @override
  final String profileImageUrl;
  @override
  final double rating;
  @override
  final String department;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Guide(firstName: $firstName, lastName: $lastName, email: $email, gender: $gender, phone: $phone, profileImageUrl: $profileImageUrl, rating: $rating, department: $department)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Guide'))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('profileImageUrl', profileImageUrl))
      ..add(DiagnosticsProperty('rating', rating))
      ..add(DiagnosticsProperty('department', department));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Guide &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.profileImageUrl, profileImageUrl)) &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.department, department) ||
                const DeepCollectionEquality()
                    .equals(other.department, department)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(profileImageUrl) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(department);

  @override
  _$_Guide copyWith({
    Object firstName = freezed,
    Object lastName = freezed,
    Object email = freezed,
    Object gender = freezed,
    Object phone = freezed,
    Object profileImageUrl = freezed,
    Object rating = freezed,
    Object department = freezed,
  }) {
    return _$_Guide(
      firstName: firstName == freezed ? this.firstName : firstName as String,
      lastName: lastName == freezed ? this.lastName : lastName as String,
      email: email == freezed ? this.email : email as String,
      gender: gender == freezed ? this.gender : gender as String,
      phone: phone == freezed ? this.phone : phone as String,
      profileImageUrl: profileImageUrl == freezed
          ? this.profileImageUrl
          : profileImageUrl as String,
      rating: rating == freezed ? this.rating : rating as double,
      department:
          department == freezed ? this.department : department as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GuideToJson(this);
  }
}

abstract class _Guide implements Guide {
  const factory _Guide(
      {@required String firstName,
      @required String lastName,
      @required String email,
      @required String gender,
      String phone,
      String profileImageUrl,
      double rating,
      String department}) = _$_Guide;

  factory _Guide.fromJson(Map<String, dynamic> json) = _$_Guide.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get gender;
  @override
  String get phone;
  @override
  String get profileImageUrl;
  @override
  double get rating;
  @override
  String get department;

  @override
  _Guide copyWith(
      {String firstName,
      String lastName,
      String email,
      String gender,
      String phone,
      String profileImageUrl,
      double rating,
      String department});
}
