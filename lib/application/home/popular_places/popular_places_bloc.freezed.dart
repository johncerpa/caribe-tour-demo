// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'popular_places_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$PopularPlacesEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result popularPlaces(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result popularPlaces(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result popularPlaces(_PopularPlaces value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result popularPlaces(_PopularPlaces value),
    @required Result orElse(),
  });
}

class _$PopularPlacesEventTearOff {
  const _$PopularPlacesEventTearOff();

  _Started started() {
    return const _Started();
  }

  _PopularPlaces popularPlaces() {
    return const _PopularPlaces();
  }
}

const $PopularPlacesEvent = _$PopularPlacesEventTearOff();

class _$_Started with DiagnosticableTreeMixin implements _Started {
  const _$_Started();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PopularPlacesEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'PopularPlacesEvent.started'));
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
    @required Result popularPlaces(),
  }) {
    assert(started != null);
    assert(popularPlaces != null);
    return started();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result popularPlaces(),
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
    @required Result popularPlaces(_PopularPlaces value),
  }) {
    assert(started != null);
    assert(popularPlaces != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result popularPlaces(_PopularPlaces value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements PopularPlacesEvent {
  const factory _Started() = _$_Started;
}

class _$_PopularPlaces with DiagnosticableTreeMixin implements _PopularPlaces {
  const _$_PopularPlaces();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PopularPlacesEvent.popularPlaces()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PopularPlacesEvent.popularPlaces'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _PopularPlaces);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result popularPlaces(),
  }) {
    assert(started != null);
    assert(popularPlaces != null);
    return popularPlaces();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result popularPlaces(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (popularPlaces != null) {
      return popularPlaces();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result popularPlaces(_PopularPlaces value),
  }) {
    assert(started != null);
    assert(popularPlaces != null);
    return popularPlaces(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result popularPlaces(_PopularPlaces value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (popularPlaces != null) {
      return popularPlaces(this);
    }
    return orElse();
  }
}

abstract class _PopularPlaces implements PopularPlacesEvent {
  const factory _PopularPlaces() = _$_PopularPlaces;
}

mixin _$PopularPlacesState {
  Option<List<Place>> get places;

  PopularPlacesState copyWith({Option<List<Place>> places});
}

class _$PopularPlacesStateTearOff {
  const _$PopularPlacesStateTearOff();

  _PopularPlacesState call({@required Option<List<Place>> places}) {
    return _PopularPlacesState(
      places: places,
    );
  }
}

const $PopularPlacesState = _$PopularPlacesStateTearOff();

class _$_PopularPlacesState
    with DiagnosticableTreeMixin
    implements _PopularPlacesState {
  const _$_PopularPlacesState({@required this.places}) : assert(places != null);

  @override
  final Option<List<Place>> places;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PopularPlacesState(places: $places)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PopularPlacesState'))
      ..add(DiagnosticsProperty('places', places));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PopularPlacesState &&
            (identical(other.places, places) ||
                const DeepCollectionEquality().equals(other.places, places)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(places);

  @override
  _$_PopularPlacesState copyWith({
    Object places = freezed,
  }) {
    return _$_PopularPlacesState(
      places: places == freezed ? this.places : places as Option<List<Place>>,
    );
  }
}

abstract class _PopularPlacesState implements PopularPlacesState {
  const factory _PopularPlacesState({@required Option<List<Place>> places}) =
      _$_PopularPlacesState;

  @override
  Option<List<Place>> get places;

  @override
  _PopularPlacesState copyWith({Option<List<Place>> places});
}
