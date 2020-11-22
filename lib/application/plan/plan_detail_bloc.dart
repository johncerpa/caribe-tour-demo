import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:caribe_tour/domain/plans/interfaces/i_plans_repository.dart';
import 'package:caribe_tour/domain/plans/plan.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'plan_detail_event.dart';
part 'plan_detail_state.dart';
part 'plan_detail_bloc.freezed.dart';

@injectable
class PlanDetailBloc extends Bloc<PlanDetailEvent, PlanDetailState> {
  PlanDetailBloc(this._plansRepository) : super(PlanDetailState.initial());

  final IPlansRepository _plansRepository;
  @override
  Stream<PlanDetailState> mapEventToState(
    PlanDetailEvent event,
  ) async* {
    yield* event.map(
        started: (e) async* {},
        streamPlan: (e) async* {
          final plan = await _plansRepository.planStream(e.id);
          yield state.copyWith(plan: plan);
        });
  }
}
