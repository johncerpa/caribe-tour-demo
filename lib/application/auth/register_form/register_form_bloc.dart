import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:caribe_tour/domain/auth/auth_failure.dart';
import 'package:caribe_tour/domain/auth/interfaces/i_auth_facade.dart';
import 'package:caribe_tour/domain/auth/interfaces/i_user_repository.dart';
import 'package:caribe_tour/domain/auth/local_domain_user.dart';
import 'package:caribe_tour/domain/auth/value_objects.dart';
import 'package:caribe_tour/domain/core/value_object.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'register_form_event.dart';
part 'register_form_state.dart';
part 'register_form_bloc.freezed.dart';

@injectable
class RegisterFormBloc extends Bloc<RegisterFormEvent, RegisterFormState> {
  final IAuthFacade _authFacade;
  final IUserRepository _userRepository;

  RegisterFormBloc(
    this._authFacade,
    this._userRepository,
  ) : super(RegisterFormState.initial());

  @override
  Stream<RegisterFormState> mapEventToState(RegisterFormEvent event) async* {
    yield* event.map(
      emailChanged: (e) async* {
        yield state.copyWith(
          emailAddress: EmailAddress(e.email),
          authFailureOrSuccessOption: none(),
        );
      },
      passwordChanged: (e) async* {
        yield state.copyWith(
          password: Password(e.password),
          authFailureOrSuccessOption: none(),
        );
      },
      firstNameChanged: (e) async* {
        yield state.copyWith(
          firstName: Name(e.firstName),
          authFailureOrSuccessOption: none(),
        );
      },
      lastNameChanged: (e) async* {
        yield state.copyWith(
          lastName: Name(e.lastName),
          authFailureOrSuccessOption: none(),
        );
      },
      genderChanged: (e) async* {
        yield state.copyWith(
          gender: Gender(e.gender),
          authFailureOrSuccessOption: none(),
        );
      },
      birthdayChanged: (e) async* {
        yield state.copyWith(
          birthday: optionOf(e.birthday),
          authFailureOrSuccessOption: none(),
        );
      },
      profilePictureChanged: (e) async* {
        yield state.copyWith(
          profileImageOption: optionOf(e.image),
          authFailureOrSuccessOption: none(),
        );
      },
      registerUser: (e) async* {
        Either<AuthFailure, String> failureOrSuccess;

        final isEmailValid = state.emailAddress.isValid();
        final isPasswordValid = state.password.isValid();
        final isFirstNameValid = state.firstName.isValid();
        final isLastNameValid = state.lastName.isValid();
        final isGenderValid = state.gender.isValid();
        final isProfileImageValid = state.profileImageOption.isSome();
        final isBirthdayValid = state.birthday.fold(() => false, (_) => true);

        final allFieldsValid = isEmailValid &&
            isPasswordValid &&
            isFirstNameValid &&
            isLastNameValid &&
            isGenderValid &&
            isProfileImageValid &&
            isBirthdayValid;

        if (allFieldsValid) {
          yield state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          );

          failureOrSuccess = await _authFacade.registerWithEmailAndPassword(
            emailAddress: state.emailAddress,
            password: state.password,
          );

          if (failureOrSuccess.isRight()) {
            final userId = failureOrSuccess.getOrElse(() => null);

            await _userRepository.saveUserInformation(
              LocalDomainUser(
                id: UniqueId.fromUniqueString(userId),
                email: state.emailAddress,
                firstName: state.firstName,
                lastName: state.lastName,
                birthday: state.birthday.getOrElse(() => null),
                gender: state.gender,
                isGuide: e.isGuide,
                phone: state.phone,
                department: state.department,
              ),
              state.profileImageOption.getOrElse(() => null),
            );
          }
        }

        if (state.profileImageOption.isNone()) {
          failureOrSuccess = left(const AuthFailure.invalidProfileImage());
        }

        yield state.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(failureOrSuccess),
        );
      },
      phoneChanged: (e) async* {
        yield state.copyWith(
          phone: e.phone,
        );
      },
      depChanged: (e) async* {
        print(e.dep);
        yield state.copyWith(department: e.dep);
      },
    );
  }
}
