import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:caribe_tour/domain/post/interfaces/i_reviews_repository.dart';
import 'package:caribe_tour/domain/post/review.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'review_event.dart';
part 'review_state.dart';
part 'review_bloc.freezed.dart';

@injectable
class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final IReviewsRepository _reviewsRepository;
  ReviewBloc(this._reviewsRepository) : super(ReviewState.initial());

  @override
  Stream<ReviewState> mapEventToState(
    ReviewEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {},
      save: (e) async* {
        _reviewsRepository.saveReview(
          e.placeName,
          e.comment,
          e.rating,
          e.collection,
          e.field,
        );
        yield state.copyWith(saved: true);
      },
      getReviews: (e) async* {
        final algo = await _reviewsRepository.getReviews(
          e.name,
          e.collection,
          e.field,
        );

        final stream = await _reviewsRepository.reviewsStream(
            e.name, e.collection, e.field);

        yield state.copyWith(review: some(algo), reviewsStream: stream);
      },
      getReviewsStream: (e) async* {
        final algo =
            _reviewsRepository.reviewsStream(e.name, e.collection, e.field);
      },
    );
  }
}
