part of 'place_search_bloc.dart';

@freezed
abstract class PlaceSearchState with _$PlaceSearchState {
  factory PlaceSearchState.initial() => PlaceSearchState(places: none());

  const factory PlaceSearchState({
    @required Option<List<SearchResult>> places,
  }) = _PlaceSearchState;
}
