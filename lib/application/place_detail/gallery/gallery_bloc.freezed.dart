// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'gallery_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$GalleryEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result save(String namePlace, File photo, String coll),
    @required Result getGallery(String namePlace, String coll),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result save(String namePlace, File photo, String coll),
    Result getGallery(String namePlace, String coll),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result save(_Save value),
    @required Result getGallery(_GetGallery value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result save(_Save value),
    Result getGallery(_GetGallery value),
    @required Result orElse(),
  });
}

class _$GalleryEventTearOff {
  const _$GalleryEventTearOff();

  _Started started() {
    return const _Started();
  }

  _Save save(String namePlace, File photo, String coll) {
    return _Save(
      namePlace,
      photo,
      coll,
    );
  }

  _GetGallery getGallery(String namePlace, String coll) {
    return _GetGallery(
      namePlace,
      coll,
    );
  }
}

const $GalleryEvent = _$GalleryEventTearOff();

class _$_Started with DiagnosticableTreeMixin implements _Started {
  const _$_Started();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GalleryEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'GalleryEvent.started'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result save(String namePlace, File photo, String coll),
    @required Result getGallery(String namePlace, String coll),
  }) {
    assert(started != null);
    assert(save != null);
    assert(getGallery != null);
    return started();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result save(String namePlace, File photo, String coll),
    Result getGallery(String namePlace, String coll),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result save(_Save value),
    @required Result getGallery(_GetGallery value),
  }) {
    assert(started != null);
    assert(save != null);
    assert(getGallery != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result save(_Save value),
    Result getGallery(_GetGallery value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements GalleryEvent {
  const factory _Started() = _$_Started;
}

class _$_Save with DiagnosticableTreeMixin implements _Save {
  const _$_Save(this.namePlace, this.photo, this.coll)
      : assert(namePlace != null),
        assert(photo != null),
        assert(coll != null);

  @override
  final String namePlace;
  @override
  final File photo;
  @override
  final String coll;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GalleryEvent.save(namePlace: $namePlace, photo: $photo, coll: $coll)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GalleryEvent.save'))
      ..add(DiagnosticsProperty('namePlace', namePlace))
      ..add(DiagnosticsProperty('photo', photo))
      ..add(DiagnosticsProperty('coll', coll));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Save &&
            (identical(other.namePlace, namePlace) ||
                const DeepCollectionEquality()
                    .equals(other.namePlace, namePlace)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.coll, coll) ||
                const DeepCollectionEquality().equals(other.coll, coll)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(namePlace) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(coll);

  @override
  _$_Save copyWith({
    Object namePlace = freezed,
    Object photo = freezed,
    Object coll = freezed,
  }) {
    return _$_Save(
      namePlace == freezed ? this.namePlace : namePlace as String,
      photo == freezed ? this.photo : photo as File,
      coll == freezed ? this.coll : coll as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result save(String namePlace, File photo, String coll),
    @required Result getGallery(String namePlace, String coll),
  }) {
    assert(started != null);
    assert(save != null);
    assert(getGallery != null);
    return save(namePlace, photo, coll);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result save(String namePlace, File photo, String coll),
    Result getGallery(String namePlace, String coll),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (save != null) {
      return save(namePlace, photo, coll);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result save(_Save value),
    @required Result getGallery(_GetGallery value),
  }) {
    assert(started != null);
    assert(save != null);
    assert(getGallery != null);
    return save(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result save(_Save value),
    Result getGallery(_GetGallery value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class _Save implements GalleryEvent {
  const factory _Save(String namePlace, File photo, String coll) = _$_Save;

  String get namePlace;
  File get photo;
  String get coll;

  _Save copyWith({String namePlace, File photo, String coll});
}

class _$_GetGallery with DiagnosticableTreeMixin implements _GetGallery {
  const _$_GetGallery(this.namePlace, this.coll)
      : assert(namePlace != null),
        assert(coll != null);

  @override
  final String namePlace;
  @override
  final String coll;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GalleryEvent.getGallery(namePlace: $namePlace, coll: $coll)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GalleryEvent.getGallery'))
      ..add(DiagnosticsProperty('namePlace', namePlace))
      ..add(DiagnosticsProperty('coll', coll));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetGallery &&
            (identical(other.namePlace, namePlace) ||
                const DeepCollectionEquality()
                    .equals(other.namePlace, namePlace)) &&
            (identical(other.coll, coll) ||
                const DeepCollectionEquality().equals(other.coll, coll)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(namePlace) ^
      const DeepCollectionEquality().hash(coll);

  @override
  _$_GetGallery copyWith({
    Object namePlace = freezed,
    Object coll = freezed,
  }) {
    return _$_GetGallery(
      namePlace == freezed ? this.namePlace : namePlace as String,
      coll == freezed ? this.coll : coll as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result save(String namePlace, File photo, String coll),
    @required Result getGallery(String namePlace, String coll),
  }) {
    assert(started != null);
    assert(save != null);
    assert(getGallery != null);
    return getGallery(namePlace, coll);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result save(String namePlace, File photo, String coll),
    Result getGallery(String namePlace, String coll),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getGallery != null) {
      return getGallery(namePlace, coll);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result save(_Save value),
    @required Result getGallery(_GetGallery value),
  }) {
    assert(started != null);
    assert(save != null);
    assert(getGallery != null);
    return getGallery(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result save(_Save value),
    Result getGallery(_GetGallery value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getGallery != null) {
      return getGallery(this);
    }
    return orElse();
  }
}

abstract class _GetGallery implements GalleryEvent {
  const factory _GetGallery(String namePlace, String coll) = _$_GetGallery;

  String get namePlace;
  String get coll;

  _GetGallery copyWith({String namePlace, String coll});
}

mixin _$GalleryState {
  Option<List<Gallery>> get gallery;
  Stream<List<Gallery>> get galleryStream;

  GalleryState copyWith(
      {Option<List<Gallery>> gallery, Stream<List<Gallery>> galleryStream});
}

class _$GalleryStateTearOff {
  const _$GalleryStateTearOff();

  _GalleryState call(
      {@required Option<List<Gallery>> gallery,
      Stream<List<Gallery>> galleryStream}) {
    return _GalleryState(
      gallery: gallery,
      galleryStream: galleryStream,
    );
  }
}

const $GalleryState = _$GalleryStateTearOff();

class _$_GalleryState with DiagnosticableTreeMixin implements _GalleryState {
  const _$_GalleryState({@required this.gallery, this.galleryStream})
      : assert(gallery != null);

  @override
  final Option<List<Gallery>> gallery;
  @override
  final Stream<List<Gallery>> galleryStream;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GalleryState(gallery: $gallery, galleryStream: $galleryStream)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GalleryState'))
      ..add(DiagnosticsProperty('gallery', gallery))
      ..add(DiagnosticsProperty('galleryStream', galleryStream));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GalleryState &&
            (identical(other.gallery, gallery) ||
                const DeepCollectionEquality()
                    .equals(other.gallery, gallery)) &&
            (identical(other.galleryStream, galleryStream) ||
                const DeepCollectionEquality()
                    .equals(other.galleryStream, galleryStream)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(gallery) ^
      const DeepCollectionEquality().hash(galleryStream);

  @override
  _$_GalleryState copyWith({
    Object gallery = freezed,
    Object galleryStream = freezed,
  }) {
    return _$_GalleryState(
      gallery:
          gallery == freezed ? this.gallery : gallery as Option<List<Gallery>>,
      galleryStream: galleryStream == freezed
          ? this.galleryStream
          : galleryStream as Stream<List<Gallery>>,
    );
  }
}

abstract class _GalleryState implements GalleryState {
  const factory _GalleryState(
      {@required Option<List<Gallery>> gallery,
      Stream<List<Gallery>> galleryStream}) = _$_GalleryState;

  @override
  Option<List<Gallery>> get gallery;
  @override
  Stream<List<Gallery>> get galleryStream;

  @override
  _GalleryState copyWith(
      {Option<List<Gallery>> gallery, Stream<List<Gallery>> galleryStream});
}
