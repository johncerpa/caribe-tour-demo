part of 'searchplaces_bloc.dart';

@freezed
abstract class SearchplacesState with _$SearchplacesState {
  factory SearchplacesState.initial() =>
      SearchplacesState(places: none(), depandCities: none());
  const factory SearchplacesState(
      {@required Option<List<Place>> places,
      @required Option<List<DeptAndCities>> depandCities}) = _SearchplacesState;
}
