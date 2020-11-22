part of 'register_form_bloc.dart';

@freezed
abstract class RegisterFormState with _$RegisterFormState {
  const factory RegisterFormState({
    @required EmailAddress emailAddress,
    @required Password password,
    @required Name firstName,
    @required Name lastName,
    @required Gender gender,
    @required Option<DateTime> birthday,
    @required Option<File> profileImageOption,
    @required bool showErrorMessages,
    @required bool isSubmitting,
    @required bool isGuide,
    @required String phone,
    @required Option<Either<AuthFailure, String>> authFailureOrSuccessOption,
    @required String department,
  }) = _SignInFormState;

  factory RegisterFormState.initial() => RegisterFormState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        firstName: Name(''),
        lastName: Name(''),
        gender: Gender(''),
        birthday: none(),
        profileImageOption: none(),
        showErrorMessages: false,
        isSubmitting: false,
        isGuide: false,
        phone: "",
        department: "",
        authFailureOrSuccessOption: none(),
      );
}
