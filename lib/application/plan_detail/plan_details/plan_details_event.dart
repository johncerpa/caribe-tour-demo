part of 'plan_details_bloc.dart';

@freezed
abstract class PlanDetailsEvent with _$PlanDetailsEvent {
  const factory PlanDetailsEvent.started() = _Started;

  const factory PlanDetailsEvent.savingPlaceVisited(
    String planId,
    String placeVisited,
  ) = _SavingPlanVisited;

  const factory PlanDetailsEvent.removePlaceVisited(
    String planId,
    String placeVisited,
  ) = _RemovePlaceVisited;

  const factory PlanDetailsEvent.getPlacesVisited(String planId) =
      _GetPlacesVisited;

  const factory PlanDetailsEvent.getPlacesVisitedStream(String planId) =
      _GetPlacesVisitedStream;
}
