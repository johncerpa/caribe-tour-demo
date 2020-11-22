part of 'areas_bloc.dart';

@freezed
abstract class AreasState with _$AreasState {
  const factory AreasState({
    @required Option<List<DeptAndCities>> deptsAndCities,
  }) = _AreasState;

  factory AreasState.initial() => AreasState(deptsAndCities: none());
}
