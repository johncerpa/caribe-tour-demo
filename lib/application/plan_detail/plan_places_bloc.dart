import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:caribe_tour/domain/plans/interfaces/i_locations_repository.dart';
import 'package:caribe_tour/domain/plans/interfaces/i_plans_repository.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'plan_places_event.dart';
part 'plan_places_state.dart';
part 'plan_places_bloc.freezed.dart';

@injectable
class PlanPlacesBloc extends Bloc<PlanPlacesEvent, PlanPlacesState> {
  final ILocationsRepository _locationsRepository;
  final IPlansRepository _iPlansRepository;
  PlanPlacesBloc(this._locationsRepository, this._iPlansRepository)
      : super(PlanPlacesState.initial());

  @override
  Stream<PlanPlacesState> mapEventToState(
    PlanPlacesEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {},
      planPlaces: (e) async* {
        final places = await _locationsRepository.getPlanPlaces(
          e.places,
          e.locationLatitude,
          e.locationLongitude,
        );

        yield state.copyWith(places: some(places));
      },
      acceptPlan: (e) async* {
        await _iPlansRepository.updateRequest(e.id, e.update);
      },
    );
  }
}
