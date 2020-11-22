part of 'register_form_bloc.dart';

@freezed
abstract class RegisterFormEvent with _$RegisterFormEvent {
  const factory RegisterFormEvent.emailChanged(String email) = EmailChanged;
  const factory RegisterFormEvent.passwordChanged(String password) =
      PasswordChanged;

  const factory RegisterFormEvent.firstNameChanged(String firstName) =
      FirstNameChanged;

  const factory RegisterFormEvent.lastNameChanged(String lastName) =
      LastNameChanged;

  const factory RegisterFormEvent.genderChanged(String gender) = GenderChanged;

  const factory RegisterFormEvent.birthdayChanged(DateTime birthday) =
      BirthdayChanged;
  const factory RegisterFormEvent.phoneChanged(String phone) = PhoneChanged;

  const factory RegisterFormEvent.profilePictureChanged(File image) =
      ProfilePictureChanged;

  const factory RegisterFormEvent.registerUser(bool isGuide) = RegisterUser;
  const factory RegisterFormEvent.depChanged(String dep) = DepChanged;
}
