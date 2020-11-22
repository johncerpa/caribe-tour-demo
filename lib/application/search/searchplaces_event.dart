part of 'searchplaces_bloc.dart';

@freezed
abstract class SearchplacesEvent with _$SearchplacesEvent {
  const factory SearchplacesEvent.started() = _Started;
  const factory SearchplacesEvent.searchPlace() = _SearchPlace;
}
