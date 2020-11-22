import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_place/google_place.dart';
import 'package:injectable/injectable.dart';

part 'place_search_event.dart';
part 'place_search_state.dart';
part 'place_search_bloc.freezed.dart';

@injectable
class PlaceSearchBloc extends Bloc<PlaceSearchEvent, PlaceSearchState> {
  PlaceSearchBloc() : super(PlaceSearchState.initial());

  GooglePlace placeApi = GooglePlace(
    "AIzaSyBi6m7NZzZj5FohxxFzWkg8CLhyZRWxS8Y",
  );

  @override
  Stream<PlaceSearchState> mapEventToState(
    PlaceSearchEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {},
      loadingPlaces: (e) async* {
        final searchResponse = await placeApi.search.getNearBySearch(
          Location(
            lat: e.latitude,
            lng: e.longitude,
          ),
          2000, // meters
          opennow: true,
          type: e.type,
          language: e.language,
        );

        yield state.copyWith(
          places: some(searchResponse.results),
        );
      },
    );
  }
}
