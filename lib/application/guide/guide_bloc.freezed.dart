// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'guide_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$GuideEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result getGuides(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result getGuides(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result getGuides(_GetGuides value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result getGuides(_GetGuides value),
    @required Result orElse(),
  });
}

class _$GuideEventTearOff {
  const _$GuideEventTearOff();

  _Started started() {
    return const _Started();
  }

  _GetGuides getGuides() {
    return const _GetGuides();
  }
}

const $GuideEvent = _$GuideEventTearOff();

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'GuideEvent.started()';
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
    @required Result getGuides(),
  }) {
    assert(started != null);
    assert(getGuides != null);
    return started();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result getGuides(),
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
    @required Result getGuides(_GetGuides value),
  }) {
    assert(started != null);
    assert(getGuides != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result getGuides(_GetGuides value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements GuideEvent {
  const factory _Started() = _$_Started;
}

class _$_GetGuides implements _GetGuides {
  const _$_GetGuides();

  @override
  String toString() {
    return 'GuideEvent.getGuides()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetGuides);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result getGuides(),
  }) {
    assert(started != null);
    assert(getGuides != null);
    return getGuides();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result getGuides(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getGuides != null) {
      return getGuides();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result getGuides(_GetGuides value),
  }) {
    assert(started != null);
    assert(getGuides != null);
    return getGuides(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result getGuides(_GetGuides value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getGuides != null) {
      return getGuides(this);
    }
    return orElse();
  }
}

abstract class _GetGuides implements GuideEvent {
  const factory _GetGuides() = _$_GetGuides;
}

mixin _$GuideState {
  Option<List<Guide>> get guides;

  GuideState copyWith({Option<List<Guide>> guides});
}

class _$GuideStateTearOff {
  const _$GuideStateTearOff();

  _GuideState call({@required Option<List<Guide>> guides}) {
    return _GuideState(
      guides: guides,
    );
  }
}

const $GuideState = _$GuideStateTearOff();

class _$_GuideState implements _GuideState {
  const _$_GuideState({@required this.guides}) : assert(guides != null);

  @override
  final Option<List<Guide>> guides;

  @override
  String toString() {
    return 'GuideState(guides: $guides)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GuideState &&
            (identical(other.guides, guides) ||
                const DeepCollectionEquality().equals(other.guides, guides)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(guides);

  @override
  _$_GuideState copyWith({
    Object guides = freezed,
  }) {
    return _$_GuideState(
      guides: guides == freezed ? this.guides : guides as Option<List<Guide>>,
    );
  }
}

abstract class _GuideState implements GuideState {
  const factory _GuideState({@required Option<List<Guide>> guides}) =
      _$_GuideState;

  @override
  Option<List<Guide>> get guides;

  @override
  _GuideState copyWith({Option<List<Guide>> guides});
}
