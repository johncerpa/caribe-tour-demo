// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'searchplaces_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$SearchplacesEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result searchPlace(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result searchPlace(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result searchPlace(_SearchPlace value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result searchPlace(_SearchPlace value),
    @required Result orElse(),
  });
}

class _$SearchplacesEventTearOff {
  const _$SearchplacesEventTearOff();

  _Started started() {
    return const _Started();
  }

  _SearchPlace searchPlace() {
    return const _SearchPlace();
  }
}

const $SearchplacesEvent = _$SearchplacesEventTearOff();

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'SearchplacesEvent.started()';
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
    @required Result searchPlace(),
  }) {
    assert(started != null);
    assert(searchPlace != null);
    return started();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result searchPlace(),
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
    @required Result searchPlace(_SearchPlace value),
  }) {
    assert(started != null);
    assert(searchPlace != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result searchPlace(_SearchPlace value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SearchplacesEvent {
  const factory _Started() = _$_Started;
}

class _$_SearchPlace implements _SearchPlace {
  const _$_SearchPlace();

  @override
  String toString() {
    return 'SearchplacesEvent.searchPlace()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SearchPlace);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result searchPlace(),
  }) {
    assert(started != null);
    assert(searchPlace != null);
    return searchPlace();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result searchPlace(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (searchPlace != null) {
      return searchPlace();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result searchPlace(_SearchPlace value),
  }) {
    assert(started != null);
    assert(searchPlace != null);
    return searchPlace(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result searchPlace(_SearchPlace value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (searchPlace != null) {
      return searchPlace(this);
    }
    return orElse();
  }
}

abstract class _SearchPlace implements SearchplacesEvent {
  const factory _SearchPlace() = _$_SearchPlace;
}

mixin _$SearchplacesState {
  Option<List<Place>> get places;
  Option<List<DeptAndCities>> get depandCities;

  SearchplacesState copyWith(
      {Option<List<Place>> places, Option<List<DeptAndCities>> depandCities});
}

class _$SearchplacesStateTearOff {
  const _$SearchplacesStateTearOff();

  _SearchplacesState call(
      {@required Option<List<Place>> places,
      @required Option<List<DeptAndCities>> depandCities}) {
    return _SearchplacesState(
      places: places,
      depandCities: depandCities,
    );
  }
}

const $SearchplacesState = _$SearchplacesStateTearOff();

class _$_SearchplacesState implements _SearchplacesState {
  const _$_SearchplacesState(
      {@required this.places, @required this.depandCities})
      : assert(places != null),
        assert(depandCities != null);

  @override
  final Option<List<Place>> places;
  @override
  final Option<List<DeptAndCities>> depandCities;

  @override
  String toString() {
    return 'SearchplacesState(places: $places, depandCities: $depandCities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchplacesState &&
            (identical(other.places, places) ||
                const DeepCollectionEquality().equals(other.places, places)) &&
            (identical(other.depandCities, depandCities) ||
                const DeepCollectionEquality()
                    .equals(other.depandCities, depandCities)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(places) ^
      const DeepCollectionEquality().hash(depandCities);

  @override
  _$_SearchplacesState copyWith({
    Object places = freezed,
    Object depandCities = freezed,
  }) {
    return _$_SearchplacesState(
      places: places == freezed ? this.places : places as Option<List<Place>>,
      depandCities: depandCities == freezed
          ? this.depandCities
          : depandCities as Option<List<DeptAndCities>>,
    );
  }
}

abstract class _SearchplacesState implements SearchplacesState {
  const factory _SearchplacesState(
          {@required Option<List<Place>> places,
          @required Option<List<DeptAndCities>> depandCities}) =
      _$_SearchplacesState;

  @override
  Option<List<Place>> get places;
  @override
  Option<List<DeptAndCities>> get depandCities;

  @override
  _SearchplacesState copyWith(
      {Option<List<Place>> places, Option<List<DeptAndCities>> depandCities});
}
