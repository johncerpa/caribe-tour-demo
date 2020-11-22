import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:caribe_tour/domain/plans/dept_and_cities.dart';
import 'package:caribe_tour/domain/plans/interfaces/i_locations_repository.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'searchplaces_event.dart';
part 'searchplaces_state.dart';
part 'searchplaces_bloc.freezed.dart';

@injectable
class SearchplacesBloc extends Bloc<SearchplacesEvent, SearchplacesState> {
  SearchplacesBloc(this._locationsRepository)
      : super(SearchplacesState.initial());
  final ILocationsRepository _locationsRepository;

  @override
  Stream<SearchplacesState> mapEventToState(
    SearchplacesEvent event,
  ) async* {
    yield* event.map(
        started: (e) async* {},
        searchPlace: (e) async* {
          final places = await this._locationsRepository.searchPlaces();
          final depandcites =
              await this._locationsRepository.getDepartmentsAndCities();
          yield state.copyWith(
              places: some(places), depandCities: some(depandcites));
        });
  }
}
