part of 'guide_plan_bloc.dart';

@freezed
abstract class GuidePlanEvent with _$GuidePlanEvent {
  const factory GuidePlanEvent.started() = _Started;
  const factory GuidePlanEvent.getTouristandPlaces() = _GetTouristandPlaces;
}
