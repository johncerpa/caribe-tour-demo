part of 'plan_map_bloc.dart';

@freezed
abstract class PlanMapState with _$PlanMapState {
  const factory PlanMapState({
    @required Option<List<Place>> placesVisited,
  }) = _PlanMapState;

  factory PlanMapState.initial() => PlanMapState(
        placesVisited: none(),
      );
}
