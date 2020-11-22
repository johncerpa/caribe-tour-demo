part of 'guide_plan_bloc.dart';

@freezed
abstract class GuidePlanState with _$GuidePlanState {
  factory GuidePlanState.initial() =>
      GuidePlanState(tourist: none(), depanCities: none());
  factory GuidePlanState(
      {@required Option<List<LocalDomainUser>> tourist,
      @required Option<List<DeptAndCities>> depanCities}) = _GuidePlanState;
}
