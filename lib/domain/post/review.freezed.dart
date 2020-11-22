// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

mixin _$Review {
  String get id;
  String get comment;
  String get userName;
  double get rating;
  String get userID;
  String get img;
  DateTime get dat;

  Review copyWith(
      {String id,
      String comment,
      String userName,
      double rating,
      String userID,
      String img,
      DateTime dat});

  Map<String, dynamic> toJson();
}

class _$ReviewTearOff {
  const _$ReviewTearOff();

  _Review call(
      {String id,
      String comment,
      String userName,
      double rating,
      String userID,
      String img,
      DateTime dat}) {
    return _Review(
      id: id,
      comment: comment,
      userName: userName,
      rating: rating,
      userID: userID,
      img: img,
      dat: dat,
    );
  }
}

const $Review = _$ReviewTearOff();

@JsonSerializable()
class _$_Review implements _Review {
  const _$_Review(
      {this.id,
      this.comment,
      this.userName,
      this.rating,
      this.userID,
      this.img,
      this.dat});

  factory _$_Review.fromJson(Map<String, dynamic> json) =>
      _$_$_ReviewFromJson(json);

  @override
  final String id;
  @override
  final String comment;
  @override
  final String userName;
  @override
  final double rating;
  @override
  final String userID;
  @override
  final String img;
  @override
  final DateTime dat;

  @override
  String toString() {
    return 'Review(id: $id, comment: $comment, userName: $userName, rating: $rating, userID: $userID, img: $img, dat: $dat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Review &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)) &&
            (identical(other.img, img) ||
                const DeepCollectionEquality().equals(other.img, img)) &&
            (identical(other.dat, dat) ||
                const DeepCollectionEquality().equals(other.dat, dat)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(userID) ^
      const DeepCollectionEquality().hash(img) ^
      const DeepCollectionEquality().hash(dat);

  @override
  _$_Review copyWith({
    Object id = freezed,
    Object comment = freezed,
    Object userName = freezed,
    Object rating = freezed,
    Object userID = freezed,
    Object img = freezed,
    Object dat = freezed,
  }) {
    return _$_Review(
      id: id == freezed ? this.id : id as String,
      comment: comment == freezed ? this.comment : comment as String,
      userName: userName == freezed ? this.userName : userName as String,
      rating: rating == freezed ? this.rating : rating as double,
      userID: userID == freezed ? this.userID : userID as String,
      img: img == freezed ? this.img : img as String,
      dat: dat == freezed ? this.dat : dat as DateTime,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ReviewToJson(this);
  }
}

abstract class _Review implements Review {
  const factory _Review(
      {String id,
      String comment,
      String userName,
      double rating,
      String userID,
      String img,
      DateTime dat}) = _$_Review;

  factory _Review.fromJson(Map<String, dynamic> json) = _$_Review.fromJson;

  @override
  String get id;
  @override
  String get comment;
  @override
  String get userName;
  @override
  double get rating;
  @override
  String get userID;
  @override
  String get img;
  @override
  DateTime get dat;

  @override
  _Review copyWith(
      {String id,
      String comment,
      String userName,
      double rating,
      String userID,
      String img,
      DateTime dat});
}
