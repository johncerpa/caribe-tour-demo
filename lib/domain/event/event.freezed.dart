// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

mixin _$Event {
  String get name;
  String get department;
  String get city;
  Map<String, String> get description;
  String get imgUrl;
  DateTime get evtDate;

  Event copyWith(
      {String name,
      String department,
      String city,
      Map<String, String> description,
      String imgUrl,
      DateTime evtDate});

  Map<String, dynamic> toJson();
}

class _$EventTearOff {
  const _$EventTearOff();

  _Event call(
      {@required String name,
      @required String department,
      @required String city,
      @required Map<String, String> description,
      @required String imgUrl,
      DateTime evtDate}) {
    return _Event(
      name: name,
      department: department,
      city: city,
      description: description,
      imgUrl: imgUrl,
      evtDate: evtDate,
    );
  }
}

const $Event = _$EventTearOff();

@JsonSerializable()
class _$_Event with DiagnosticableTreeMixin implements _Event {
  const _$_Event(
      {@required this.name,
      @required this.department,
      @required this.city,
      @required this.description,
      @required this.imgUrl,
      this.evtDate})
      : assert(name != null),
        assert(department != null),
        assert(city != null),
        assert(description != null),
        assert(imgUrl != null);

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$_$_EventFromJson(json);

  @override
  final String name;
  @override
  final String department;
  @override
  final String city;
  @override
  final Map<String, String> description;
  @override
  final String imgUrl;
  @override
  final DateTime evtDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Event(name: $name, department: $department, city: $city, description: $description, imgUrl: $imgUrl, evtDate: $evtDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Event'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('department', department))
      ..add(DiagnosticsProperty('city', city))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('imgUrl', imgUrl))
      ..add(DiagnosticsProperty('evtDate', evtDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Event &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.department, department) ||
                const DeepCollectionEquality()
                    .equals(other.department, department)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.imgUrl, imgUrl) ||
                const DeepCollectionEquality().equals(other.imgUrl, imgUrl)) &&
            (identical(other.evtDate, evtDate) ||
                const DeepCollectionEquality().equals(other.evtDate, evtDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(department) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(imgUrl) ^
      const DeepCollectionEquality().hash(evtDate);

  @override
  _$_Event copyWith({
    Object name = freezed,
    Object department = freezed,
    Object city = freezed,
    Object description = freezed,
    Object imgUrl = freezed,
    Object evtDate = freezed,
  }) {
    return _$_Event(
      name: name == freezed ? this.name : name as String,
      department:
          department == freezed ? this.department : department as String,
      city: city == freezed ? this.city : city as String,
      description: description == freezed
          ? this.description
          : description as Map<String, String>,
      imgUrl: imgUrl == freezed ? this.imgUrl : imgUrl as String,
      evtDate: evtDate == freezed ? this.evtDate : evtDate as DateTime,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EventToJson(this);
  }
}

abstract class _Event implements Event {
  const factory _Event(
      {@required String name,
      @required String department,
      @required String city,
      @required Map<String, String> description,
      @required String imgUrl,
      DateTime evtDate}) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  String get name;
  @override
  String get department;
  @override
  String get city;
  @override
  Map<String, String> get description;
  @override
  String get imgUrl;
  @override
  DateTime get evtDate;

  @override
  _Event copyWith(
      {String name,
      String department,
      String city,
      Map<String, String> description,
      String imgUrl,
      DateTime evtDate});
}
