part of 'plan_detail_bloc.dart';

@freezed
abstract class PlanDetailState with _$PlanDetailState {
  factory PlanDetailState.initial() => PlanDetailState(plan: null);
  factory PlanDetailState({@required Stream<Plan> plan}) = _PlanDetailState;
}
