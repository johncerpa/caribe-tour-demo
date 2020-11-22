import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:caribe_tour/domain/plans/interfaces/i_plans_repository.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'map_event.dart';
part 'map_state.dart';
part 'map_bloc.freezed.dart';

@injectable
class MapBloc extends Bloc<MapBlocEvent, MapState> {
  MapBloc(this._plansRepository) : super(const _Initial());

  final IPlansRepository _plansRepository;

  @override
  Stream<MapState> mapEventToState(
    MapBlocEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {},
      savingNewPlan: (e) async* {
        yield const MapState.saving();

        await _plansRepository.savePlan(
          e.planName,
          e.places,
          e.source,
          e.destination,
          e.email,
          e.kidsFilter,
          e.disableFilter,
          e.byDepartment,
          e.citdepart,
          e.placesOrder,
        );

        yield const MapState.saved();
      },
      updatePlan: (e) async* {
        yield const MapState.saving();
        _plansRepository.updatePlan(
            e.planName, e.places, e.source, e.destination, e.email, e.planid);
        yield const MapState.saved();
      },
      returnHome: (e) async* {
        yield const MapState.home();
      },
    );
  }
}
