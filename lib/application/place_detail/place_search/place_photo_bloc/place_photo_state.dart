part of 'place_photo_bloc.dart';

@freezed
abstract class PlacePhotoState with _$PlacePhotoState {
  factory PlacePhotoState.initial() => PlacePhotoState(result: none());

  const factory PlacePhotoState({
    @required Option<ResultModel> result,
  }) = _PlacePhotoState;
}
