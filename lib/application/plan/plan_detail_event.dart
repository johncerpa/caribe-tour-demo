part of 'plan_detail_bloc.dart';

@freezed
abstract class PlanDetailEvent with _$PlanDetailEvent {
  const factory PlanDetailEvent.started() = _Started;
  const factory PlanDetailEvent.streamPlan(String id) = _StreanPlans;
}
