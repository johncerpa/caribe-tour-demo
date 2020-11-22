import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:caribe_tour/domain/guide/guide.dart';
import 'package:caribe_tour/domain/guide/interfaces/i_guides.repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'guide_event.dart';
part 'guide_state.dart';
part 'guide_bloc.freezed.dart';

@injectable
class GuideBloc extends Bloc<GuideEvent, GuideState> {
  GuideBloc(this._guidesRepository) : super(GuideState.initial());
  final IGuidesRepositry _guidesRepository;

  @override
  Stream<GuideState> mapEventToState(
    GuideEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {},
      getGuides: (e) async* {
        final guides = await _guidesRepository.getGuides();
        yield state.copyWith(guides: some(guides));
      },
    );
  }
}
