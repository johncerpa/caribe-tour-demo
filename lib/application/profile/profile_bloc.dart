import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:caribe_tour/domain/auth/interfaces/i_user_repository.dart';
import 'package:caribe_tour/domain/auth/local_domain_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._userRepository) : super(ProfileState.initial());

  final IUserRepository _userRepository;

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    yield* event.map(
      initial: (e) async* {},
      loadingUserInformation: (e) async* {
        final userInfo = await _userRepository.getUserInformation();

        final localDomainUser = userInfo.getOrElse(() => null);

        yield state.copyWith(localDomainUser: optionOf(localDomainUser));
      },
    );
  }
}
