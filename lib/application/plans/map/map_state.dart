part of 'map_bloc.dart';

@freezed
abstract class MapState with _$MapState {
  const factory MapState.initial() = _Initial;

  const factory MapState.saving() = _Saving;

  const factory MapState.saved() = _Saved;
  const factory MapState.home() = _Home;
}
