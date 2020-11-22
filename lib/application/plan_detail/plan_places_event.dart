part of 'plan_places_bloc.dart';

@freezed
abstract class PlanPlacesEvent with _$PlanPlacesEvent {
  const factory PlanPlacesEvent.started() = _Started;
  const factory PlanPlacesEvent.planPlaces(
    List<String> places,
    double locationLatitude,
    double locationLongitude,
  ) = _PlanPlaces;
  const factory PlanPlacesEvent.acceptPlan(String id, bool update) =
      _AcceptPlan;
}
