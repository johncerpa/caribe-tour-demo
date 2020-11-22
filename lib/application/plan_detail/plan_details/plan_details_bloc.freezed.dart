// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'plan_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$PlanDetailsEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result savingPlaceVisited(String planId, String placeVisited),
    @required Result removePlaceVisited(String planId, String placeVisited),
    @required Result getPlacesVisited(String planId),
    @required Result getPlacesVisitedStream(String planId),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result savingPlaceVisited(String planId, String placeVisited),
    Result removePlaceVisited(String planId, String placeVisited),
    Result getPlacesVisited(String planId),
    Result getPlacesVisitedStream(String planId),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result savingPlaceVisited(_SavingPlanVisited value),
    @required Result removePlaceVisited(_RemovePlaceVisited value),
    @required Result getPlacesVisited(_GetPlacesVisited value),
    @required Result getPlacesVisitedStream(_GetPlacesVisitedStream value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result savingPlaceVisited(_SavingPlanVisited value),
    Result removePlaceVisited(_RemovePlaceVisited value),
    Result getPlacesVisited(_GetPlacesVisited value),
    Result getPlacesVisitedStream(_GetPlacesVisitedStream value),
    @required Result orElse(),
  });
}

class _$PlanDetailsEventTearOff {
  const _$PlanDetailsEventTearOff();

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

  _GetPlacesVisitedStream getPlacesVisitedStream(String planId) {
    return _GetPlacesVisitedStream(
      planId,
    );
  }
}

const $PlanDetailsEvent = _$PlanDetailsEventTearOff();

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'PlanDetailsEvent.started()';
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
    @required Result getPlacesVisitedStream(String planId),
  }) {
    assert(started != null);
    assert(savingPlaceVisited != null);
    assert(removePlaceVisited != null);
    assert(getPlacesVisited != null);
    assert(getPlacesVisitedStream != null);
    return started();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result savingPlaceVisited(String planId, String placeVisited),
    Result removePlaceVisited(String planId, String placeVisited),
    Result getPlacesVisited(String planId),
    Result getPlacesVisitedStream(String planId),
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
    @required Result getPlacesVisitedStream(_GetPlacesVisitedStream value),
  }) {
    assert(started != null);
    assert(savingPlaceVisited != null);
    assert(removePlaceVisited != null);
    assert(getPlacesVisited != null);
    assert(getPlacesVisitedStream != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result savingPlaceVisited(_SavingPlanVisited value),
    Result removePlaceVisited(_RemovePlaceVisited value),
    Result getPlacesVisited(_GetPlacesVisited value),
    Result getPlacesVisitedStream(_GetPlacesVisitedStream value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements PlanDetailsEvent {
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
    return 'PlanDetailsEvent.savingPlaceVisited(planId: $planId, placeVisited: $placeVisited)';
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
    @required Result getPlacesVisitedStream(String planId),
  }) {
    assert(started != null);
    assert(savingPlaceVisited != null);
    assert(removePlaceVisited != null);
    assert(getPlacesVisited != null);
    assert(getPlacesVisitedStream != null);
    return savingPlaceVisited(planId, placeVisited);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result savingPlaceVisited(String planId, String placeVisited),
    Result removePlaceVisited(String planId, String placeVisited),
    Result getPlacesVisited(String planId),
    Result getPlacesVisitedStream(String planId),
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
    @required Result getPlacesVisitedStream(_GetPlacesVisitedStream value),
  }) {
    assert(started != null);
    assert(savingPlaceVisited != null);
    assert(removePlaceVisited != null);
    assert(getPlacesVisited != null);
    assert(getPlacesVisitedStream != null);
    return savingPlaceVisited(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result savingPlaceVisited(_SavingPlanVisited value),
    Result removePlaceVisited(_RemovePlaceVisited value),
    Result getPlacesVisited(_GetPlacesVisited value),
    Result getPlacesVisitedStream(_GetPlacesVisitedStream value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (savingPlaceVisited != null) {
      return savingPlaceVisited(this);
    }
    return orElse();
  }
}

abstract class _SavingPlanVisited implements PlanDetailsEvent {
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
    return 'PlanDetailsEvent.removePlaceVisited(planId: $planId, placeVisited: $placeVisited)';
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
    @required Result getPlacesVisitedStream(String planId),
  }) {
    assert(started != null);
    assert(savingPlaceVisited != null);
    assert(removePlaceVisited != null);
    assert(getPlacesVisited != null);
    assert(getPlacesVisitedStream != null);
    return removePlaceVisited(planId, placeVisited);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result savingPlaceVisited(String planId, String placeVisited),
    Result removePlaceVisited(String planId, String placeVisited),
    Result getPlacesVisited(String planId),
    Result getPlacesVisitedStream(String planId),
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
    @required Result getPlacesVisitedStream(_GetPlacesVisitedStream value),
  }) {
    assert(started != null);
    assert(savingPlaceVisited != null);
    assert(removePlaceVisited != null);
    assert(getPlacesVisited != null);
    assert(getPlacesVisitedStream != null);
    return removePlaceVisited(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result savingPlaceVisited(_SavingPlanVisited value),
    Result removePlaceVisited(_RemovePlaceVisited value),
    Result getPlacesVisited(_GetPlacesVisited value),
    Result getPlacesVisitedStream(_GetPlacesVisitedStream value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (removePlaceVisited != null) {
      return removePlaceVisited(this);
    }
    return orElse();
  }
}

abstract class _RemovePlaceVisited implements PlanDetailsEvent {
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
    return 'PlanDetailsEvent.getPlacesVisited(planId: $planId)';
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
    @required Result getPlacesVisitedStream(String planId),
  }) {
    assert(started != null);
    assert(savingPlaceVisited != null);
    assert(removePlaceVisited != null);
    assert(getPlacesVisited != null);
    assert(getPlacesVisitedStream != null);
    return getPlacesVisited(planId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result savingPlaceVisited(String planId, String placeVisited),
    Result removePlaceVisited(String planId, String placeVisited),
    Result getPlacesVisited(String planId),
    Result getPlacesVisitedStream(String planId),
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
    @required Result getPlacesVisitedStream(_GetPlacesVisitedStream value),
  }) {
    assert(started != null);
    assert(savingPlaceVisited != null);
    assert(removePlaceVisited != null);
    assert(getPlacesVisited != null);
    assert(getPlacesVisitedStream != null);
    return getPlacesVisited(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result savingPlaceVisited(_SavingPlanVisited value),
    Result removePlaceVisited(_RemovePlaceVisited value),
    Result getPlacesVisited(_GetPlacesVisited value),
    Result getPlacesVisitedStream(_GetPlacesVisitedStream value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPlacesVisited != null) {
      return getPlacesVisited(this);
    }
    return orElse();
  }
}

abstract class _GetPlacesVisited implements PlanDetailsEvent {
  const factory _GetPlacesVisited(String planId) = _$_GetPlacesVisited;

  String get planId;

  _GetPlacesVisited copyWith({String planId});
}

class _$_GetPlacesVisitedStream implements _GetPlacesVisitedStream {
  const _$_GetPlacesVisitedStream(this.planId) : assert(planId != null);

  @override
  final String planId;

  @override
  String toString() {
    return 'PlanDetailsEvent.getPlacesVisitedStream(planId: $planId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetPlacesVisitedStream &&
            (identical(other.planId, planId) ||
                const DeepCollectionEquality().equals(other.planId, planId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(planId);

  @override
  _$_GetPlacesVisitedStream copyWith({
    Object planId = freezed,
  }) {
    return _$_GetPlacesVisitedStream(
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
    @required Result getPlacesVisitedStream(String planId),
  }) {
    assert(started != null);
    assert(savingPlaceVisited != null);
    assert(removePlaceVisited != null);
    assert(getPlacesVisited != null);
    assert(getPlacesVisitedStream != null);
    return getPlacesVisitedStream(planId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result savingPlaceVisited(String planId, String placeVisited),
    Result removePlaceVisited(String planId, String placeVisited),
    Result getPlacesVisited(String planId),
    Result getPlacesVisitedStream(String planId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPlacesVisitedStream != null) {
      return getPlacesVisitedStream(planId);
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
    @required Result getPlacesVisitedStream(_GetPlacesVisitedStream value),
  }) {
    assert(started != null);
    assert(savingPlaceVisited != null);
    assert(removePlaceVisited != null);
    assert(getPlacesVisited != null);
    assert(getPlacesVisitedStream != null);
    return getPlacesVisitedStream(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result savingPlaceVisited(_SavingPlanVisited value),
    Result removePlaceVisited(_RemovePlaceVisited value),
    Result getPlacesVisited(_GetPlacesVisited value),
    Result getPlacesVisitedStream(_GetPlacesVisitedStream value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPlacesVisitedStream != null) {
      return getPlacesVisitedStream(this);
    }
    return orElse();
  }
}

abstract class _GetPlacesVisitedStream implements PlanDetailsEvent {
  const factory _GetPlacesVisitedStream(String planId) =
      _$_GetPlacesVisitedStream;

  String get planId;

  _GetPlacesVisitedStream copyWith({String planId});
}

mixin _$PlanDetailsState {
  Option<List<Place>> get placesVisited;
  Option<Stream<QuerySnapshot>> get placesVisitedStream;

  PlanDetailsState copyWith(
      {Option<List<Place>> placesVisited,
      Option<Stream<QuerySnapshot>> placesVisitedStream});
}

class _$PlanDetailsStateTearOff {
  const _$PlanDetailsStateTearOff();

  _PlanDetailsState call(
      {@required Option<List<Place>> placesVisited,
      @required Option<Stream<QuerySnapshot>> placesVisitedStream}) {
    return _PlanDetailsState(
      placesVisited: placesVisited,
      placesVisitedStream: placesVisitedStream,
    );
  }
}

const $PlanDetailsState = _$PlanDetailsStateTearOff();

class _$_PlanDetailsState implements _PlanDetailsState {
  const _$_PlanDetailsState(
      {@required this.placesVisited, @required this.placesVisitedStream})
      : assert(placesVisited != null),
        assert(placesVisitedStream != null);

  @override
  final Option<List<Place>> placesVisited;
  @override
  final Option<Stream<QuerySnapshot>> placesVisitedStream;

  @override
  String toString() {
    return 'PlanDetailsState(placesVisited: $placesVisited, placesVisitedStream: $placesVisitedStream)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PlanDetailsState &&
            (identical(other.placesVisited, placesVisited) ||
                const DeepCollectionEquality()
                    .equals(other.placesVisited, placesVisited)) &&
            (identical(other.placesVisitedStream, placesVisitedStream) ||
                const DeepCollectionEquality()
                    .equals(other.placesVisitedStream, placesVisitedStream)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(placesVisited) ^
      const DeepCollectionEquality().hash(placesVisitedStream);

  @override
  _$_PlanDetailsState copyWith({
    Object placesVisited = freezed,
    Object placesVisitedStream = freezed,
  }) {
    return _$_PlanDetailsState(
      placesVisited: placesVisited == freezed
          ? this.placesVisited
          : placesVisited as Option<List<Place>>,
      placesVisitedStream: placesVisitedStream == freezed
          ? this.placesVisitedStream
          : placesVisitedStream as Option<Stream<QuerySnapshot>>,
    );
  }
}

abstract class _PlanDetailsState implements PlanDetailsState {
  const factory _PlanDetailsState(
          {@required Option<List<Place>> placesVisited,
          @required Option<Stream<QuerySnapshot>> placesVisitedStream}) =
      _$_PlanDetailsState;

  @override
  Option<List<Place>> get placesVisited;
  @override
  Option<Stream<QuerySnapshot>> get placesVisitedStream;

  @override
  _PlanDetailsState copyWith(
      {Option<List<Place>> placesVisited,
      Option<Stream<QuerySnapshot>> placesVisitedStream});
}
