part of 'event_bloc.dart';

@freezed
abstract class EventState with _$EventState {
  factory EventState.initial() => EventState(events: none());
  const factory EventState({@required Option<List<Event>> events}) =
      _EventState;
}
