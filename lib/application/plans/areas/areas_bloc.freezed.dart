// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'areas_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$AreasEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result loadingDepartmentsAndCities(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result loadingDepartmentsAndCities(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required
        Result loadingDepartmentsAndCities(LoadingDeparmentsAndCities value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result loadingDepartmentsAndCities(LoadingDeparmentsAndCities value),
    @required Result orElse(),
  });
}

class _$AreasEventTearOff {
  const _$AreasEventTearOff();

  _Started started() {
    return const _Started();
  }

  LoadingDeparmentsAndCities loadingDepartmentsAndCities() {
    return const LoadingDeparmentsAndCities();
  }
}

const $AreasEvent = _$AreasEventTearOff();

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'AreasEvent.started()';
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
    @required Result loadingDepartmentsAndCities(),
  }) {
    assert(started != null);
    assert(loadingDepartmentsAndCities != null);
    return started();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result loadingDepartmentsAndCities(),
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
    @required
        Result loadingDepartmentsAndCities(LoadingDeparmentsAndCities value),
  }) {
    assert(started != null);
    assert(loadingDepartmentsAndCities != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result loadingDepartmentsAndCities(LoadingDeparmentsAndCities value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements AreasEvent {
  const factory _Started() = _$_Started;
}

class _$LoadingDeparmentsAndCities implements LoadingDeparmentsAndCities {
  const _$LoadingDeparmentsAndCities();

  @override
  String toString() {
    return 'AreasEvent.loadingDepartmentsAndCities()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingDeparmentsAndCities);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result loadingDepartmentsAndCities(),
  }) {
    assert(started != null);
    assert(loadingDepartmentsAndCities != null);
    return loadingDepartmentsAndCities();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result loadingDepartmentsAndCities(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingDepartmentsAndCities != null) {
      return loadingDepartmentsAndCities();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required
        Result loadingDepartmentsAndCities(LoadingDeparmentsAndCities value),
  }) {
    assert(started != null);
    assert(loadingDepartmentsAndCities != null);
    return loadingDepartmentsAndCities(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result loadingDepartmentsAndCities(LoadingDeparmentsAndCities value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingDepartmentsAndCities != null) {
      return loadingDepartmentsAndCities(this);
    }
    return orElse();
  }
}

abstract class LoadingDeparmentsAndCities implements AreasEvent {
  const factory LoadingDeparmentsAndCities() = _$LoadingDeparmentsAndCities;
}

mixin _$AreasState {
  Option<List<DeptAndCities>> get deptsAndCities;

  AreasState copyWith({Option<List<DeptAndCities>> deptsAndCities});
}

class _$AreasStateTearOff {
  const _$AreasStateTearOff();

  _AreasState call({@required Option<List<DeptAndCities>> deptsAndCities}) {
    return _AreasState(
      deptsAndCities: deptsAndCities,
    );
  }
}

const $AreasState = _$AreasStateTearOff();

class _$_AreasState implements _AreasState {
  const _$_AreasState({@required this.deptsAndCities})
      : assert(deptsAndCities != null);

  @override
  final Option<List<DeptAndCities>> deptsAndCities;

  @override
  String toString() {
    return 'AreasState(deptsAndCities: $deptsAndCities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AreasState &&
            (identical(other.deptsAndCities, deptsAndCities) ||
                const DeepCollectionEquality()
                    .equals(other.deptsAndCities, deptsAndCities)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(deptsAndCities);

  @override
  _$_AreasState copyWith({
    Object deptsAndCities = freezed,
  }) {
    return _$_AreasState(
      deptsAndCities: deptsAndCities == freezed
          ? this.deptsAndCities
          : deptsAndCities as Option<List<DeptAndCities>>,
    );
  }
}

abstract class _AreasState implements AreasState {
  const factory _AreasState(
      {@required Option<List<DeptAndCities>> deptsAndCities}) = _$_AreasState;

  @override
  Option<List<DeptAndCities>> get deptsAndCities;

  @override
  _AreasState copyWith({Option<List<DeptAndCities>> deptsAndCities});
}
