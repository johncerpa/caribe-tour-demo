// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'dept_and_cities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

DeptAndCities _$DeptAndCitiesFromJson(Map<String, dynamic> json) {
  return _DeptAndCities.fromJson(json);
}

mixin _$DeptAndCities {
  @JsonKey(ignore: true)
  String get id;
  String get departmentName;
  List<String> get cities;

  DeptAndCities copyWith(
      {@JsonKey(ignore: true) String id,
      String departmentName,
      List<String> cities});

  Map<String, dynamic> toJson();
}

class _$DeptAndCitiesTearOff {
  const _$DeptAndCitiesTearOff();

  _DeptAndCities call(
      {@JsonKey(ignore: true) String id,
      @required String departmentName,
      @required List<String> cities}) {
    return _DeptAndCities(
      id: id,
      departmentName: departmentName,
      cities: cities,
    );
  }
}

const $DeptAndCities = _$DeptAndCitiesTearOff();

@JsonSerializable()
class _$_DeptAndCities implements _DeptAndCities {
  const _$_DeptAndCities(
      {@JsonKey(ignore: true) this.id,
      @required this.departmentName,
      @required this.cities})
      : assert(departmentName != null),
        assert(cities != null);

  factory _$_DeptAndCities.fromJson(Map<String, dynamic> json) =>
      _$_$_DeptAndCitiesFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  final String departmentName;
  @override
  final List<String> cities;

  @override
  String toString() {
    return 'DeptAndCities(id: $id, departmentName: $departmentName, cities: $cities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DeptAndCities &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.departmentName, departmentName) ||
                const DeepCollectionEquality()
                    .equals(other.departmentName, departmentName)) &&
            (identical(other.cities, cities) ||
                const DeepCollectionEquality().equals(other.cities, cities)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(departmentName) ^
      const DeepCollectionEquality().hash(cities);

  @override
  _$_DeptAndCities copyWith({
    Object id = freezed,
    Object departmentName = freezed,
    Object cities = freezed,
  }) {
    return _$_DeptAndCities(
      id: id == freezed ? this.id : id as String,
      departmentName: departmentName == freezed
          ? this.departmentName
          : departmentName as String,
      cities: cities == freezed ? this.cities : cities as List<String>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DeptAndCitiesToJson(this);
  }
}

abstract class _DeptAndCities implements DeptAndCities {
  const factory _DeptAndCities(
      {@JsonKey(ignore: true) String id,
      @required String departmentName,
      @required List<String> cities}) = _$_DeptAndCities;

  factory _DeptAndCities.fromJson(Map<String, dynamic> json) =
      _$_DeptAndCities.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  String get departmentName;
  @override
  List<String> get cities;

  @override
  _DeptAndCities copyWith(
      {@JsonKey(ignore: true) String id,
      String departmentName,
      List<String> cities});
}
