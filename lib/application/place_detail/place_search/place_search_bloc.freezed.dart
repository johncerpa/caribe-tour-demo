// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'place_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$PlaceSearchEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required
        Result loadingPlaces(
            double latitude, double longitude, String type, String language),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result loadingPlaces(
        double latitude, double longitude, String type, String language),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result loadingPlaces(_LoadingPlaces value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result loadingPlaces(_LoadingPlaces value),
    @required Result orElse(),
  });
}

class _$PlaceSearchEventTearOff {
  const _$PlaceSearchEventTearOff();

  _Started started() {
    return const _Started();
  }

  _LoadingPlaces loadingPlaces(
      double latitude, double longitude, String type, String language) {
    return _LoadingPlaces(
      latitude,
      longitude,
      type,
      language,
    );
  }
}

const $PlaceSearchEvent = _$PlaceSearchEventTearOff();

class _$_Started with DiagnosticableTreeMixin implements _Started {
  const _$_Started();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaceSearchEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'PlaceSearchEvent.started'));
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
        Result loadingPlaces(
            double latitude, double longitude, String type, String language),
  }) {
    assert(started != null);
    assert(loadingPlaces != null);
    return started();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result loadingPlaces(
        double latitude, double longitude, String type, String language),
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
    @required Result loadingPlaces(_LoadingPlaces value),
  }) {
    assert(started != null);
    assert(loadingPlaces != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result loadingPlaces(_LoadingPlaces value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements PlaceSearchEvent {
  const factory _Started() = _$_Started;
}

class _$_LoadingPlaces with DiagnosticableTreeMixin implements _LoadingPlaces {
  const _$_LoadingPlaces(
      this.latitude, this.longitude, this.type, this.language)
      : assert(latitude != null),
        assert(longitude != null),
        assert(type != null),
        assert(language != null);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String type;
  @override
  final String language;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaceSearchEvent.loadingPlaces(latitude: $latitude, longitude: $longitude, type: $type, language: $language)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlaceSearchEvent.loadingPlaces'))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('language', language));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadingPlaces &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(language);

  @override
  _$_LoadingPlaces copyWith({
    Object latitude = freezed,
    Object longitude = freezed,
    Object type = freezed,
    Object language = freezed,
  }) {
    return _$_LoadingPlaces(
      latitude == freezed ? this.latitude : latitude as double,
      longitude == freezed ? this.longitude : longitude as double,
      type == freezed ? this.type : type as String,
      language == freezed ? this.language : language as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required
        Result loadingPlaces(
            double latitude, double longitude, String type, String language),
  }) {
    assert(started != null);
    assert(loadingPlaces != null);
    return loadingPlaces(latitude, longitude, type, language);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result loadingPlaces(
        double latitude, double longitude, String type, String language),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingPlaces != null) {
      return loadingPlaces(latitude, longitude, type, language);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result loadingPlaces(_LoadingPlaces value),
  }) {
    assert(started != null);
    assert(loadingPlaces != null);
    return loadingPlaces(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result loadingPlaces(_LoadingPlaces value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingPlaces != null) {
      return loadingPlaces(this);
    }
    return orElse();
  }
}

abstract class _LoadingPlaces implements PlaceSearchEvent {
  const factory _LoadingPlaces(
          double latitude, double longitude, String type, String language) =
      _$_LoadingPlaces;

  double get latitude;
  double get longitude;
  String get type;
  String get language;

  _LoadingPlaces copyWith(
      {double latitude, double longitude, String type, String language});
}

mixin _$PlaceSearchState {
  Option<List<SearchResult>> get places;

  PlaceSearchState copyWith({Option<List<SearchResult>> places});
}

class _$PlaceSearchStateTearOff {
  const _$PlaceSearchStateTearOff();

  _PlaceSearchState call({@required Option<List<SearchResult>> places}) {
    return _PlaceSearchState(
      places: places,
    );
  }
}

const $PlaceSearchState = _$PlaceSearchStateTearOff();

class _$_PlaceSearchState
    with DiagnosticableTreeMixin
    implements _PlaceSearchState {
  const _$_PlaceSearchState({@required this.places}) : assert(places != null);

  @override
  final Option<List<SearchResult>> places;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaceSearchState(places: $places)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlaceSearchState'))
      ..add(DiagnosticsProperty('places', places));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PlaceSearchState &&
            (identical(other.places, places) ||
                const DeepCollectionEquality().equals(other.places, places)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(places);

  @override
  _$_PlaceSearchState copyWith({
    Object places = freezed,
  }) {
    return _$_PlaceSearchState(
      places: places == freezed
          ? this.places
          : places as Option<List<SearchResult>>,
    );
  }
}

abstract class _PlaceSearchState implements PlaceSearchState {
  const factory _PlaceSearchState(
      {@required Option<List<SearchResult>> places}) = _$_PlaceSearchState;

  @override
  Option<List<SearchResult>> get places;

  @override
  _PlaceSearchState copyWith({Option<List<SearchResult>> places});
}
