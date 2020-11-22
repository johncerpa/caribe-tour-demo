import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:caribe_tour/domain/plans/interfaces/i_locations_repository.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'popular_places_event.dart';
part 'popular_places_state.dart';
part 'popular_places_bloc.freezed.dart';

@injectable
class PopularPlacesBloc extends Bloc<PopularPlacesEvent, PopularPlacesState> {
  PopularPlacesBloc(this._locationsRepository)
      : super(PopularPlacesState.initial());
  final ILocationsRepository _locationsRepository;
  @override
  Stream<PopularPlacesState> mapEventToState(
    PopularPlacesEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {},
      popularPlaces: (e) async* {
        final places = await _locationsRepository.getPopularPlaces();
        yield state.copyWith(places: some(places));
      },
    );
  }
}
