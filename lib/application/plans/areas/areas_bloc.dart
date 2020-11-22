import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:caribe_tour/domain/plans/dept_and_cities.dart';
import 'package:caribe_tour/domain/plans/interfaces/i_locations_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'areas_event.dart';
part 'areas_state.dart';
part 'areas_bloc.freezed.dart';

@injectable
class AreasBloc extends Bloc<AreasEvent, AreasState> {
  AreasBloc(this._locationsRepository) : super(AreasState.initial());

  final ILocationsRepository _locationsRepository;

  @override
  Stream<AreasState> mapEventToState(
    AreasEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {},
      loadingDepartmentsAndCities: (e) async* {
        final deptsAndCities =
            await _locationsRepository.getDepartmentsAndCities();

        yield state.copyWith(deptsAndCities: some(deptsAndCities));
      },
    );
  }
}
