// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'carousel_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$CarouselEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result randomPlaces(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result randomPlaces(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result randomPlaces(RandomPlaces value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result randomPlaces(RandomPlaces value),
    @required Result orElse(),
  });
}

class _$CarouselEventTearOff {
  const _$CarouselEventTearOff();

  _Started started() {
    return const _Started();
  }

  RandomPlaces randomPlaces() {
    return const RandomPlaces();
  }
}

const $CarouselEvent = _$CarouselEventTearOff();

class _$_Started with DiagnosticableTreeMixin implements _Started {
  const _$_Started();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CarouselEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CarouselEvent.started'));
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
    @required Result randomPlaces(),
  }) {
    assert(started != null);
    assert(randomPlaces != null);
    return started();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result randomPlaces(),
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
    @required Result randomPlaces(RandomPlaces value),
  }) {
    assert(started != null);
    assert(randomPlaces != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result randomPlaces(RandomPlaces value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CarouselEvent {
  const factory _Started() = _$_Started;
}

class _$RandomPlaces with DiagnosticableTreeMixin implements RandomPlaces {
  const _$RandomPlaces();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CarouselEvent.randomPlaces()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CarouselEvent.randomPlaces'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RandomPlaces);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result randomPlaces(),
  }) {
    assert(started != null);
    assert(randomPlaces != null);
    return randomPlaces();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result randomPlaces(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (randomPlaces != null) {
      return randomPlaces();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result randomPlaces(RandomPlaces value),
  }) {
    assert(started != null);
    assert(randomPlaces != null);
    return randomPlaces(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result randomPlaces(RandomPlaces value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (randomPlaces != null) {
      return randomPlaces(this);
    }
    return orElse();
  }
}

abstract class RandomPlaces implements CarouselEvent {
  const factory RandomPlaces() = _$RandomPlaces;
}

mixin _$CarouselState {
  Option<List<Place>> get places;

  CarouselState copyWith({Option<List<Place>> places});
}

class _$CarouselStateTearOff {
  const _$CarouselStateTearOff();

  _CarouselState call({@required Option<List<Place>> places}) {
    return _CarouselState(
      places: places,
    );
  }
}

const $CarouselState = _$CarouselStateTearOff();

class _$_CarouselState with DiagnosticableTreeMixin implements _CarouselState {
  const _$_CarouselState({@required this.places}) : assert(places != null);

  @override
  final Option<List<Place>> places;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CarouselState(places: $places)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CarouselState'))
      ..add(DiagnosticsProperty('places', places));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CarouselState &&
            (identical(other.places, places) ||
                const DeepCollectionEquality().equals(other.places, places)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(places);

  @override
  _$_CarouselState copyWith({
    Object places = freezed,
  }) {
    return _$_CarouselState(
      places: places == freezed ? this.places : places as Option<List<Place>>,
    );
  }
}

abstract class _CarouselState implements CarouselState {
  const factory _CarouselState({@required Option<List<Place>> places}) =
      _$_CarouselState;

  @override
  Option<List<Place>> get places;

  @override
  _CarouselState copyWith({Option<List<Place>> places});
}
