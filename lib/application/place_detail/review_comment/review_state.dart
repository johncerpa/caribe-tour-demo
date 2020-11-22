part of 'review_bloc.dart';

@freezed
abstract class ReviewState with _$ReviewState {
  factory ReviewState.initial() =>
      ReviewState(review: none(), saved: false, reviewsStream: null);

  const factory ReviewState(
      {@required Option<List<Review>> review,
      @required bool saved,
      Stream<List<Review>> reviewsStream}) = _ReviewState;
}
