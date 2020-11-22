part of 'plans_bloc.dart';

@freezed
abstract class PlansEvent with _$PlansEvent {
  const factory PlansEvent.started() = _Started;

  const factory PlansEvent.loadingUserPlans() = _LoadingUserPlans;
  const factory PlansEvent.streamPlanss() = _StreanPlans;
}
