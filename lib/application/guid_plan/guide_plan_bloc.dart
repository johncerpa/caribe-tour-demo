import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:caribe_tour/domain/auth/domain_user.dart';
import 'package:caribe_tour/domain/auth/interfaces/i_user_repository.dart';
import 'package:caribe_tour/domain/auth/local_domain_user.dart';
import 'package:caribe_tour/domain/plans/dept_and_cities.dart';
import 'package:caribe_tour/domain/plans/interfaces/i_locations_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'guide_plan_event.dart';
part 'guide_plan_state.dart';
part 'guide_plan_bloc.freezed.dart';

@injectable
class GuidePlanBloc extends Bloc<GuidePlanEvent, GuidePlanState> {
  GuidePlanBloc(this._userRepository, this._locationRepository)
      : super(GuidePlanState.initial());

  final IUserRepository _userRepository;
  final ILocationsRepository _locationRepository;
  @override
  Stream<GuidePlanState> mapEventToState(
    GuidePlanEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {},
      getTouristandPlaces: (e) async* {
        final departaments =
            await _locationRepository.getDepartmentsAndCities();
        final tourists = await _userRepository.getTourist();
        yield state.copyWith(
            tourist: some(tourists), depanCities: some(departaments));
      },
    ); // TODO: implement mapEventToState
  }
}
