// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'review_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ReviewEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required
        Result save(String placeName, String comment, double rating,
            String collection, String field),
    @required Result getReviews(String name, String collection, String field),
    @required
        Result getReviewsStream(String name, String collection, String field),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result save(String placeName, String comment, double rating,
        String collection, String field),
    Result getReviews(String name, String collection, String field),
    Result getReviewsStream(String name, String collection, String field),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result save(_Save value),
    @required Result getReviews(_GetReviews value),
    @required Result getReviewsStream(_GetReviewsStream value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result save(_Save value),
    Result getReviews(_GetReviews value),
    Result getReviewsStream(_GetReviewsStream value),
    @required Result orElse(),
  });
}

class _$ReviewEventTearOff {
  const _$ReviewEventTearOff();

  _Started started() {
    return const _Started();
  }

  _Save save(String placeName, String comment, double rating, String collection,
      String field) {
    return _Save(
      placeName,
      comment,
      rating,
      collection,
      field,
    );
  }

  _GetReviews getReviews(String name, String collection, String field) {
    return _GetReviews(
      name,
      collection,
      field,
    );
  }

  _GetReviewsStream getReviewsStream(
      String name, String collection, String field) {
    return _GetReviewsStream(
      name,
      collection,
      field,
    );
  }
}

const $ReviewEvent = _$ReviewEventTearOff();

class _$_Started with DiagnosticableTreeMixin implements _Started {
  const _$_Started();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReviewEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ReviewEvent.started'));
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
    @required
        Result save(String placeName, String comment, double rating,
            String collection, String field),
    @required Result getReviews(String name, String collection, String field),
    @required
        Result getReviewsStream(String name, String collection, String field),
  }) {
    assert(started != null);
    assert(save != null);
    assert(getReviews != null);
    assert(getReviewsStream != null);
    return started();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result save(String placeName, String comment, double rating,
        String collection, String field),
    Result getReviews(String name, String collection, String field),
    Result getReviewsStream(String name, String collection, String field),
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
    @required Result getReviews(_GetReviews value),
    @required Result getReviewsStream(_GetReviewsStream value),
  }) {
    assert(started != null);
    assert(save != null);
    assert(getReviews != null);
    assert(getReviewsStream != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result save(_Save value),
    Result getReviews(_GetReviews value),
    Result getReviewsStream(_GetReviewsStream value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ReviewEvent {
  const factory _Started() = _$_Started;
}

class _$_Save with DiagnosticableTreeMixin implements _Save {
  const _$_Save(
      this.placeName, this.comment, this.rating, this.collection, this.field)
      : assert(placeName != null),
        assert(comment != null),
        assert(rating != null),
        assert(collection != null),
        assert(field != null);

  @override
  final String placeName;
  @override
  final String comment;
  @override
  final double rating;
  @override
  final String collection;
  @override
  final String field;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReviewEvent.save(placeName: $placeName, comment: $comment, rating: $rating, collection: $collection, field: $field)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReviewEvent.save'))
      ..add(DiagnosticsProperty('placeName', placeName))
      ..add(DiagnosticsProperty('comment', comment))
      ..add(DiagnosticsProperty('rating', rating))
      ..add(DiagnosticsProperty('collection', collection))
      ..add(DiagnosticsProperty('field', field));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Save &&
            (identical(other.placeName, placeName) ||
                const DeepCollectionEquality()
                    .equals(other.placeName, placeName)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.collection, collection) ||
                const DeepCollectionEquality()
                    .equals(other.collection, collection)) &&
            (identical(other.field, field) ||
                const DeepCollectionEquality().equals(other.field, field)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(placeName) ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(collection) ^
      const DeepCollectionEquality().hash(field);

  @override
  _$_Save copyWith({
    Object placeName = freezed,
    Object comment = freezed,
    Object rating = freezed,
    Object collection = freezed,
    Object field = freezed,
  }) {
    return _$_Save(
      placeName == freezed ? this.placeName : placeName as String,
      comment == freezed ? this.comment : comment as String,
      rating == freezed ? this.rating : rating as double,
      collection == freezed ? this.collection : collection as String,
      field == freezed ? this.field : field as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required
        Result save(String placeName, String comment, double rating,
            String collection, String field),
    @required Result getReviews(String name, String collection, String field),
    @required
        Result getReviewsStream(String name, String collection, String field),
  }) {
    assert(started != null);
    assert(save != null);
    assert(getReviews != null);
    assert(getReviewsStream != null);
    return save(placeName, comment, rating, collection, field);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result save(String placeName, String comment, double rating,
        String collection, String field),
    Result getReviews(String name, String collection, String field),
    Result getReviewsStream(String name, String collection, String field),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (save != null) {
      return save(placeName, comment, rating, collection, field);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result save(_Save value),
    @required Result getReviews(_GetReviews value),
    @required Result getReviewsStream(_GetReviewsStream value),
  }) {
    assert(started != null);
    assert(save != null);
    assert(getReviews != null);
    assert(getReviewsStream != null);
    return save(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result save(_Save value),
    Result getReviews(_GetReviews value),
    Result getReviewsStream(_GetReviewsStream value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class _Save implements ReviewEvent {
  const factory _Save(String placeName, String comment, double rating,
      String collection, String field) = _$_Save;

  String get placeName;
  String get comment;
  double get rating;
  String get collection;
  String get field;

  _Save copyWith(
      {String placeName,
      String comment,
      double rating,
      String collection,
      String field});
}

class _$_GetReviews with DiagnosticableTreeMixin implements _GetReviews {
  const _$_GetReviews(this.name, this.collection, this.field)
      : assert(name != null),
        assert(collection != null),
        assert(field != null);

  @override
  final String name;
  @override
  final String collection;
  @override
  final String field;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReviewEvent.getReviews(name: $name, collection: $collection, field: $field)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReviewEvent.getReviews'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('collection', collection))
      ..add(DiagnosticsProperty('field', field));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetReviews &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.collection, collection) ||
                const DeepCollectionEquality()
                    .equals(other.collection, collection)) &&
            (identical(other.field, field) ||
                const DeepCollectionEquality().equals(other.field, field)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(collection) ^
      const DeepCollectionEquality().hash(field);

  @override
  _$_GetReviews copyWith({
    Object name = freezed,
    Object collection = freezed,
    Object field = freezed,
  }) {
    return _$_GetReviews(
      name == freezed ? this.name : name as String,
      collection == freezed ? this.collection : collection as String,
      field == freezed ? this.field : field as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required
        Result save(String placeName, String comment, double rating,
            String collection, String field),
    @required Result getReviews(String name, String collection, String field),
    @required
        Result getReviewsStream(String name, String collection, String field),
  }) {
    assert(started != null);
    assert(save != null);
    assert(getReviews != null);
    assert(getReviewsStream != null);
    return getReviews(name, collection, field);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result save(String placeName, String comment, double rating,
        String collection, String field),
    Result getReviews(String name, String collection, String field),
    Result getReviewsStream(String name, String collection, String field),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getReviews != null) {
      return getReviews(name, collection, field);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result save(_Save value),
    @required Result getReviews(_GetReviews value),
    @required Result getReviewsStream(_GetReviewsStream value),
  }) {
    assert(started != null);
    assert(save != null);
    assert(getReviews != null);
    assert(getReviewsStream != null);
    return getReviews(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result save(_Save value),
    Result getReviews(_GetReviews value),
    Result getReviewsStream(_GetReviewsStream value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getReviews != null) {
      return getReviews(this);
    }
    return orElse();
  }
}

abstract class _GetReviews implements ReviewEvent {
  const factory _GetReviews(String name, String collection, String field) =
      _$_GetReviews;

  String get name;
  String get collection;
  String get field;

  _GetReviews copyWith({String name, String collection, String field});
}

class _$_GetReviewsStream
    with DiagnosticableTreeMixin
    implements _GetReviewsStream {
  const _$_GetReviewsStream(this.name, this.collection, this.field)
      : assert(name != null),
        assert(collection != null),
        assert(field != null);

  @override
  final String name;
  @override
  final String collection;
  @override
  final String field;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReviewEvent.getReviewsStream(name: $name, collection: $collection, field: $field)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReviewEvent.getReviewsStream'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('collection', collection))
      ..add(DiagnosticsProperty('field', field));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetReviewsStream &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.collection, collection) ||
                const DeepCollectionEquality()
                    .equals(other.collection, collection)) &&
            (identical(other.field, field) ||
                const DeepCollectionEquality().equals(other.field, field)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(collection) ^
      const DeepCollectionEquality().hash(field);

  @override
  _$_GetReviewsStream copyWith({
    Object name = freezed,
    Object collection = freezed,
    Object field = freezed,
  }) {
    return _$_GetReviewsStream(
      name == freezed ? this.name : name as String,
      collection == freezed ? this.collection : collection as String,
      field == freezed ? this.field : field as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required
        Result save(String placeName, String comment, double rating,
            String collection, String field),
    @required Result getReviews(String name, String collection, String field),
    @required
        Result getReviewsStream(String name, String collection, String field),
  }) {
    assert(started != null);
    assert(save != null);
    assert(getReviews != null);
    assert(getReviewsStream != null);
    return getReviewsStream(name, collection, field);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result save(String placeName, String comment, double rating,
        String collection, String field),
    Result getReviews(String name, String collection, String field),
    Result getReviewsStream(String name, String collection, String field),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getReviewsStream != null) {
      return getReviewsStream(name, collection, field);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result save(_Save value),
    @required Result getReviews(_GetReviews value),
    @required Result getReviewsStream(_GetReviewsStream value),
  }) {
    assert(started != null);
    assert(save != null);
    assert(getReviews != null);
    assert(getReviewsStream != null);
    return getReviewsStream(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result save(_Save value),
    Result getReviews(_GetReviews value),
    Result getReviewsStream(_GetReviewsStream value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getReviewsStream != null) {
      return getReviewsStream(this);
    }
    return orElse();
  }
}

abstract class _GetReviewsStream implements ReviewEvent {
  const factory _GetReviewsStream(
      String name, String collection, String field) = _$_GetReviewsStream;

  String get name;
  String get collection;
  String get field;

  _GetReviewsStream copyWith({String name, String collection, String field});
}

mixin _$ReviewState {
  Option<List<Review>> get review;
  bool get saved;
  Stream<List<Review>> get reviewsStream;

  ReviewState copyWith(
      {Option<List<Review>> review,
      bool saved,
      Stream<List<Review>> reviewsStream});
}

class _$ReviewStateTearOff {
  const _$ReviewStateTearOff();

  _ReviewState call(
      {@required Option<List<Review>> review,
      @required bool saved,
      Stream<List<Review>> reviewsStream}) {
    return _ReviewState(
      review: review,
      saved: saved,
      reviewsStream: reviewsStream,
    );
  }
}

const $ReviewState = _$ReviewStateTearOff();

class _$_ReviewState with DiagnosticableTreeMixin implements _ReviewState {
  const _$_ReviewState(
      {@required this.review, @required this.saved, this.reviewsStream})
      : assert(review != null),
        assert(saved != null);

  @override
  final Option<List<Review>> review;
  @override
  final bool saved;
  @override
  final Stream<List<Review>> reviewsStream;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReviewState(review: $review, saved: $saved, reviewsStream: $reviewsStream)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReviewState'))
      ..add(DiagnosticsProperty('review', review))
      ..add(DiagnosticsProperty('saved', saved))
      ..add(DiagnosticsProperty('reviewsStream', reviewsStream));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReviewState &&
            (identical(other.review, review) ||
                const DeepCollectionEquality().equals(other.review, review)) &&
            (identical(other.saved, saved) ||
                const DeepCollectionEquality().equals(other.saved, saved)) &&
            (identical(other.reviewsStream, reviewsStream) ||
                const DeepCollectionEquality()
                    .equals(other.reviewsStream, reviewsStream)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(review) ^
      const DeepCollectionEquality().hash(saved) ^
      const DeepCollectionEquality().hash(reviewsStream);

  @override
  _$_ReviewState copyWith({
    Object review = freezed,
    Object saved = freezed,
    Object reviewsStream = freezed,
  }) {
    return _$_ReviewState(
      review: review == freezed ? this.review : review as Option<List<Review>>,
      saved: saved == freezed ? this.saved : saved as bool,
      reviewsStream: reviewsStream == freezed
          ? this.reviewsStream
          : reviewsStream as Stream<List<Review>>,
    );
  }
}

abstract class _ReviewState implements ReviewState {
  const factory _ReviewState(
      {@required Option<List<Review>> review,
      @required bool saved,
      Stream<List<Review>> reviewsStream}) = _$_ReviewState;

  @override
  Option<List<Review>> get review;
  @override
  bool get saved;
  @override
  Stream<List<Review>> get reviewsStream;

  @override
  _ReviewState copyWith(
      {Option<List<Review>> review,
      bool saved,
      Stream<List<Review>> reviewsStream});
}
