part of 'map_bloc.dart';

@freezed
abstract class MapBlocEvent with _$MapBlocEvent {
  const factory MapBlocEvent.started() = _Started;

  const factory MapBlocEvent.updatePlan(
    String planName,
    Map<String, Place> places,
    String source,
    String destination,
    String email,
    String planid,
  ) = _UpdatePlan;

  const factory MapBlocEvent.returnHome() = _ReturnHome;

  const factory MapBlocEvent.savingNewPlan(
    String planName,
    Map<String, Place> places,
    String source,
    String destination,
    String email,
    bool kidsFilter,
    bool disableFilter,
    bool byDepartment,
    List<String> citdepart,
    List<Place> placesOrder,
  ) = _SavingNewPlan;
}
