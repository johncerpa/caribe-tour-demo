import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:caribe_tour/domain/event/event.dart';
import 'package:caribe_tour/domain/event/interfaces/i_event.repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'event_event.dart';
part 'event_state.dart';
part 'event_bloc.freezed.dart';

@injectable
class EventBloc extends Bloc<EventEvent, EventState> {
  final IEventRepository _ieventrepository;
  EventBloc(this._ieventrepository) : super(EventState.initial());

  @override
  Stream<EventState> mapEventToState(
    EventEvent event,
  ) async* {
    yield* event.map(
        started: (e) async* {},
        getEvent: (e) async* {
          final events = await this._ieventrepository.getAllevents();
          yield state.copyWith(events: some(events));
        });
  }
}
