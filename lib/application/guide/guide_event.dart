part of 'guide_bloc.dart';

@freezed
abstract class GuideEvent with _$GuideEvent {
  const factory GuideEvent.started() = _Started;
  const factory GuideEvent.getGuides() = _GetGuides;
}
