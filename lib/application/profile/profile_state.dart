part of 'profile_bloc.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @required Option<LocalDomainUser> localDomainUser,
  }) = _ProfileState;

  factory ProfileState.initial() => ProfileState(localDomainUser: none());
}
