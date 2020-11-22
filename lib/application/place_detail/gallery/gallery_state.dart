part of 'gallery_bloc.dart';

@freezed
abstract class GalleryState with _$GalleryState {
  factory GalleryState.initial() =>
      GalleryState(gallery: none(), galleryStream: null);
  const factory GalleryState(
      {@required Option<List<Gallery>> gallery,
      Stream<List<Gallery>> galleryStream}) = _GalleryState;
}
