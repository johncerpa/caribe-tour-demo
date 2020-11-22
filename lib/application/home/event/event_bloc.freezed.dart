// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'event_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$EventEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result getEvent(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result getEvent(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result getEvent(_GetEvent value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result getEvent(_GetEvent value),
    @required Result orElse(),
  });
}

class _$EventEventTearOff {
  const _$EventEventTearOff();

  _Started started() {
    return const _Started();
  }

  _GetEvent getEvent() {
    return const _GetEvent();
  }
}

const $EventEvent = _$EventEventTearOff();

class _$_Started with DiagnosticableTreeMixin implements _Started {
  const _$_Started();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'EventEvent.started'));
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
    @required Result getEvent(),
  }) {
    assert(started != null);
    assert(getEvent != null);
    return started();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result getEvent(),
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
    @required Result getEvent(_GetEvent value),
  }) {
    assert(started != null);
    assert(getEvent != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result getEvent(_GetEvent value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements EventEvent {
  const factory _Started() = _$_Started;
}

class _$_GetEvent with DiagnosticableTreeMixin implements _GetEvent {
  const _$_GetEvent();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventEvent.getEvent()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'EventEvent.getEvent'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result getEvent(),
  }) {
    assert(started != null);
    assert(getEvent != null);
    return getEvent();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result getEvent(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getEvent != null) {
      return getEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result getEvent(_GetEvent value),
  }) {
    assert(started != null);
    assert(getEvent != null);
    return getEvent(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result getEvent(_GetEvent value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getEvent != null) {
      return getEvent(this);
    }
    return orElse();
  }
}

abstract class _GetEvent implements EventEvent {
  const factory _GetEvent() = _$_GetEvent;
}

mixin _$EventState {
  Option<List<Event>> get events;

  EventState copyWith({Option<List<Event>> events});
}

class _$EventStateTearOff {
  const _$EventStateTearOff();

  _EventState call({@required Option<List<Event>> events}) {
    return _EventState(
      events: events,
    );
  }
}

const $EventState = _$EventStateTearOff();

class _$_EventState with DiagnosticableTreeMixin implements _EventState {
  const _$_EventState({@required this.events}) : assert(events != null);

  @override
  final Option<List<Event>> events;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventState(events: $events)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EventState'))
      ..add(DiagnosticsProperty('events', events));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventState &&
            (identical(other.events, events) ||
                const DeepCollectionEquality().equals(other.events, events)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(events);

  @override
  _$_EventState copyWith({
    Object events = freezed,
  }) {
    return _$_EventState(
      events: events == freezed ? this.events : events as Option<List<Event>>,
    );
  }
}

abstract class _EventState implements EventState {
  const factory _EventState({@required Option<List<Event>> events}) =
      _$_EventState;

  @override
  Option<List<Event>> get events;

  @override
  _EventState copyWith({Option<List<Event>> events});
}
