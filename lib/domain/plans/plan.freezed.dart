// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Plan _$PlanFromJson(Map<String, dynamic> json) {
  return _Plan.fromJson(json);
}

mixin _$Plan {
  String get id;
  bool get active;
  String get name;
  String get source;
  String get destination;
  bool get accepted;
  List<String> get places;
  String get guide;
  bool get kidsFilter;
  bool get disableFilter;
  bool get byDepartment;
  double get latitude;
  double get longitude;
  List<String> get citdepart;
  String get touristE;
  List<String> get namesInOrder;

  Plan copyWith(
      {String id,
      bool active,
      String name,
      String source,
      String destination,
      bool accepted,
      List<String> places,
      String guide,
      bool kidsFilter,
      bool disableFilter,
      bool byDepartment,
      double latitude,
      double longitude,
      List<String> citdepart,
      String touristE,
      List<String> namesInOrder});

  Map<String, dynamic> toJson();
}

class _$PlanTearOff {
  const _$PlanTearOff();

  _Plan call(
      {String id,
      @required bool active,
      @required String name,
      String source,
      String destination,
      bool accepted,
      @required List<String> places,
      String guide,
      bool kidsFilter,
      bool disableFilter,
      bool byDepartment,
      double latitude,
      double longitude,
      List<String> citdepart,
      String touristE,
      List<String> namesInOrder}) {
    return _Plan(
      id: id,
      active: active,
      name: name,
      source: source,
      destination: destination,
      accepted: accepted,
      places: places,
      guide: guide,
      kidsFilter: kidsFilter,
      disableFilter: disableFilter,
      byDepartment: byDepartment,
      latitude: latitude,
      longitude: longitude,
      citdepart: citdepart,
      touristE: touristE,
      namesInOrder: namesInOrder,
    );
  }
}

const $Plan = _$PlanTearOff();

@JsonSerializable()
class _$_Plan implements _Plan {
  const _$_Plan(
      {this.id,
      @required this.active,
      @required this.name,
      this.source,
      this.destination,
      this.accepted,
      @required this.places,
      this.guide,
      this.kidsFilter,
      this.disableFilter,
      this.byDepartment,
      this.latitude,
      this.longitude,
      this.citdepart,
      this.touristE,
      this.namesInOrder})
      : assert(active != null),
        assert(name != null),
        assert(places != null);

  factory _$_Plan.fromJson(Map<String, dynamic> json) =>
      _$_$_PlanFromJson(json);

  @override
  final String id;
  @override
  final bool active;
  @override
  final String name;
  @override
  final String source;
  @override
  final String destination;
  @override
  final bool accepted;
  @override
  final List<String> places;
  @override
  final String guide;
  @override
  final bool kidsFilter;
  @override
  final bool disableFilter;
  @override
  final bool byDepartment;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final List<String> citdepart;
  @override
  final String touristE;
  @override
  final List<String> namesInOrder;

  @override
  String toString() {
    return 'Plan(id: $id, active: $active, name: $name, source: $source, destination: $destination, accepted: $accepted, places: $places, guide: $guide, kidsFilter: $kidsFilter, disableFilter: $disableFilter, byDepartment: $byDepartment, latitude: $latitude, longitude: $longitude, citdepart: $citdepart, touristE: $touristE, namesInOrder: $namesInOrder)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Plan &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.source, source) ||
                const DeepCollectionEquality().equals(other.source, source)) &&
            (identical(other.destination, destination) ||
                const DeepCollectionEquality()
                    .equals(other.destination, destination)) &&
            (identical(other.accepted, accepted) ||
                const DeepCollectionEquality()
                    .equals(other.accepted, accepted)) &&
            (identical(other.places, places) ||
                const DeepCollectionEquality().equals(other.places, places)) &&
            (identical(other.guide, guide) ||
                const DeepCollectionEquality().equals(other.guide, guide)) &&
            (identical(other.kidsFilter, kidsFilter) ||
                const DeepCollectionEquality()
                    .equals(other.kidsFilter, kidsFilter)) &&
            (identical(other.disableFilter, disableFilter) ||
                const DeepCollectionEquality()
                    .equals(other.disableFilter, disableFilter)) &&
            (identical(other.byDepartment, byDepartment) ||
                const DeepCollectionEquality()
                    .equals(other.byDepartment, byDepartment)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.citdepart, citdepart) ||
                const DeepCollectionEquality()
                    .equals(other.citdepart, citdepart)) &&
            (identical(other.touristE, touristE) ||
                const DeepCollectionEquality()
                    .equals(other.touristE, touristE)) &&
            (identical(other.namesInOrder, namesInOrder) ||
                const DeepCollectionEquality()
                    .equals(other.namesInOrder, namesInOrder)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(source) ^
      const DeepCollectionEquality().hash(destination) ^
      const DeepCollectionEquality().hash(accepted) ^
      const DeepCollectionEquality().hash(places) ^
      const DeepCollectionEquality().hash(guide) ^
      const DeepCollectionEquality().hash(kidsFilter) ^
      const DeepCollectionEquality().hash(disableFilter) ^
      const DeepCollectionEquality().hash(byDepartment) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(citdepart) ^
      const DeepCollectionEquality().hash(touristE) ^
      const DeepCollectionEquality().hash(namesInOrder);

  @override
  _$_Plan copyWith({
    Object id = freezed,
    Object active = freezed,
    Object name = freezed,
    Object source = freezed,
    Object destination = freezed,
    Object accepted = freezed,
    Object places = freezed,
    Object guide = freezed,
    Object kidsFilter = freezed,
    Object disableFilter = freezed,
    Object byDepartment = freezed,
    Object latitude = freezed,
    Object longitude = freezed,
    Object citdepart = freezed,
    Object touristE = freezed,
    Object namesInOrder = freezed,
  }) {
    return _$_Plan(
      id: id == freezed ? this.id : id as String,
      active: active == freezed ? this.active : active as bool,
      name: name == freezed ? this.name : name as String,
      source: source == freezed ? this.source : source as String,
      destination:
          destination == freezed ? this.destination : destination as String,
      accepted: accepted == freezed ? this.accepted : accepted as bool,
      places: places == freezed ? this.places : places as List<String>,
      guide: guide == freezed ? this.guide : guide as String,
      kidsFilter: kidsFilter == freezed ? this.kidsFilter : kidsFilter as bool,
      disableFilter:
          disableFilter == freezed ? this.disableFilter : disableFilter as bool,
      byDepartment:
          byDepartment == freezed ? this.byDepartment : byDepartment as bool,
      latitude: latitude == freezed ? this.latitude : latitude as double,
      longitude: longitude == freezed ? this.longitude : longitude as double,
      citdepart:
          citdepart == freezed ? this.citdepart : citdepart as List<String>,
      touristE: touristE == freezed ? this.touristE : touristE as String,
      namesInOrder: namesInOrder == freezed
          ? this.namesInOrder
          : namesInOrder as List<String>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PlanToJson(this);
  }
}

abstract class _Plan implements Plan {
  const factory _Plan(
      {String id,
      @required bool active,
      @required String name,
      String source,
      String destination,
      bool accepted,
      @required List<String> places,
      String guide,
      bool kidsFilter,
      bool disableFilter,
      bool byDepartment,
      double latitude,
      double longitude,
      List<String> citdepart,
      String touristE,
      List<String> namesInOrder}) = _$_Plan;

  factory _Plan.fromJson(Map<String, dynamic> json) = _$_Plan.fromJson;

  @override
  String get id;
  @override
  bool get active;
  @override
  String get name;
  @override
  String get source;
  @override
  String get destination;
  @override
  bool get accepted;
  @override
  List<String> get places;
  @override
  String get guide;
  @override
  bool get kidsFilter;
  @override
  bool get disableFilter;
  @override
  bool get byDepartment;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  List<String> get citdepart;
  @override
  String get touristE;
  @override
  List<String> get namesInOrder;

  @override
  _Plan copyWith(
      {String id,
      bool active,
      String name,
      String source,
      String destination,
      bool accepted,
      List<String> places,
      String guide,
      bool kidsFilter,
      bool disableFilter,
      bool byDepartment,
      double latitude,
      double longitude,
      List<String> citdepart,
      String touristE,
      List<String> namesInOrder});
}
