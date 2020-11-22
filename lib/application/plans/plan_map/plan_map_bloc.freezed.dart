// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'plan_map_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$PlanMapEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result savingPlaceVisited(String planId, String placeVisited),
    @required Result removePlaceVisited(String planId, String placeVisited),
    @required Result getPlacesVisited(String planId),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result savingPlaceVisited(String planId, String placeVisited),
    Result removePlaceVisited(String planId, String placeVisited),
    Result getPlacesVisited(String planId),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result savingPlaceVisited(_SavingPlanVisited value),
    @required Result removePlaceVisited(_RemovePlaceVisited value),
    @required Result getPlacesVisited(_GetPlacesVisited value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result savingPlaceVisited(_SavingPlanVisited value),
    Result removePlaceVisited(_RemovePlaceVisited value),
    Result getPlacesVisited(_GetPlacesVisited value),
    @required Result orElse(),
  });
}

class _$PlanMapEventTearOff {
  const _$PlanMapEventTearOff();

  _Started started() {
    return const _Started();
  }

  _SavingPlanVisited savingPlaceVisited(String planId, String placeVisited) {
    return _SavingPlanVisited(
      planId,
      placeVisited,
    );
  }

  _RemovePlaceVisited removePlaceVisited(String planId, String placeVisited) {
    return _RemovePlaceVisited(
      planId,
      placeVisited,
    );
  }

  _GetPlacesVisited getPlacesVisited(String planId) {
    return _GetPlacesVisited(
      planId,
    );
  }
}

const $PlanMapEvent = _$PlanMapEventTearOff();

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'PlanMapEvent.started()';
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
    @required Result savingPlaceVisited(String planId, String placeVisited),
    @required Result removePlaceVisited(String planId, String placeVisited),
    @required Result getPlacesVisited(String planId),
  }) {
    assert(started != null);
    assert(savingPlaceVisited != null);
    assert(removePlaceVisited != null);
    assert(getPlacesVisited != null);
    return started();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result savingPlaceVisited(String planId, String placeVisited),
    Result removePlaceVisited(String planId, String placeVisited),
    Result getPlacesVisited(String planId),
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
    @required Result savingPlaceVisited(_SavingPlanVisited value),
    @required Result removePlaceVisited(_RemovePlaceVisited value),
    @required Result getPlacesVisited(_GetPlacesVisited value),
  }) {
    assert(started != null);
    assert(savingPlaceVisited != null);
    assert(removePlaceVisited != null);
    assert(getPlacesVisited != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result savingPlaceVisited(_SavingPlanVisited value),
    Result removePlaceVisited(_RemovePlaceVisited value),
    Result getPlacesVisited(_GetPlacesVisited value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements PlanMapEvent {
  const factory _Started() = _$_Started;
}

class _$_SavingPlanVisited implements _SavingPlanVisited {
  const _$_SavingPlanVisited(this.planId, this.placeVisited)
      : assert(planId != null),
        assert(placeVisited != null);

  @override
  final String planId;
  @override
  final String placeVisited;

  @override
  String toString() {
    return 'PlanMapEvent.savingPlaceVisited(planId: $planId, placeVisited: $placeVisited)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SavingPlanVisited &&
            (identical(other.planId, planId) ||
                const DeepCollectionEquality().equals(other.planId, planId)) &&
            (identical(other.placeVisited, placeVisited) ||
                const DeepCollectionEquality()
                    .equals(other.placeVisited, placeVisited)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(planId) ^
      const DeepCollectionEquality().hash(placeVisited);

  @override
  _$_SavingPlanVisited copyWith({
    Object planId = freezed,
    Object placeVisited = freezed,
  }) {
    return _$_SavingPlanVisited(
      planId == freezed ? this.planId : planId as String,
      placeVisited == freezed ? this.placeVisited : placeVisited as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result savingPlaceVisited(String planId, String placeVisited),
    @required Result removePlaceVisited(String planId, String placeVisited),
    @required Result getPlacesVisited(String planId),
  }) {
    assert(started != null);
    assert(savingPlaceVisited != null);
    assert(removePlaceVisited != null);
    assert(getPlacesVisited != null);
    return savingPlaceVisited(planId, placeVisited);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result savingPlaceVisited(String planId, String placeVisited),
    Result removePlaceVisited(String planId, String placeVisited),
    Result getPlacesVisited(String planId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (savingPlaceVisited != null) {
      return savingPlaceVisited(planId, placeVisited);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result savingPlaceVisited(_SavingPlanVisited value),
    @required Result removePlaceVisited(_RemovePlaceVisited value),
    @required Result getPlacesVisited(_GetPlacesVisited value),
  }) {
    assert(started != null);
    assert(savingPlaceVisited != null);
    assert(removePlaceVisited != null);
    assert(getPlacesVisited != null);
    return savingPlaceVisited(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result savingPlaceVisited(_SavingPlanVisited value),
    Result removePlaceVisited(_RemovePlaceVisited value),
    Result getPlacesVisited(_GetPlacesVisited value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (savingPlaceVisited != null) {
      return savingPlaceVisited(this);
    }
    return orElse();
  }
}

abstract class _SavingPlanVisited implements PlanMapEvent {
  const factory _SavingPlanVisited(String planId, String placeVisited) =
      _$_SavingPlanVisited;

  String get planId;
  String get placeVisited;

  _SavingPlanVisited copyWith({String planId, String placeVisited});
}

class _$_RemovePlaceVisited implements _RemovePlaceVisited {
  const _$_RemovePlaceVisited(this.planId, this.placeVisited)
      : assert(planId != null),
        assert(placeVisited != null);

  @override
  final String planId;
  @override
  final String placeVisited;

  @override
  String toString() {
    return 'PlanMapEvent.removePlaceVisited(planId: $planId, placeVisited: $placeVisited)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RemovePlaceVisited &&
            (identical(other.planId, planId) ||
                const DeepCollectionEquality().equals(other.planId, planId)) &&
            (identical(other.placeVisited, placeVisited) ||
                const DeepCollectionEquality()
                    .equals(other.placeVisited, placeVisited)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(planId) ^
      const DeepCollectionEquality().hash(placeVisited);

  @override
  _$_RemovePlaceVisited copyWith({
    Object planId = freezed,
    Object placeVisited = freezed,
  }) {
    return _$_RemovePlaceVisited(
      planId == freezed ? this.planId : planId as String,
      placeVisited == freezed ? this.placeVisited : placeVisited as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result savingPlaceVisited(String planId, String placeVisited),
    @required Result removePlaceVisited(String planId, String placeVisited),
    @required Result getPlacesVisited(String planId),
  }) {
    assert(started != null);
    assert(savingPlaceVisited != null);
    assert(removePlaceVisited != null);
    assert(getPlacesVisited != null);
    return removePlaceVisited(planId, placeVisited);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result savingPlaceVisited(String planId, String placeVisited),
    Result removePlaceVisited(String planId, String placeVisited),
    Result getPlacesVisited(String planId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (removePlaceVisited != null) {
      return removePlaceVisited(planId, placeVisited);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result savingPlaceVisited(_SavingPlanVisited value),
    @required Result removePlaceVisited(_RemovePlaceVisited value),
    @required Result getPlacesVisited(_GetPlacesVisited value),
  }) {
    assert(started != null);
    assert(savingPlaceVisited != null);
    assert(removePlaceVisited != null);
    assert(getPlacesVisited != null);
    return removePlaceVisited(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result savingPlaceVisited(_SavingPlanVisited value),
    Result removePlaceVisited(_RemovePlaceVisited value),
    Result getPlacesVisited(_GetPlacesVisited value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (removePlaceVisited != null) {
      return removePlaceVisited(this);
    }
    return orElse();
  }
}

abstract class _RemovePlaceVisited implements PlanMapEvent {
  const factory _RemovePlaceVisited(String planId, String placeVisited) =
      _$_RemovePlaceVisited;

  String get planId;
  String get placeVisited;

  _RemovePlaceVisited copyWith({String planId, String placeVisited});
}

class _$_GetPlacesVisited implements _GetPlacesVisited {
  const _$_GetPlacesVisited(this.planId) : assert(planId != null);

  @override
  final String planId;

  @override
  String toString() {
    return 'PlanMapEvent.getPlacesVisited(planId: $planId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetPlacesVisited &&
            (identical(other.planId, planId) ||
                const DeepCollectionEquality().equals(other.planId, planId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(planId);

  @override
  _$_GetPlacesVisited copyWith({
    Object planId = freezed,
  }) {
    return _$_GetPlacesVisited(
      planId == freezed ? this.planId : planId as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result savingPlaceVisited(String planId, String placeVisited),
    @required Result removePlaceVisited(String planId, String placeVisited),
    @required Result getPlacesVisited(String planId),
  }) {
    assert(started != null);
    assert(savingPlaceVisited != null);
    assert(removePlaceVisited != null);
    assert(getPlacesVisited != null);
    return getPlacesVisited(planId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result savingPlaceVisited(String planId, String placeVisited),
    Result removePlaceVisited(String planId, String placeVisited),
    Result getPlacesVisited(String planId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPlacesVisited != null) {
      return getPlacesVisited(planId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result savingPlaceVisited(_SavingPlanVisited value),
    @required Result removePlaceVisited(_RemovePlaceVisited value),
    @required Result getPlacesVisited(_GetPlacesVisited value),
  }) {
    assert(started != null);
    assert(savingPlaceVisited != null);
    assert(removePlaceVisited != null);
    assert(getPlacesVisited != null);
    return getPlacesVisited(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result savingPlaceVisited(_SavingPlanVisited value),
    Result removePlaceVisited(_RemovePlaceVisited value),
    Result getPlacesVisited(_GetPlacesVisited value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPlacesVisited != null) {
      return getPlacesVisited(this);
    }
    return orElse();
  }
}

abstract class _GetPlacesVisited implements PlanMapEvent {
  const factory _GetPlacesVisited(String planId) = _$_GetPlacesVisited;

  String get planId;

  _GetPlacesVisited copyWith({String planId});
}

mixin _$PlanMapState {
  Option<List<Place>> get placesVisited;

  PlanMapState copyWith({Option<List<Place>> placesVisited});
}

class _$PlanMapStateTearOff {
  const _$PlanMapStateTearOff();

  _PlanMapState call({@required Option<List<Place>> placesVisited}) {
    return _PlanMapState(
      placesVisited: placesVisited,
    );
  }
}

const $PlanMapState = _$PlanMapStateTearOff();

class _$_PlanMapState implements _PlanMapState {
  const _$_PlanMapState({@required this.placesVisited})
      : assert(placesVisited != null);

  @override
  final Option<List<Place>> placesVisited;

  @override
  String toString() {
    return 'PlanMapState(placesVisited: $placesVisited)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PlanMapState &&
            (identical(other.placesVisited, placesVisited) ||
                const DeepCollectionEquality()
                    .equals(other.placesVisited, placesVisited)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(placesVisited);

  @override
  _$_PlanMapState copyWith({
    Object placesVisited = freezed,
  }) {
    return _$_PlanMapState(
      placesVisited: placesVisited == freezed
          ? this.placesVisited
          : placesVisited as Option<List<Place>>,
    );
  }
}

abstract class _PlanMapState implements PlanMapState {
  const factory _PlanMapState({@required Option<List<Place>> placesVisited}) =
      _$_PlanMapState;

  @override
  Option<List<Place>> get placesVisited;

  @override
  _PlanMapState copyWith({Option<List<Place>> placesVisited});
}
