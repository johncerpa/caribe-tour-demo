import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:caribe_tour/domain/plans/interfaces/i_plans_repository.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'plan_map_event.dart';
part 'plan_map_state.dart';
part 'plan_map_bloc.freezed.dart';

@injectable
class PlanMapBloc extends Bloc<PlanMapEvent, PlanMapState> {
  PlanMapBloc(this._plansRepository) : super(PlanMapState.initial());

  final IPlansRepository _plansRepository;

  @override
  Stream<PlanMapState> mapEventToState(
    PlanMapEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {},
      savingPlaceVisited: (e) async* {
        _plansRepository.savePlaceVisited(e.planId, e.placeVisited);
      },
      removePlaceVisited: (e) async* {
        _plansRepository.removePlaceVisited(e.planId, e.placeVisited);
      },
      getPlacesVisited: (e) async* {
        final placesVisited = await _plansRepository.getPlacesVisited(e.planId);

        yield state.copyWith(placesVisited: some(placesVisited));
      },
    );
  }
}
