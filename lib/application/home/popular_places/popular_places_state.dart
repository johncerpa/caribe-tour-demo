part of 'popular_places_bloc.dart';

@freezed
abstract class PopularPlacesState with _$PopularPlacesState {
  const factory PopularPlacesState({
    @required Option<List<Place>> places,
  }) = _PopularPlacesState;
  factory PopularPlacesState.initial() => PopularPlacesState(places: none());
}
