part of 'plan_places_bloc.dart';

@freezed
abstract class PlanPlacesState with _$PlanPlacesState {
  factory PlanPlacesState({@required Option<List<Place>> places}) =
      _PlanPlacesState;
  factory PlanPlacesState.initial() => PlanPlacesState(places: none());
}
