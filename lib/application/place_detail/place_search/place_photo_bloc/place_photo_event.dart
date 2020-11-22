part of 'place_photo_bloc.dart';

@freezed
abstract class PlacePhotoEvent with _$PlacePhotoEvent {
  const factory PlacePhotoEvent.started() = _Started;

  const factory PlacePhotoEvent.loadingPlaceInfo(
    String photoReference,
    String placeId,
  ) = _LoadingPlaceInfo;
}
