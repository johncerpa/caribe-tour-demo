part of 'plans_bloc.dart';

@freezed
abstract class PlansState with _$PlansState {
  const factory PlansState(
      {@required Option<List<Plan>> initialplans,
      Stream<List<Plan>> plansStream}) = _PlansState;

  factory PlansState.initial() => PlansState(
        initialplans: none(),
        plansStream: null,
      );
}
