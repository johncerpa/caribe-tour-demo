import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:caribe_tour/domain/plans/interfaces/i_locations_repository.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'cards_event.dart';
part 'cards_state.dart';
part 'cards_bloc.freezed.dart';

@injectable
class CardsBloc extends Bloc<CardsEvent, CardsState> {
  CardsBloc(this._locationsRepository) : super(CardsState.initial());

  final ILocationsRepository _locationsRepository;

  @override
  Stream<CardsState> mapEventToState(
    CardsEvent event,
  ) async* {
    yield* event.map(
        started: (e) async* {},
        loadingPlacesByDepartments: (e) async* {
          final places = await _locationsRepository.getPlacesByDepartments(
            departments: e.departments,
            kidsFilter: e.kidsFilter,
            disabilitiesFilter: e.disabilitiesFilter,
          );

          yield state.copyWith(places: some(places));
        },
        loadingPlacesByDepartmentAndCities: (e) async* {
          final places =
              await _locationsRepository.getPlacesByDepartmentAndCities(
            department: e.department,
            cities: e.cities,
            kidsFilter: e.kidsFilter,
            disabilitiesFilter: e.disabilitiesFilter,
          );
          yield state.copyWith(places: some(places));
        },
        loadingbyCities: (e) async* {
          final places = await _locationsRepository.getPlacesByCities(
              cities: e.cities,
              kidsFilter: e.kidsFilter,
              disabilitiesFilter: e.disabilitiesFilter);
          yield state.copyWith(places: some(places));
        });
  }
}
