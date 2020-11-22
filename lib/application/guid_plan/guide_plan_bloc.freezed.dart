// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'guide_plan_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$GuidePlanEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result getTouristandPlaces(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result getTouristandPlaces(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result getTouristandPlaces(_GetTouristandPlaces value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result getTouristandPlaces(_GetTouristandPlaces value),
    @required Result orElse(),
  });
}

class _$GuidePlanEventTearOff {
  const _$GuidePlanEventTearOff();

  _Started started() {
    return const _Started();
  }

  _GetTouristandPlaces getTouristandPlaces() {
    return const _GetTouristandPlaces();
  }
}

const $GuidePlanEvent = _$GuidePlanEventTearOff();

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'GuidePlanEvent.started()';
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
    @required Result getTouristandPlaces(),
  }) {
    assert(started != null);
    assert(getTouristandPlaces != null);
    return started();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result getTouristandPlaces(),
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
    @required Result getTouristandPlaces(_GetTouristandPlaces value),
  }) {
    assert(started != null);
    assert(getTouristandPlaces != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result getTouristandPlaces(_GetTouristandPlaces value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements GuidePlanEvent {
  const factory _Started() = _$_Started;
}

class _$_GetTouristandPlaces implements _GetTouristandPlaces {
  const _$_GetTouristandPlaces();

  @override
  String toString() {
    return 'GuidePlanEvent.getTouristandPlaces()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetTouristandPlaces);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result getTouristandPlaces(),
  }) {
    assert(started != null);
    assert(getTouristandPlaces != null);
    return getTouristandPlaces();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result getTouristandPlaces(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getTouristandPlaces != null) {
      return getTouristandPlaces();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result getTouristandPlaces(_GetTouristandPlaces value),
  }) {
    assert(started != null);
    assert(getTouristandPlaces != null);
    return getTouristandPlaces(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result getTouristandPlaces(_GetTouristandPlaces value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getTouristandPlaces != null) {
      return getTouristandPlaces(this);
    }
    return orElse();
  }
}

abstract class _GetTouristandPlaces implements GuidePlanEvent {
  const factory _GetTouristandPlaces() = _$_GetTouristandPlaces;
}

mixin _$GuidePlanState {
  Option<List<LocalDomainUser>> get tourist;
  Option<List<DeptAndCities>> get depanCities;

  GuidePlanState copyWith(
      {Option<List<LocalDomainUser>> tourist,
      Option<List<DeptAndCities>> depanCities});
}

class _$GuidePlanStateTearOff {
  const _$GuidePlanStateTearOff();

  _GuidePlanState call(
      {@required Option<List<LocalDomainUser>> tourist,
      @required Option<List<DeptAndCities>> depanCities}) {
    return _GuidePlanState(
      tourist: tourist,
      depanCities: depanCities,
    );
  }
}

const $GuidePlanState = _$GuidePlanStateTearOff();

class _$_GuidePlanState implements _GuidePlanState {
  _$_GuidePlanState({@required this.tourist, @required this.depanCities})
      : assert(tourist != null),
        assert(depanCities != null);

  @override
  final Option<List<LocalDomainUser>> tourist;
  @override
  final Option<List<DeptAndCities>> depanCities;

  @override
  String toString() {
    return 'GuidePlanState(tourist: $tourist, depanCities: $depanCities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GuidePlanState &&
            (identical(other.tourist, tourist) ||
                const DeepCollectionEquality()
                    .equals(other.tourist, tourist)) &&
            (identical(other.depanCities, depanCities) ||
                const DeepCollectionEquality()
                    .equals(other.depanCities, depanCities)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tourist) ^
      const DeepCollectionEquality().hash(depanCities);

  @override
  _$_GuidePlanState copyWith({
    Object tourist = freezed,
    Object depanCities = freezed,
  }) {
    return _$_GuidePlanState(
      tourist: tourist == freezed
          ? this.tourist
          : tourist as Option<List<LocalDomainUser>>,
      depanCities: depanCities == freezed
          ? this.depanCities
          : depanCities as Option<List<DeptAndCities>>,
    );
  }
}

abstract class _GuidePlanState implements GuidePlanState {
  factory _GuidePlanState(
      {@required Option<List<LocalDomainUser>> tourist,
      @required Option<List<DeptAndCities>> depanCities}) = _$_GuidePlanState;

  @override
  Option<List<LocalDomainUser>> get tourist;
  @override
  Option<List<DeptAndCities>> get depanCities;

  @override
  _GuidePlanState copyWith(
      {Option<List<LocalDomainUser>> tourist,
      Option<List<DeptAndCities>> depanCities});
}
