import 'dart:async';
import 'package:caribe_tour/domain/plans/interfaces/i_locations_repository.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';
part 'carousel_bloc.freezed.dart';

@injectable
class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc(this._locationsRepository) : super(CarouselState.initial());
  final ILocationsRepository _locationsRepository;

  @override
  Stream<CarouselState> mapEventToState(
    CarouselEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {},
      randomPlaces: (e) async* {
        final places = await _locationsRepository.getRandomPlaces();

        yield state.copyWith(places: some(places));
      },
    ); // TODO: implement mapEventToState
  }
}
