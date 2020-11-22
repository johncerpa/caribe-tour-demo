part of 'profile_bloc.dart';

@freezed
abstract class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.loadingUserInformation() = LoadingUserInformation;
  const factory ProfileEvent.initial() = Initial;
}
