part of 'areas_bloc.dart';

@freezed
abstract class AreasEvent with _$AreasEvent {
  const factory AreasEvent.started() = _Started;
  const factory AreasEvent.loadingDepartmentsAndCities() =
      LoadingDeparmentsAndCities;
}
