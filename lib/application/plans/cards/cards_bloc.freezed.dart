// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'cards_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$CardsEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required
        Result loadingPlacesByDepartments(@required List<String> departments,
            @required bool kidsFilter, @required bool disabilitiesFilter),
    @required
        Result loadingbyCities(@required List<String> cities,
            @required bool kidsFilter, @required bool disabilitiesFilter),
    @required
        Result loadingPlacesByDepartmentAndCities(
            @required String department,
            @required List<String> cities,
            @required bool kidsFilter,
            @required bool disabilitiesFilter),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result loadingPlacesByDepartments(@required List<String> departments,
        @required bool kidsFilter, @required bool disabilitiesFilter),
    Result loadingbyCities(@required List<String> cities,
        @required bool kidsFilter, @required bool disabilitiesFilter),
    Result loadingPlacesByDepartmentAndCities(
        @required String department,
        @required List<String> cities,
        @required bool kidsFilter,
        @required bool disabilitiesFilter),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required
        Result loadingPlacesByDepartments(LoadingPlacesByDepartments value),
    @required Result loadingbyCities(_LoadingByCities value),
    @required
        Result loadingPlacesByDepartmentAndCities(
            LoadingPlacesByDepartmentAndCities value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result loadingPlacesByDepartments(LoadingPlacesByDepartments value),
    Result loadingbyCities(_LoadingByCities value),
    Result loadingPlacesByDepartmentAndCities(
        LoadingPlacesByDepartmentAndCities value),
    @required Result orElse(),
  });
}

class _$CardsEventTearOff {
  const _$CardsEventTearOff();

  _Started started() {
    return const _Started();
  }

  LoadingPlacesByDepartments loadingPlacesByDepartments(
      {@required List<String> departments,
      @required bool kidsFilter,
      @required bool disabilitiesFilter}) {
    return LoadingPlacesByDepartments(
      departments: departments,
      kidsFilter: kidsFilter,
      disabilitiesFilter: disabilitiesFilter,
    );
  }

  _LoadingByCities loadingbyCities(
      {@required List<String> cities,
      @required bool kidsFilter,
      @required bool disabilitiesFilter}) {
    return _LoadingByCities(
      cities: cities,
      kidsFilter: kidsFilter,
      disabilitiesFilter: disabilitiesFilter,
    );
  }

  LoadingPlacesByDepartmentAndCities loadingPlacesByDepartmentAndCities(
      {@required String department,
      @required List<String> cities,
      @required bool kidsFilter,
      @required bool disabilitiesFilter}) {
    return LoadingPlacesByDepartmentAndCities(
      department: department,
      cities: cities,
      kidsFilter: kidsFilter,
      disabilitiesFilter: disabilitiesFilter,
    );
  }
}

const $CardsEvent = _$CardsEventTearOff();

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'CardsEvent.started()';
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
        Result loadingPlacesByDepartments(@required List<String> departments,
            @required bool kidsFilter, @required bool disabilitiesFilter),
    @required
        Result loadingbyCities(@required List<String> cities,
            @required bool kidsFilter, @required bool disabilitiesFilter),
    @required
        Result loadingPlacesByDepartmentAndCities(
            @required String department,
            @required List<String> cities,
            @required bool kidsFilter,
            @required bool disabilitiesFilter),
  }) {
    assert(started != null);
    assert(loadingPlacesByDepartments != null);
    assert(loadingbyCities != null);
    assert(loadingPlacesByDepartmentAndCities != null);
    return started();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result loadingPlacesByDepartments(@required List<String> departments,
        @required bool kidsFilter, @required bool disabilitiesFilter),
    Result loadingbyCities(@required List<String> cities,
        @required bool kidsFilter, @required bool disabilitiesFilter),
    Result loadingPlacesByDepartmentAndCities(
        @required String department,
        @required List<String> cities,
        @required bool kidsFilter,
        @required bool disabilitiesFilter),
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
        Result loadingPlacesByDepartments(LoadingPlacesByDepartments value),
    @required Result loadingbyCities(_LoadingByCities value),
    @required
        Result loadingPlacesByDepartmentAndCities(
            LoadingPlacesByDepartmentAndCities value),
  }) {
    assert(started != null);
    assert(loadingPlacesByDepartments != null);
    assert(loadingbyCities != null);
    assert(loadingPlacesByDepartmentAndCities != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result loadingPlacesByDepartments(LoadingPlacesByDepartments value),
    Result loadingbyCities(_LoadingByCities value),
    Result loadingPlacesByDepartmentAndCities(
        LoadingPlacesByDepartmentAndCities value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CardsEvent {
  const factory _Started() = _$_Started;
}

class _$LoadingPlacesByDepartments implements LoadingPlacesByDepartments {
  const _$LoadingPlacesByDepartments(
      {@required this.departments,
      @required this.kidsFilter,
      @required this.disabilitiesFilter})
      : assert(departments != null),
        assert(kidsFilter != null),
        assert(disabilitiesFilter != null);

  @override
  final List<String> departments;
  @override
  final bool kidsFilter;
  @override
  final bool disabilitiesFilter;

  @override
  String toString() {
    return 'CardsEvent.loadingPlacesByDepartments(departments: $departments, kidsFilter: $kidsFilter, disabilitiesFilter: $disabilitiesFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadingPlacesByDepartments &&
            (identical(other.departments, departments) ||
                const DeepCollectionEquality()
                    .equals(other.departments, departments)) &&
            (identical(other.kidsFilter, kidsFilter) ||
                const DeepCollectionEquality()
                    .equals(other.kidsFilter, kidsFilter)) &&
            (identical(other.disabilitiesFilter, disabilitiesFilter) ||
                const DeepCollectionEquality()
                    .equals(other.disabilitiesFilter, disabilitiesFilter)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(departments) ^
      const DeepCollectionEquality().hash(kidsFilter) ^
      const DeepCollectionEquality().hash(disabilitiesFilter);

  @override
  _$LoadingPlacesByDepartments copyWith({
    Object departments = freezed,
    Object kidsFilter = freezed,
    Object disabilitiesFilter = freezed,
  }) {
    return _$LoadingPlacesByDepartments(
      departments: departments == freezed
          ? this.departments
          : departments as List<String>,
      kidsFilter: kidsFilter == freezed ? this.kidsFilter : kidsFilter as bool,
      disabilitiesFilter: disabilitiesFilter == freezed
          ? this.disabilitiesFilter
          : disabilitiesFilter as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required
        Result loadingPlacesByDepartments(@required List<String> departments,
            @required bool kidsFilter, @required bool disabilitiesFilter),
    @required
        Result loadingbyCities(@required List<String> cities,
            @required bool kidsFilter, @required bool disabilitiesFilter),
    @required
        Result loadingPlacesByDepartmentAndCities(
            @required String department,
            @required List<String> cities,
            @required bool kidsFilter,
            @required bool disabilitiesFilter),
  }) {
    assert(started != null);
    assert(loadingPlacesByDepartments != null);
    assert(loadingbyCities != null);
    assert(loadingPlacesByDepartmentAndCities != null);
    return loadingPlacesByDepartments(
        departments, kidsFilter, disabilitiesFilter);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result loadingPlacesByDepartments(@required List<String> departments,
        @required bool kidsFilter, @required bool disabilitiesFilter),
    Result loadingbyCities(@required List<String> cities,
        @required bool kidsFilter, @required bool disabilitiesFilter),
    Result loadingPlacesByDepartmentAndCities(
        @required String department,
        @required List<String> cities,
        @required bool kidsFilter,
        @required bool disabilitiesFilter),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingPlacesByDepartments != null) {
      return loadingPlacesByDepartments(
          departments, kidsFilter, disabilitiesFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required
        Result loadingPlacesByDepartments(LoadingPlacesByDepartments value),
    @required Result loadingbyCities(_LoadingByCities value),
    @required
        Result loadingPlacesByDepartmentAndCities(
            LoadingPlacesByDepartmentAndCities value),
  }) {
    assert(started != null);
    assert(loadingPlacesByDepartments != null);
    assert(loadingbyCities != null);
    assert(loadingPlacesByDepartmentAndCities != null);
    return loadingPlacesByDepartments(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result loadingPlacesByDepartments(LoadingPlacesByDepartments value),
    Result loadingbyCities(_LoadingByCities value),
    Result loadingPlacesByDepartmentAndCities(
        LoadingPlacesByDepartmentAndCities value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingPlacesByDepartments != null) {
      return loadingPlacesByDepartments(this);
    }
    return orElse();
  }
}

abstract class LoadingPlacesByDepartments implements CardsEvent {
  const factory LoadingPlacesByDepartments(
      {@required List<String> departments,
      @required bool kidsFilter,
      @required bool disabilitiesFilter}) = _$LoadingPlacesByDepartments;

  List<String> get departments;
  bool get kidsFilter;
  bool get disabilitiesFilter;

  LoadingPlacesByDepartments copyWith(
      {List<String> departments, bool kidsFilter, bool disabilitiesFilter});
}

class _$_LoadingByCities implements _LoadingByCities {
  const _$_LoadingByCities(
      {@required this.cities,
      @required this.kidsFilter,
      @required this.disabilitiesFilter})
      : assert(cities != null),
        assert(kidsFilter != null),
        assert(disabilitiesFilter != null);

  @override
  final List<String> cities;
  @override
  final bool kidsFilter;
  @override
  final bool disabilitiesFilter;

  @override
  String toString() {
    return 'CardsEvent.loadingbyCities(cities: $cities, kidsFilter: $kidsFilter, disabilitiesFilter: $disabilitiesFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadingByCities &&
            (identical(other.cities, cities) ||
                const DeepCollectionEquality().equals(other.cities, cities)) &&
            (identical(other.kidsFilter, kidsFilter) ||
                const DeepCollectionEquality()
                    .equals(other.kidsFilter, kidsFilter)) &&
            (identical(other.disabilitiesFilter, disabilitiesFilter) ||
                const DeepCollectionEquality()
                    .equals(other.disabilitiesFilter, disabilitiesFilter)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(cities) ^
      const DeepCollectionEquality().hash(kidsFilter) ^
      const DeepCollectionEquality().hash(disabilitiesFilter);

  @override
  _$_LoadingByCities copyWith({
    Object cities = freezed,
    Object kidsFilter = freezed,
    Object disabilitiesFilter = freezed,
  }) {
    return _$_LoadingByCities(
      cities: cities == freezed ? this.cities : cities as List<String>,
      kidsFilter: kidsFilter == freezed ? this.kidsFilter : kidsFilter as bool,
      disabilitiesFilter: disabilitiesFilter == freezed
          ? this.disabilitiesFilter
          : disabilitiesFilter as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required
        Result loadingPlacesByDepartments(@required List<String> departments,
            @required bool kidsFilter, @required bool disabilitiesFilter),
    @required
        Result loadingbyCities(@required List<String> cities,
            @required bool kidsFilter, @required bool disabilitiesFilter),
    @required
        Result loadingPlacesByDepartmentAndCities(
            @required String department,
            @required List<String> cities,
            @required bool kidsFilter,
            @required bool disabilitiesFilter),
  }) {
    assert(started != null);
    assert(loadingPlacesByDepartments != null);
    assert(loadingbyCities != null);
    assert(loadingPlacesByDepartmentAndCities != null);
    return loadingbyCities(cities, kidsFilter, disabilitiesFilter);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result loadingPlacesByDepartments(@required List<String> departments,
        @required bool kidsFilter, @required bool disabilitiesFilter),
    Result loadingbyCities(@required List<String> cities,
        @required bool kidsFilter, @required bool disabilitiesFilter),
    Result loadingPlacesByDepartmentAndCities(
        @required String department,
        @required List<String> cities,
        @required bool kidsFilter,
        @required bool disabilitiesFilter),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingbyCities != null) {
      return loadingbyCities(cities, kidsFilter, disabilitiesFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required
        Result loadingPlacesByDepartments(LoadingPlacesByDepartments value),
    @required Result loadingbyCities(_LoadingByCities value),
    @required
        Result loadingPlacesByDepartmentAndCities(
            LoadingPlacesByDepartmentAndCities value),
  }) {
    assert(started != null);
    assert(loadingPlacesByDepartments != null);
    assert(loadingbyCities != null);
    assert(loadingPlacesByDepartmentAndCities != null);
    return loadingbyCities(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result loadingPlacesByDepartments(LoadingPlacesByDepartments value),
    Result loadingbyCities(_LoadingByCities value),
    Result loadingPlacesByDepartmentAndCities(
        LoadingPlacesByDepartmentAndCities value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingbyCities != null) {
      return loadingbyCities(this);
    }
    return orElse();
  }
}

abstract class _LoadingByCities implements CardsEvent {
  const factory _LoadingByCities(
      {@required List<String> cities,
      @required bool kidsFilter,
      @required bool disabilitiesFilter}) = _$_LoadingByCities;

  List<String> get cities;
  bool get kidsFilter;
  bool get disabilitiesFilter;

  _LoadingByCities copyWith(
      {List<String> cities, bool kidsFilter, bool disabilitiesFilter});
}

class _$LoadingPlacesByDepartmentAndCities
    implements LoadingPlacesByDepartmentAndCities {
  const _$LoadingPlacesByDepartmentAndCities(
      {@required this.department,
      @required this.cities,
      @required this.kidsFilter,
      @required this.disabilitiesFilter})
      : assert(department != null),
        assert(cities != null),
        assert(kidsFilter != null),
        assert(disabilitiesFilter != null);

  @override
  final String department;
  @override
  final List<String> cities;
  @override
  final bool kidsFilter;
  @override
  final bool disabilitiesFilter;

  @override
  String toString() {
    return 'CardsEvent.loadingPlacesByDepartmentAndCities(department: $department, cities: $cities, kidsFilter: $kidsFilter, disabilitiesFilter: $disabilitiesFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadingPlacesByDepartmentAndCities &&
            (identical(other.department, department) ||
                const DeepCollectionEquality()
                    .equals(other.department, department)) &&
            (identical(other.cities, cities) ||
                const DeepCollectionEquality().equals(other.cities, cities)) &&
            (identical(other.kidsFilter, kidsFilter) ||
                const DeepCollectionEquality()
                    .equals(other.kidsFilter, kidsFilter)) &&
            (identical(other.disabilitiesFilter, disabilitiesFilter) ||
                const DeepCollectionEquality()
                    .equals(other.disabilitiesFilter, disabilitiesFilter)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(department) ^
      const DeepCollectionEquality().hash(cities) ^
      const DeepCollectionEquality().hash(kidsFilter) ^
      const DeepCollectionEquality().hash(disabilitiesFilter);

  @override
  _$LoadingPlacesByDepartmentAndCities copyWith({
    Object department = freezed,
    Object cities = freezed,
    Object kidsFilter = freezed,
    Object disabilitiesFilter = freezed,
  }) {
    return _$LoadingPlacesByDepartmentAndCities(
      department:
          department == freezed ? this.department : department as String,
      cities: cities == freezed ? this.cities : cities as List<String>,
      kidsFilter: kidsFilter == freezed ? this.kidsFilter : kidsFilter as bool,
      disabilitiesFilter: disabilitiesFilter == freezed
          ? this.disabilitiesFilter
          : disabilitiesFilter as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required
        Result loadingPlacesByDepartments(@required List<String> departments,
            @required bool kidsFilter, @required bool disabilitiesFilter),
    @required
        Result loadingbyCities(@required List<String> cities,
            @required bool kidsFilter, @required bool disabilitiesFilter),
    @required
        Result loadingPlacesByDepartmentAndCities(
            @required String department,
            @required List<String> cities,
            @required bool kidsFilter,
            @required bool disabilitiesFilter),
  }) {
    assert(started != null);
    assert(loadingPlacesByDepartments != null);
    assert(loadingbyCities != null);
    assert(loadingPlacesByDepartmentAndCities != null);
    return loadingPlacesByDepartmentAndCities(
        department, cities, kidsFilter, disabilitiesFilter);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result loadingPlacesByDepartments(@required List<String> departments,
        @required bool kidsFilter, @required bool disabilitiesFilter),
    Result loadingbyCities(@required List<String> cities,
        @required bool kidsFilter, @required bool disabilitiesFilter),
    Result loadingPlacesByDepartmentAndCities(
        @required String department,
        @required List<String> cities,
        @required bool kidsFilter,
        @required bool disabilitiesFilter),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingPlacesByDepartmentAndCities != null) {
      return loadingPlacesByDepartmentAndCities(
          department, cities, kidsFilter, disabilitiesFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required
        Result loadingPlacesByDepartments(LoadingPlacesByDepartments value),
    @required Result loadingbyCities(_LoadingByCities value),
    @required
        Result loadingPlacesByDepartmentAndCities(
            LoadingPlacesByDepartmentAndCities value),
  }) {
    assert(started != null);
    assert(loadingPlacesByDepartments != null);
    assert(loadingbyCities != null);
    assert(loadingPlacesByDepartmentAndCities != null);
    return loadingPlacesByDepartmentAndCities(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result loadingPlacesByDepartments(LoadingPlacesByDepartments value),
    Result loadingbyCities(_LoadingByCities value),
    Result loadingPlacesByDepartmentAndCities(
        LoadingPlacesByDepartmentAndCities value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingPlacesByDepartmentAndCities != null) {
      return loadingPlacesByDepartmentAndCities(this);
    }
    return orElse();
  }
}

abstract class LoadingPlacesByDepartmentAndCities implements CardsEvent {
  const factory LoadingPlacesByDepartmentAndCities(
          {@required String department,
          @required List<String> cities,
          @required bool kidsFilter,
          @required bool disabilitiesFilter}) =
      _$LoadingPlacesByDepartmentAndCities;

  String get department;
  List<String> get cities;
  bool get kidsFilter;
  bool get disabilitiesFilter;

  LoadingPlacesByDepartmentAndCities copyWith(
      {String department,
      List<String> cities,
      bool kidsFilter,
      bool disabilitiesFilter});
}

mixin _$CardsState {
  Option<List<Place>> get places;

  CardsState copyWith({Option<List<Place>> places});
}

class _$CardsStateTearOff {
  const _$CardsStateTearOff();

  _CardsState call({@required Option<List<Place>> places}) {
    return _CardsState(
      places: places,
    );
  }
}

const $CardsState = _$CardsStateTearOff();

class _$_CardsState implements _CardsState {
  const _$_CardsState({@required this.places}) : assert(places != null);

  @override
  final Option<List<Place>> places;

  @override
  String toString() {
    return 'CardsState(places: $places)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CardsState &&
            (identical(other.places, places) ||
                const DeepCollectionEquality().equals(other.places, places)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(places);

  @override
  _$_CardsState copyWith({
    Object places = freezed,
  }) {
    return _$_CardsState(
      places: places == freezed ? this.places : places as Option<List<Place>>,
    );
  }
}

abstract class _CardsState implements CardsState {
  const factory _CardsState({@required Option<List<Place>> places}) =
      _$_CardsState;

  @override
  Option<List<Place>> get places;

  @override
  _CardsState copyWith({Option<List<Place>> places});
}
