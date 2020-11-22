part of 'event_bloc.dart';

@freezed
abstract class EventEvent with _$EventEvent {
  const factory EventEvent.started() = _Started;
  const factory EventEvent.getEvent() = _GetEvent;
}
