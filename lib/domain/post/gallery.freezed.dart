// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'gallery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Gallery _$GalleryFromJson(Map<String, dynamic> json) {
  return _Gallery.fromJson(json);
}

mixin _$Gallery {
  String get id;
  String get imUrl;
  String get author;
  DateTime get time;

  Gallery copyWith({String id, String imUrl, String author, DateTime time});

  Map<String, dynamic> toJson();
}

class _$GalleryTearOff {
  const _$GalleryTearOff();

  _Gallery call({String id, String imUrl, String author, DateTime time}) {
    return _Gallery(
      id: id,
      imUrl: imUrl,
      author: author,
      time: time,
    );
  }
}

const $Gallery = _$GalleryTearOff();

@JsonSerializable()
class _$_Gallery implements _Gallery {
  const _$_Gallery({this.id, this.imUrl, this.author, this.time});

  factory _$_Gallery.fromJson(Map<String, dynamic> json) =>
      _$_$_GalleryFromJson(json);

  @override
  final String id;
  @override
  final String imUrl;
  @override
  final String author;
  @override
  final DateTime time;

  @override
  String toString() {
    return 'Gallery(id: $id, imUrl: $imUrl, author: $author, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Gallery &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.imUrl, imUrl) ||
                const DeepCollectionEquality().equals(other.imUrl, imUrl)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(imUrl) ^
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(time);

  @override
  _$_Gallery copyWith({
    Object id = freezed,
    Object imUrl = freezed,
    Object author = freezed,
    Object time = freezed,
  }) {
    return _$_Gallery(
      id: id == freezed ? this.id : id as String,
      imUrl: imUrl == freezed ? this.imUrl : imUrl as String,
      author: author == freezed ? this.author : author as String,
      time: time == freezed ? this.time : time as DateTime,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GalleryToJson(this);
  }
}

abstract class _Gallery implements Gallery {
  const factory _Gallery(
      {String id, String imUrl, String author, DateTime time}) = _$_Gallery;

  factory _Gallery.fromJson(Map<String, dynamic> json) = _$_Gallery.fromJson;

  @override
  String get id;
  @override
  String get imUrl;
  @override
  String get author;
  @override
  DateTime get time;

  @override
  _Gallery copyWith({String id, String imUrl, String author, DateTime time});
}
