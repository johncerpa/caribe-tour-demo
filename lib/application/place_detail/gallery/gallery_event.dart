part of 'gallery_bloc.dart';

@freezed
abstract class GalleryEvent with _$GalleryEvent {
  const factory GalleryEvent.started() = _Started;
  const factory GalleryEvent.save(String namePlace, File photo, String coll) =
      _Save;
  const factory GalleryEvent.getGallery(String namePlace, String coll) =
      _GetGallery;
}
