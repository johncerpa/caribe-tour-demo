part of 'plan_details_bloc.dart';

@freezed
abstract class PlanDetailsState with _$PlanDetailsState {
  const factory PlanDetailsState({
    @required Option<List<Place>> placesVisited,
    @required Option<Stream<QuerySnapshot>> placesVisitedStream,
  }) = _PlanDetailsState;

  factory PlanDetailsState.initial() => PlanDetailsState(
        placesVisited: none(),
        placesVisitedStream: none(),
      );
}
