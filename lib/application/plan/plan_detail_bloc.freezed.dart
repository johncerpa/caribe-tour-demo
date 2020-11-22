// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'plan_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$PlanDetailEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result streamPlan(String id),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result streamPlan(String id),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result streamPlan(_StreanPlans value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result streamPlan(_StreanPlans value),
    @required Result orElse(),
  });
}

class _$PlanDetailEventTearOff {
  const _$PlanDetailEventTearOff();

  _Started started() {
    return const _Started();
  }

  _StreanPlans streamPlan(String id) {
    return _StreanPlans(
      id,
    );
  }
}

const $PlanDetailEvent = _$PlanDetailEventTearOff();

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'PlanDetailEvent.started()';
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
    @required Result streamPlan(String id),
  }) {
    assert(started != null);
    assert(streamPlan != null);
    return started();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result streamPlan(String id),
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
    @required Result streamPlan(_StreanPlans value),
  }) {
    assert(started != null);
    assert(streamPlan != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result streamPlan(_StreanPlans value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements PlanDetailEvent {
  const factory _Started() = _$_Started;
}

class _$_StreanPlans implements _StreanPlans {
  const _$_StreanPlans(this.id) : assert(id != null);

  @override
  final String id;

  @override
  String toString() {
    return 'PlanDetailEvent.streamPlan(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StreanPlans &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @override
  _$_StreanPlans copyWith({
    Object id = freezed,
  }) {
    return _$_StreanPlans(
      id == freezed ? this.id : id as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result streamPlan(String id),
  }) {
    assert(started != null);
    assert(streamPlan != null);
    return streamPlan(id);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result streamPlan(String id),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (streamPlan != null) {
      return streamPlan(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result streamPlan(_StreanPlans value),
  }) {
    assert(started != null);
    assert(streamPlan != null);
    return streamPlan(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result streamPlan(_StreanPlans value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (streamPlan != null) {
      return streamPlan(this);
    }
    return orElse();
  }
}

abstract class _StreanPlans implements PlanDetailEvent {
  const factory _StreanPlans(String id) = _$_StreanPlans;

  String get id;

  _StreanPlans copyWith({String id});
}

mixin _$PlanDetailState {
  Stream<Plan> get plan;

  PlanDetailState copyWith({Stream<Plan> plan});
}

class _$PlanDetailStateTearOff {
  const _$PlanDetailStateTearOff();

  _PlanDetailState call({@required Stream<Plan> plan}) {
    return _PlanDetailState(
      plan: plan,
    );
  }
}

const $PlanDetailState = _$PlanDetailStateTearOff();

class _$_PlanDetailState implements _PlanDetailState {
  _$_PlanDetailState({@required this.plan}) : assert(plan != null);

  @override
  final Stream<Plan> plan;

  @override
  String toString() {
    return 'PlanDetailState(plan: $plan)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PlanDetailState &&
            (identical(other.plan, plan) ||
                const DeepCollectionEquality().equals(other.plan, plan)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(plan);

  @override
  _$_PlanDetailState copyWith({
    Object plan = freezed,
  }) {
    return _$_PlanDetailState(
      plan: plan == freezed ? this.plan : plan as Stream<Plan>,
    );
  }
}

abstract class _PlanDetailState implements PlanDetailState {
  factory _PlanDetailState({@required Stream<Plan> plan}) = _$_PlanDetailState;

  @override
  Stream<Plan> get plan;

  @override
  _PlanDetailState copyWith({Stream<Plan> plan});
}
