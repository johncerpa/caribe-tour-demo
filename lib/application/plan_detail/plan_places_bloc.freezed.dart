// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'plan_places_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$PlanPlacesEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required
        Result planPlaces(List<String> places, double locationLatitude,
            double locationLongitude),
    @required Result acceptPlan(String id, bool update),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result planPlaces(
        List<String> places, double locationLatitude, double locationLongitude),
    Result acceptPlan(String id, bool update),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result planPlaces(_PlanPlaces value),
    @required Result acceptPlan(_AcceptPlan value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result planPlaces(_PlanPlaces value),
    Result acceptPlan(_AcceptPlan value),
    @required Result orElse(),
  });
}

class _$PlanPlacesEventTearOff {
  const _$PlanPlacesEventTearOff();

  _Started started() {
    return const _Started();
  }

  _PlanPlaces planPlaces(
      List<String> places, double locationLatitude, double locationLongitude) {
    return _PlanPlaces(
      places,
      locationLatitude,
      locationLongitude,
    );
  }

  _AcceptPlan acceptPlan(String id, bool update) {
    return _AcceptPlan(
      id,
      update,
    );
  }
}

const $PlanPlacesEvent = _$PlanPlacesEventTearOff();

class _$_Started with DiagnosticableTreeMixin implements _Started {
  const _$_Started();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlanPlacesEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'PlanPlacesEvent.started'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required
        Result planPlaces(List<String> places, double locationLatitude,
            double locationLongitude),
    @required Result acceptPlan(String id, bool update),
  }) {
    assert(started != null);
    assert(planPlaces != null);
    assert(acceptPlan != null);
    return started();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result planPlaces(
        List<String> places, double locationLatitude, double locationLongitude),
    Result acceptPlan(String id, bool update),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result planPlaces(_PlanPlaces value),
    @required Result acceptPlan(_AcceptPlan value),
  }) {
    assert(started != null);
    assert(planPlaces != null);
    assert(acceptPlan != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result planPlaces(_PlanPlaces value),
    Result acceptPlan(_AcceptPlan value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements PlanPlacesEvent {
  const factory _Started() = _$_Started;
}

class _$_PlanPlaces with DiagnosticableTreeMixin implements _PlanPlaces {
  const _$_PlanPlaces(
      this.places, this.locationLatitude, this.locationLongitude)
      : assert(places != null),
        assert(locationLatitude != null),
        assert(locationLongitude != null);

  @override
  final List<String> places;
  @override
  final double locationLatitude;
  @override
  final double locationLongitude;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlanPlacesEvent.planPlaces(places: $places, locationLatitude: $locationLatitude, locationLongitude: $locationLongitude)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlanPlacesEvent.planPlaces'))
      ..add(DiagnosticsProperty('places', places))
      ..add(DiagnosticsProperty('locationLatitude', locationLatitude))
      ..add(DiagnosticsProperty('locationLongitude', locationLongitude));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PlanPlaces &&
            (identical(other.places, places) ||
                const DeepCollectionEquality().equals(other.places, places)) &&
            (identical(other.locationLatitude, locationLatitude) ||
                const DeepCollectionEquality()
                    .equals(other.locationLatitude, locationLatitude)) &&
            (identical(other.locationLongitude, locationLongitude) ||
                const DeepCollectionEquality()
                    .equals(other.locationLongitude, locationLongitude)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(places) ^
      const DeepCollectionEquality().hash(locationLatitude) ^
      const DeepCollectionEquality().hash(locationLongitude);

  @override
  _$_PlanPlaces copyWith({
    Object places = freezed,
    Object locationLatitude = freezed,
    Object locationLongitude = freezed,
  }) {
    return _$_PlanPlaces(
      places == freezed ? this.places : places as List<String>,
      locationLatitude == freezed
          ? this.locationLatitude
          : locationLatitude as double,
      locationLongitude == freezed
          ? this.locationLongitude
          : locationLongitude as double,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required
        Result planPlaces(List<String> places, double locationLatitude,
            double locationLongitude),
    @required Result acceptPlan(String id, bool update),
  }) {
    assert(started != null);
    assert(planPlaces != null);
    assert(acceptPlan != null);
    return planPlaces(places, locationLatitude, locationLongitude);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result planPlaces(
        List<String> places, double locationLatitude, double locationLongitude),
    Result acceptPlan(String id, bool update),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (planPlaces != null) {
      return planPlaces(places, locationLatitude, locationLongitude);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result planPlaces(_PlanPlaces value),
    @required Result acceptPlan(_AcceptPlan value),
  }) {
    assert(started != null);
    assert(planPlaces != null);
    assert(acceptPlan != null);
    return planPlaces(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result planPlaces(_PlanPlaces value),
    Result acceptPlan(_AcceptPlan value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (planPlaces != null) {
      return planPlaces(this);
    }
    return orElse();
  }
}

abstract class _PlanPlaces implements PlanPlacesEvent {
  const factory _PlanPlaces(List<String> places, double locationLatitude,
      double locationLongitude) = _$_PlanPlaces;

  List<String> get places;
  double get locationLatitude;
  double get locationLongitude;

  _PlanPlaces copyWith(
      {List<String> places, double locationLatitude, double locationLongitude});
}

class _$_AcceptPlan with DiagnosticableTreeMixin implements _AcceptPlan {
  const _$_AcceptPlan(this.id, this.update)
      : assert(id != null),
        assert(update != null);

  @override
  final String id;
  @override
  final bool update;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlanPlacesEvent.acceptPlan(id: $id, update: $update)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlanPlacesEvent.acceptPlan'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('update', update));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AcceptPlan &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.update, update) ||
                const DeepCollectionEquality().equals(other.update, update)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(update);

  @override
  _$_AcceptPlan copyWith({
    Object id = freezed,
    Object update = freezed,
  }) {
    return _$_AcceptPlan(
      id == freezed ? this.id : id as String,
      update == freezed ? this.update : update as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required
        Result planPlaces(List<String> places, double locationLatitude,
            double locationLongitude),
    @required Result acceptPlan(String id, bool update),
  }) {
    assert(started != null);
    assert(planPlaces != null);
    assert(acceptPlan != null);
    return acceptPlan(id, update);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result planPlaces(
        List<String> places, double locationLatitude, double locationLongitude),
    Result acceptPlan(String id, bool update),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (acceptPlan != null) {
      return acceptPlan(id, update);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result planPlaces(_PlanPlaces value),
    @required Result acceptPlan(_AcceptPlan value),
  }) {
    assert(started != null);
    assert(planPlaces != null);
    assert(acceptPlan != null);
    return acceptPlan(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result planPlaces(_PlanPlaces value),
    Result acceptPlan(_AcceptPlan value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (acceptPlan != null) {
      return acceptPlan(this);
    }
    return orElse();
  }
}

abstract class _AcceptPlan implements PlanPlacesEvent {
  const factory _AcceptPlan(String id, bool update) = _$_AcceptPlan;

  String get id;
  bool get update;

  _AcceptPlan copyWith({String id, bool update});
}

mixin _$PlanPlacesState {
  Option<List<Place>> get places;

  PlanPlacesState copyWith({Option<List<Place>> places});
}

class _$PlanPlacesStateTearOff {
  const _$PlanPlacesStateTearOff();

  _PlanPlacesState call({@required Option<List<Place>> places}) {
    return _PlanPlacesState(
      places: places,
    );
  }
}

const $PlanPlacesState = _$PlanPlacesStateTearOff();

class _$_PlanPlacesState
    with DiagnosticableTreeMixin
    implements _PlanPlacesState {
  _$_PlanPlacesState({@required this.places}) : assert(places != null);

  @override
  final Option<List<Place>> places;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlanPlacesState(places: $places)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlanPlacesState'))
      ..add(DiagnosticsProperty('places', places));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PlanPlacesState &&
            (identical(other.places, places) ||
                const DeepCollectionEquality().equals(other.places, places)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(places);

  @override
  _$_PlanPlacesState copyWith({
    Object places = freezed,
  }) {
    return _$_PlanPlacesState(
      places: places == freezed ? this.places : places as Option<List<Place>>,
    );
  }
}

abstract class _PlanPlacesState implements PlanPlacesState {
  factory _PlanPlacesState({@required Option<List<Place>> places}) =
      _$_PlanPlacesState;

  @override
  Option<List<Place>> get places;

  @override
  _PlanPlacesState copyWith({Option<List<Place>> places});
}
