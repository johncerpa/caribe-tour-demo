part of 'cards_bloc.dart';

@freezed
abstract class CardsEvent with _$CardsEvent {
  const factory CardsEvent.started() = _Started;

  const factory CardsEvent.loadingPlacesByDepartments({
    @required List<String> departments,
    @required bool kidsFilter,
    @required bool disabilitiesFilter,
  }) = LoadingPlacesByDepartments;
  const factory CardsEvent.loadingbyCities(
      {@required List<String> cities,
      @required bool kidsFilter,
      @required bool disabilitiesFilter}) = _LoadingByCities;
  const factory CardsEvent.loadingPlacesByDepartmentAndCities({
    @required String department,
    @required List<String> cities,
    @required bool kidsFilter,
    @required bool disabilitiesFilter,
  }) = LoadingPlacesByDepartmentAndCities;
}
