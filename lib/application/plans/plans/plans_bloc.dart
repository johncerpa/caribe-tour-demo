import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:caribe_tour/domain/plans/interfaces/i_plans_repository.dart';
import 'package:caribe_tour/domain/plans/plan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'plans_event.dart';
part 'plans_state.dart';
part 'plans_bloc.freezed.dart';

@injectable
class PlansBloc extends Bloc<PlansEvent, PlansState> {
  PlansBloc(this._plansRepository) : super(PlansState.initial());

  final IPlansRepository _plansRepository;

  @override
  Stream<PlansState> mapEventToState(
    PlansEvent event,
  ) async* {
    yield* event.map(
      loadingUserPlans: (e) async* {},
      started: (e) async* {},
      streamPlanss: (e) async* {
        final userPlanStream = await _plansRepository.getUserPlansStreamH();

        final userPlans = await _plansRepository.getUserPlans();

        yield state.copyWith(
            plansStream: userPlanStream, initialplans: some(userPlans));
      },
    );
  }
}
