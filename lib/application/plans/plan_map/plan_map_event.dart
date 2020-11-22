part of 'plan_map_bloc.dart';

@freezed
abstract class PlanMapEvent with _$PlanMapEvent {
  const factory PlanMapEvent.started() = _Started;

  const factory PlanMapEvent.savingPlaceVisited(
    String planId,
    String placeVisited,
  ) = _SavingPlanVisited;

  const factory PlanMapEvent.removePlaceVisited(
    String planId,
    String placeVisited,
  ) = _RemovePlaceVisited;

  const factory PlanMapEvent.getPlacesVisited(String planId) =
      _GetPlacesVisited;
}
