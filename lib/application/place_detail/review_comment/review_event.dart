part of 'review_bloc.dart';

@freezed
abstract class ReviewEvent with _$ReviewEvent {
  const factory ReviewEvent.started() = _Started;
  const factory ReviewEvent.save(String placeName, String comment,
      double rating, String collection, String field) = _Save;
  const factory ReviewEvent.getReviews(
      String name, String collection, String field) = _GetReviews;
  const factory ReviewEvent.getReviewsStream(
      String name, String collection, String field) = _GetReviewsStream;
}
