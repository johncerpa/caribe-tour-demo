part of 'place_search_bloc.dart';

@freezed
abstract class PlaceSearchEvent with _$PlaceSearchEvent {
  const factory PlaceSearchEvent.started() = _Started;

  const factory PlaceSearchEvent.loadingPlaces(
    double latitude,
    double longitude,
    String type,
    String language,
  ) = _LoadingPlaces;
}
