import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:caribe_tour/application/plans/plan_map/plan_map_bloc.dart';
import 'package:caribe_tour/domain/plans/interfaces/i_plans_repository.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'plan_details_event.dart';
part 'plan_details_state.dart';
part 'plan_details_bloc.freezed.dart';

@injectable
class PlanDetailsBloc extends Bloc<PlanDetailsEvent, PlanDetailsState> {
  PlanDetailsBloc(this._plansRepository) : super(PlanDetailsState.initial());

  final IPlansRepository _plansRepository;

  @override
  Stream<PlanDetailsState> mapEventToState(
    PlanDetailsEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {},
      savingPlaceVisited: (e) async* {
        await _plansRepository.savePlaceVisited(e.planId, e.placeVisited);

        add(PlanDetailsEvent.getPlacesVisited(e.planId));
      },
      removePlaceVisited: (e) async* {
        await _plansRepository.removePlaceVisited(e.planId, e.placeVisited);

        add(PlanDetailsEvent.getPlacesVisited(e.planId));
      },
      getPlacesVisited: (e) async* {
        final placesVisited = await _plansRepository.getPlacesVisited(e.planId);

        yield state.copyWith(placesVisited: some(placesVisited));
      },
      getPlacesVisitedStream: (e) async* {
        final placesVisitedStream =
            await _plansRepository.getPlacesVisitedStream(e.planId);

        yield state.copyWith(placesVisitedStream: some(placesVisitedStream));
      },
    );
  }
}
