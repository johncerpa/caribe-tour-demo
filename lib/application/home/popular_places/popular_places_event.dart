part of 'popular_places_bloc.dart';

@freezed
abstract class PopularPlacesEvent with _$PopularPlacesEvent {
  const factory PopularPlacesEvent.started() = _Started;
  const factory PopularPlacesEvent.popularPlaces() = _PopularPlaces;
}
