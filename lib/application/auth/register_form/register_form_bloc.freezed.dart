// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'register_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$RegisterFormEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result firstNameChanged(String firstName),
    @required Result lastNameChanged(String lastName),
    @required Result genderChanged(String gender),
    @required Result birthdayChanged(DateTime birthday),
    @required Result phoneChanged(String phone),
    @required Result profilePictureChanged(File image),
    @required Result registerUser(bool isGuide),
    @required Result depChanged(String dep),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result firstNameChanged(String firstName),
    Result lastNameChanged(String lastName),
    Result genderChanged(String gender),
    Result birthdayChanged(DateTime birthday),
    Result phoneChanged(String phone),
    Result profilePictureChanged(File image),
    Result registerUser(bool isGuide),
    Result depChanged(String dep),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result firstNameChanged(FirstNameChanged value),
    @required Result lastNameChanged(LastNameChanged value),
    @required Result genderChanged(GenderChanged value),
    @required Result birthdayChanged(BirthdayChanged value),
    @required Result phoneChanged(PhoneChanged value),
    @required Result profilePictureChanged(ProfilePictureChanged value),
    @required Result registerUser(RegisterUser value),
    @required Result depChanged(DepChanged value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result firstNameChanged(FirstNameChanged value),
    Result lastNameChanged(LastNameChanged value),
    Result genderChanged(GenderChanged value),
    Result birthdayChanged(BirthdayChanged value),
    Result phoneChanged(PhoneChanged value),
    Result profilePictureChanged(ProfilePictureChanged value),
    Result registerUser(RegisterUser value),
    Result depChanged(DepChanged value),
    @required Result orElse(),
  });
}

class _$RegisterFormEventTearOff {
  const _$RegisterFormEventTearOff();

  EmailChanged emailChanged(String email) {
    return EmailChanged(
      email,
    );
  }

  PasswordChanged passwordChanged(String password) {
    return PasswordChanged(
      password,
    );
  }

  FirstNameChanged firstNameChanged(String firstName) {
    return FirstNameChanged(
      firstName,
    );
  }

  LastNameChanged lastNameChanged(String lastName) {
    return LastNameChanged(
      lastName,
    );
  }

  GenderChanged genderChanged(String gender) {
    return GenderChanged(
      gender,
    );
  }

  BirthdayChanged birthdayChanged(DateTime birthday) {
    return BirthdayChanged(
      birthday,
    );
  }

  PhoneChanged phoneChanged(String phone) {
    return PhoneChanged(
      phone,
    );
  }

  ProfilePictureChanged profilePictureChanged(File image) {
    return ProfilePictureChanged(
      image,
    );
  }

  RegisterUser registerUser(bool isGuide) {
    return RegisterUser(
      isGuide,
    );
  }

  DepChanged depChanged(String dep) {
    return DepChanged(
      dep,
    );
  }
}

const $RegisterFormEvent = _$RegisterFormEventTearOff();

class _$EmailChanged implements EmailChanged {
  const _$EmailChanged(this.email) : assert(email != null);

  @override
  final String email;

  @override
  String toString() {
    return 'RegisterFormEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmailChanged &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @override
  _$EmailChanged copyWith({
    Object email = freezed,
  }) {
    return _$EmailChanged(
      email == freezed ? this.email : email as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result firstNameChanged(String firstName),
    @required Result lastNameChanged(String lastName),
    @required Result genderChanged(String gender),
    @required Result birthdayChanged(DateTime birthday),
    @required Result phoneChanged(String phone),
    @required Result profilePictureChanged(File image),
    @required Result registerUser(bool isGuide),
    @required Result depChanged(String dep),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(firstNameChanged != null);
    assert(lastNameChanged != null);
    assert(genderChanged != null);
    assert(birthdayChanged != null);
    assert(phoneChanged != null);
    assert(profilePictureChanged != null);
    assert(registerUser != null);
    assert(depChanged != null);
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result firstNameChanged(String firstName),
    Result lastNameChanged(String lastName),
    Result genderChanged(String gender),
    Result birthdayChanged(DateTime birthday),
    Result phoneChanged(String phone),
    Result profilePictureChanged(File image),
    Result registerUser(bool isGuide),
    Result depChanged(String dep),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result firstNameChanged(FirstNameChanged value),
    @required Result lastNameChanged(LastNameChanged value),
    @required Result genderChanged(GenderChanged value),
    @required Result birthdayChanged(BirthdayChanged value),
    @required Result phoneChanged(PhoneChanged value),
    @required Result profilePictureChanged(ProfilePictureChanged value),
    @required Result registerUser(RegisterUser value),
    @required Result depChanged(DepChanged value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(firstNameChanged != null);
    assert(lastNameChanged != null);
    assert(genderChanged != null);
    assert(birthdayChanged != null);
    assert(phoneChanged != null);
    assert(profilePictureChanged != null);
    assert(registerUser != null);
    assert(depChanged != null);
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result firstNameChanged(FirstNameChanged value),
    Result lastNameChanged(LastNameChanged value),
    Result genderChanged(GenderChanged value),
    Result birthdayChanged(BirthdayChanged value),
    Result phoneChanged(PhoneChanged value),
    Result profilePictureChanged(ProfilePictureChanged value),
    Result registerUser(RegisterUser value),
    Result depChanged(DepChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements RegisterFormEvent {
  const factory EmailChanged(String email) = _$EmailChanged;

  String get email;

  EmailChanged copyWith({String email});
}

class _$PasswordChanged implements PasswordChanged {
  const _$PasswordChanged(this.password) : assert(password != null);

  @override
  final String password;

  @override
  String toString() {
    return 'RegisterFormEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordChanged &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(password);

  @override
  _$PasswordChanged copyWith({
    Object password = freezed,
  }) {
    return _$PasswordChanged(
      password == freezed ? this.password : password as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result firstNameChanged(String firstName),
    @required Result lastNameChanged(String lastName),
    @required Result genderChanged(String gender),
    @required Result birthdayChanged(DateTime birthday),
    @required Result phoneChanged(String phone),
    @required Result profilePictureChanged(File image),
    @required Result registerUser(bool isGuide),
    @required Result depChanged(String dep),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(firstNameChanged != null);
    assert(lastNameChanged != null);
    assert(genderChanged != null);
    assert(birthdayChanged != null);
    assert(phoneChanged != null);
    assert(profilePictureChanged != null);
    assert(registerUser != null);
    assert(depChanged != null);
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result firstNameChanged(String firstName),
    Result lastNameChanged(String lastName),
    Result genderChanged(String gender),
    Result birthdayChanged(DateTime birthday),
    Result phoneChanged(String phone),
    Result profilePictureChanged(File image),
    Result registerUser(bool isGuide),
    Result depChanged(String dep),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result firstNameChanged(FirstNameChanged value),
    @required Result lastNameChanged(LastNameChanged value),
    @required Result genderChanged(GenderChanged value),
    @required Result birthdayChanged(BirthdayChanged value),
    @required Result phoneChanged(PhoneChanged value),
    @required Result profilePictureChanged(ProfilePictureChanged value),
    @required Result registerUser(RegisterUser value),
    @required Result depChanged(DepChanged value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(firstNameChanged != null);
    assert(lastNameChanged != null);
    assert(genderChanged != null);
    assert(birthdayChanged != null);
    assert(phoneChanged != null);
    assert(profilePictureChanged != null);
    assert(registerUser != null);
    assert(depChanged != null);
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result firstNameChanged(FirstNameChanged value),
    Result lastNameChanged(LastNameChanged value),
    Result genderChanged(GenderChanged value),
    Result birthdayChanged(BirthdayChanged value),
    Result phoneChanged(PhoneChanged value),
    Result profilePictureChanged(ProfilePictureChanged value),
    Result registerUser(RegisterUser value),
    Result depChanged(DepChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordChanged implements RegisterFormEvent {
  const factory PasswordChanged(String password) = _$PasswordChanged;

  String get password;

  PasswordChanged copyWith({String password});
}

class _$FirstNameChanged implements FirstNameChanged {
  const _$FirstNameChanged(this.firstName) : assert(firstName != null);

  @override
  final String firstName;

  @override
  String toString() {
    return 'RegisterFormEvent.firstNameChanged(firstName: $firstName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FirstNameChanged &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(firstName);

  @override
  _$FirstNameChanged copyWith({
    Object firstName = freezed,
  }) {
    return _$FirstNameChanged(
      firstName == freezed ? this.firstName : firstName as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result firstNameChanged(String firstName),
    @required Result lastNameChanged(String lastName),
    @required Result genderChanged(String gender),
    @required Result birthdayChanged(DateTime birthday),
    @required Result phoneChanged(String phone),
    @required Result profilePictureChanged(File image),
    @required Result registerUser(bool isGuide),
    @required Result depChanged(String dep),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(firstNameChanged != null);
    assert(lastNameChanged != null);
    assert(genderChanged != null);
    assert(birthdayChanged != null);
    assert(phoneChanged != null);
    assert(profilePictureChanged != null);
    assert(registerUser != null);
    assert(depChanged != null);
    return firstNameChanged(firstName);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result firstNameChanged(String firstName),
    Result lastNameChanged(String lastName),
    Result genderChanged(String gender),
    Result birthdayChanged(DateTime birthday),
    Result phoneChanged(String phone),
    Result profilePictureChanged(File image),
    Result registerUser(bool isGuide),
    Result depChanged(String dep),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (firstNameChanged != null) {
      return firstNameChanged(firstName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result firstNameChanged(FirstNameChanged value),
    @required Result lastNameChanged(LastNameChanged value),
    @required Result genderChanged(GenderChanged value),
    @required Result birthdayChanged(BirthdayChanged value),
    @required Result phoneChanged(PhoneChanged value),
    @required Result profilePictureChanged(ProfilePictureChanged value),
    @required Result registerUser(RegisterUser value),
    @required Result depChanged(DepChanged value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(firstNameChanged != null);
    assert(lastNameChanged != null);
    assert(genderChanged != null);
    assert(birthdayChanged != null);
    assert(phoneChanged != null);
    assert(profilePictureChanged != null);
    assert(registerUser != null);
    assert(depChanged != null);
    return firstNameChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result firstNameChanged(FirstNameChanged value),
    Result lastNameChanged(LastNameChanged value),
    Result genderChanged(GenderChanged value),
    Result birthdayChanged(BirthdayChanged value),
    Result phoneChanged(PhoneChanged value),
    Result profilePictureChanged(ProfilePictureChanged value),
    Result registerUser(RegisterUser value),
    Result depChanged(DepChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (firstNameChanged != null) {
      return firstNameChanged(this);
    }
    return orElse();
  }
}

abstract class FirstNameChanged implements RegisterFormEvent {
  const factory FirstNameChanged(String firstName) = _$FirstNameChanged;

  String get firstName;

  FirstNameChanged copyWith({String firstName});
}

class _$LastNameChanged implements LastNameChanged {
  const _$LastNameChanged(this.lastName) : assert(lastName != null);

  @override
  final String lastName;

  @override
  String toString() {
    return 'RegisterFormEvent.lastNameChanged(lastName: $lastName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LastNameChanged &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(lastName);

  @override
  _$LastNameChanged copyWith({
    Object lastName = freezed,
  }) {
    return _$LastNameChanged(
      lastName == freezed ? this.lastName : lastName as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result firstNameChanged(String firstName),
    @required Result lastNameChanged(String lastName),
    @required Result genderChanged(String gender),
    @required Result birthdayChanged(DateTime birthday),
    @required Result phoneChanged(String phone),
    @required Result profilePictureChanged(File image),
    @required Result registerUser(bool isGuide),
    @required Result depChanged(String dep),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(firstNameChanged != null);
    assert(lastNameChanged != null);
    assert(genderChanged != null);
    assert(birthdayChanged != null);
    assert(phoneChanged != null);
    assert(profilePictureChanged != null);
    assert(registerUser != null);
    assert(depChanged != null);
    return lastNameChanged(lastName);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result firstNameChanged(String firstName),
    Result lastNameChanged(String lastName),
    Result genderChanged(String gender),
    Result birthdayChanged(DateTime birthday),
    Result phoneChanged(String phone),
    Result profilePictureChanged(File image),
    Result registerUser(bool isGuide),
    Result depChanged(String dep),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (lastNameChanged != null) {
      return lastNameChanged(lastName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result firstNameChanged(FirstNameChanged value),
    @required Result lastNameChanged(LastNameChanged value),
    @required Result genderChanged(GenderChanged value),
    @required Result birthdayChanged(BirthdayChanged value),
    @required Result phoneChanged(PhoneChanged value),
    @required Result profilePictureChanged(ProfilePictureChanged value),
    @required Result registerUser(RegisterUser value),
    @required Result depChanged(DepChanged value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(firstNameChanged != null);
    assert(lastNameChanged != null);
    assert(genderChanged != null);
    assert(birthdayChanged != null);
    assert(phoneChanged != null);
    assert(profilePictureChanged != null);
    assert(registerUser != null);
    assert(depChanged != null);
    return lastNameChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result firstNameChanged(FirstNameChanged value),
    Result lastNameChanged(LastNameChanged value),
    Result genderChanged(GenderChanged value),
    Result birthdayChanged(BirthdayChanged value),
    Result phoneChanged(PhoneChanged value),
    Result profilePictureChanged(ProfilePictureChanged value),
    Result registerUser(RegisterUser value),
    Result depChanged(DepChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (lastNameChanged != null) {
      return lastNameChanged(this);
    }
    return orElse();
  }
}

abstract class LastNameChanged implements RegisterFormEvent {
  const factory LastNameChanged(String lastName) = _$LastNameChanged;

  String get lastName;

  LastNameChanged copyWith({String lastName});
}

class _$GenderChanged implements GenderChanged {
  const _$GenderChanged(this.gender) : assert(gender != null);

  @override
  final String gender;

  @override
  String toString() {
    return 'RegisterFormEvent.genderChanged(gender: $gender)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GenderChanged &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(gender);

  @override
  _$GenderChanged copyWith({
    Object gender = freezed,
  }) {
    return _$GenderChanged(
      gender == freezed ? this.gender : gender as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result firstNameChanged(String firstName),
    @required Result lastNameChanged(String lastName),
    @required Result genderChanged(String gender),
    @required Result birthdayChanged(DateTime birthday),
    @required Result phoneChanged(String phone),
    @required Result profilePictureChanged(File image),
    @required Result registerUser(bool isGuide),
    @required Result depChanged(String dep),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(firstNameChanged != null);
    assert(lastNameChanged != null);
    assert(genderChanged != null);
    assert(birthdayChanged != null);
    assert(phoneChanged != null);
    assert(profilePictureChanged != null);
    assert(registerUser != null);
    assert(depChanged != null);
    return genderChanged(gender);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result firstNameChanged(String firstName),
    Result lastNameChanged(String lastName),
    Result genderChanged(String gender),
    Result birthdayChanged(DateTime birthday),
    Result phoneChanged(String phone),
    Result profilePictureChanged(File image),
    Result registerUser(bool isGuide),
    Result depChanged(String dep),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (genderChanged != null) {
      return genderChanged(gender);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result firstNameChanged(FirstNameChanged value),
    @required Result lastNameChanged(LastNameChanged value),
    @required Result genderChanged(GenderChanged value),
    @required Result birthdayChanged(BirthdayChanged value),
    @required Result phoneChanged(PhoneChanged value),
    @required Result profilePictureChanged(ProfilePictureChanged value),
    @required Result registerUser(RegisterUser value),
    @required Result depChanged(DepChanged value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(firstNameChanged != null);
    assert(lastNameChanged != null);
    assert(genderChanged != null);
    assert(birthdayChanged != null);
    assert(phoneChanged != null);
    assert(profilePictureChanged != null);
    assert(registerUser != null);
    assert(depChanged != null);
    return genderChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result firstNameChanged(FirstNameChanged value),
    Result lastNameChanged(LastNameChanged value),
    Result genderChanged(GenderChanged value),
    Result birthdayChanged(BirthdayChanged value),
    Result phoneChanged(PhoneChanged value),
    Result profilePictureChanged(ProfilePictureChanged value),
    Result registerUser(RegisterUser value),
    Result depChanged(DepChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (genderChanged != null) {
      return genderChanged(this);
    }
    return orElse();
  }
}

abstract class GenderChanged implements RegisterFormEvent {
  const factory GenderChanged(String gender) = _$GenderChanged;

  String get gender;

  GenderChanged copyWith({String gender});
}

class _$BirthdayChanged implements BirthdayChanged {
  const _$BirthdayChanged(this.birthday) : assert(birthday != null);

  @override
  final DateTime birthday;

  @override
  String toString() {
    return 'RegisterFormEvent.birthdayChanged(birthday: $birthday)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BirthdayChanged &&
            (identical(other.birthday, birthday) ||
                const DeepCollectionEquality()
                    .equals(other.birthday, birthday)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(birthday);

  @override
  _$BirthdayChanged copyWith({
    Object birthday = freezed,
  }) {
    return _$BirthdayChanged(
      birthday == freezed ? this.birthday : birthday as DateTime,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result firstNameChanged(String firstName),
    @required Result lastNameChanged(String lastName),
    @required Result genderChanged(String gender),
    @required Result birthdayChanged(DateTime birthday),
    @required Result phoneChanged(String phone),
    @required Result profilePictureChanged(File image),
    @required Result registerUser(bool isGuide),
    @required Result depChanged(String dep),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(firstNameChanged != null);
    assert(lastNameChanged != null);
    assert(genderChanged != null);
    assert(birthdayChanged != null);
    assert(phoneChanged != null);
    assert(profilePictureChanged != null);
    assert(registerUser != null);
    assert(depChanged != null);
    return birthdayChanged(birthday);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result firstNameChanged(String firstName),
    Result lastNameChanged(String lastName),
    Result genderChanged(String gender),
    Result birthdayChanged(DateTime birthday),
    Result phoneChanged(String phone),
    Result profilePictureChanged(File image),
    Result registerUser(bool isGuide),
    Result depChanged(String dep),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (birthdayChanged != null) {
      return birthdayChanged(birthday);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result firstNameChanged(FirstNameChanged value),
    @required Result lastNameChanged(LastNameChanged value),
    @required Result genderChanged(GenderChanged value),
    @required Result birthdayChanged(BirthdayChanged value),
    @required Result phoneChanged(PhoneChanged value),
    @required Result profilePictureChanged(ProfilePictureChanged value),
    @required Result registerUser(RegisterUser value),
    @required Result depChanged(DepChanged value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(firstNameChanged != null);
    assert(lastNameChanged != null);
    assert(genderChanged != null);
    assert(birthdayChanged != null);
    assert(phoneChanged != null);
    assert(profilePictureChanged != null);
    assert(registerUser != null);
    assert(depChanged != null);
    return birthdayChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result firstNameChanged(FirstNameChanged value),
    Result lastNameChanged(LastNameChanged value),
    Result genderChanged(GenderChanged value),
    Result birthdayChanged(BirthdayChanged value),
    Result phoneChanged(PhoneChanged value),
    Result profilePictureChanged(ProfilePictureChanged value),
    Result registerUser(RegisterUser value),
    Result depChanged(DepChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (birthdayChanged != null) {
      return birthdayChanged(this);
    }
    return orElse();
  }
}

abstract class BirthdayChanged implements RegisterFormEvent {
  const factory BirthdayChanged(DateTime birthday) = _$BirthdayChanged;

  DateTime get birthday;

  BirthdayChanged copyWith({DateTime birthday});
}

class _$PhoneChanged implements PhoneChanged {
  const _$PhoneChanged(this.phone) : assert(phone != null);

  @override
  final String phone;

  @override
  String toString() {
    return 'RegisterFormEvent.phoneChanged(phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PhoneChanged &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(phone);

  @override
  _$PhoneChanged copyWith({
    Object phone = freezed,
  }) {
    return _$PhoneChanged(
      phone == freezed ? this.phone : phone as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result firstNameChanged(String firstName),
    @required Result lastNameChanged(String lastName),
    @required Result genderChanged(String gender),
    @required Result birthdayChanged(DateTime birthday),
    @required Result phoneChanged(String phone),
    @required Result profilePictureChanged(File image),
    @required Result registerUser(bool isGuide),
    @required Result depChanged(String dep),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(firstNameChanged != null);
    assert(lastNameChanged != null);
    assert(genderChanged != null);
    assert(birthdayChanged != null);
    assert(phoneChanged != null);
    assert(profilePictureChanged != null);
    assert(registerUser != null);
    assert(depChanged != null);
    return phoneChanged(phone);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result firstNameChanged(String firstName),
    Result lastNameChanged(String lastName),
    Result genderChanged(String gender),
    Result birthdayChanged(DateTime birthday),
    Result phoneChanged(String phone),
    Result profilePictureChanged(File image),
    Result registerUser(bool isGuide),
    Result depChanged(String dep),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (phoneChanged != null) {
      return phoneChanged(phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result firstNameChanged(FirstNameChanged value),
    @required Result lastNameChanged(LastNameChanged value),
    @required Result genderChanged(GenderChanged value),
    @required Result birthdayChanged(BirthdayChanged value),
    @required Result phoneChanged(PhoneChanged value),
    @required Result profilePictureChanged(ProfilePictureChanged value),
    @required Result registerUser(RegisterUser value),
    @required Result depChanged(DepChanged value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(firstNameChanged != null);
    assert(lastNameChanged != null);
    assert(genderChanged != null);
    assert(birthdayChanged != null);
    assert(phoneChanged != null);
    assert(profilePictureChanged != null);
    assert(registerUser != null);
    assert(depChanged != null);
    return phoneChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result firstNameChanged(FirstNameChanged value),
    Result lastNameChanged(LastNameChanged value),
    Result genderChanged(GenderChanged value),
    Result birthdayChanged(BirthdayChanged value),
    Result phoneChanged(PhoneChanged value),
    Result profilePictureChanged(ProfilePictureChanged value),
    Result registerUser(RegisterUser value),
    Result depChanged(DepChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (phoneChanged != null) {
      return phoneChanged(this);
    }
    return orElse();
  }
}

abstract class PhoneChanged implements RegisterFormEvent {
  const factory PhoneChanged(String phone) = _$PhoneChanged;

  String get phone;

  PhoneChanged copyWith({String phone});
}

class _$ProfilePictureChanged implements ProfilePictureChanged {
  const _$ProfilePictureChanged(this.image) : assert(image != null);

  @override
  final File image;

  @override
  String toString() {
    return 'RegisterFormEvent.profilePictureChanged(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfilePictureChanged &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(image);

  @override
  _$ProfilePictureChanged copyWith({
    Object image = freezed,
  }) {
    return _$ProfilePictureChanged(
      image == freezed ? this.image : image as File,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result firstNameChanged(String firstName),
    @required Result lastNameChanged(String lastName),
    @required Result genderChanged(String gender),
    @required Result birthdayChanged(DateTime birthday),
    @required Result phoneChanged(String phone),
    @required Result profilePictureChanged(File image),
    @required Result registerUser(bool isGuide),
    @required Result depChanged(String dep),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(firstNameChanged != null);
    assert(lastNameChanged != null);
    assert(genderChanged != null);
    assert(birthdayChanged != null);
    assert(phoneChanged != null);
    assert(profilePictureChanged != null);
    assert(registerUser != null);
    assert(depChanged != null);
    return profilePictureChanged(image);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result firstNameChanged(String firstName),
    Result lastNameChanged(String lastName),
    Result genderChanged(String gender),
    Result birthdayChanged(DateTime birthday),
    Result phoneChanged(String phone),
    Result profilePictureChanged(File image),
    Result registerUser(bool isGuide),
    Result depChanged(String dep),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (profilePictureChanged != null) {
      return profilePictureChanged(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result firstNameChanged(FirstNameChanged value),
    @required Result lastNameChanged(LastNameChanged value),
    @required Result genderChanged(GenderChanged value),
    @required Result birthdayChanged(BirthdayChanged value),
    @required Result phoneChanged(PhoneChanged value),
    @required Result profilePictureChanged(ProfilePictureChanged value),
    @required Result registerUser(RegisterUser value),
    @required Result depChanged(DepChanged value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(firstNameChanged != null);
    assert(lastNameChanged != null);
    assert(genderChanged != null);
    assert(birthdayChanged != null);
    assert(phoneChanged != null);
    assert(profilePictureChanged != null);
    assert(registerUser != null);
    assert(depChanged != null);
    return profilePictureChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result firstNameChanged(FirstNameChanged value),
    Result lastNameChanged(LastNameChanged value),
    Result genderChanged(GenderChanged value),
    Result birthdayChanged(BirthdayChanged value),
    Result phoneChanged(PhoneChanged value),
    Result profilePictureChanged(ProfilePictureChanged value),
    Result registerUser(RegisterUser value),
    Result depChanged(DepChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (profilePictureChanged != null) {
      return profilePictureChanged(this);
    }
    return orElse();
  }
}

abstract class ProfilePictureChanged implements RegisterFormEvent {
  const factory ProfilePictureChanged(File image) = _$ProfilePictureChanged;

  File get image;

  ProfilePictureChanged copyWith({File image});
}

class _$RegisterUser implements RegisterUser {
  const _$RegisterUser(this.isGuide) : assert(isGuide != null);

  @override
  final bool isGuide;

  @override
  String toString() {
    return 'RegisterFormEvent.registerUser(isGuide: $isGuide)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegisterUser &&
            (identical(other.isGuide, isGuide) ||
                const DeepCollectionEquality().equals(other.isGuide, isGuide)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(isGuide);

  @override
  _$RegisterUser copyWith({
    Object isGuide = freezed,
  }) {
    return _$RegisterUser(
      isGuide == freezed ? this.isGuide : isGuide as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result firstNameChanged(String firstName),
    @required Result lastNameChanged(String lastName),
    @required Result genderChanged(String gender),
    @required Result birthdayChanged(DateTime birthday),
    @required Result phoneChanged(String phone),
    @required Result profilePictureChanged(File image),
    @required Result registerUser(bool isGuide),
    @required Result depChanged(String dep),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(firstNameChanged != null);
    assert(lastNameChanged != null);
    assert(genderChanged != null);
    assert(birthdayChanged != null);
    assert(phoneChanged != null);
    assert(profilePictureChanged != null);
    assert(registerUser != null);
    assert(depChanged != null);
    return registerUser(isGuide);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result firstNameChanged(String firstName),
    Result lastNameChanged(String lastName),
    Result genderChanged(String gender),
    Result birthdayChanged(DateTime birthday),
    Result phoneChanged(String phone),
    Result profilePictureChanged(File image),
    Result registerUser(bool isGuide),
    Result depChanged(String dep),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registerUser != null) {
      return registerUser(isGuide);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result firstNameChanged(FirstNameChanged value),
    @required Result lastNameChanged(LastNameChanged value),
    @required Result genderChanged(GenderChanged value),
    @required Result birthdayChanged(BirthdayChanged value),
    @required Result phoneChanged(PhoneChanged value),
    @required Result profilePictureChanged(ProfilePictureChanged value),
    @required Result registerUser(RegisterUser value),
    @required Result depChanged(DepChanged value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(firstNameChanged != null);
    assert(lastNameChanged != null);
    assert(genderChanged != null);
    assert(birthdayChanged != null);
    assert(phoneChanged != null);
    assert(profilePictureChanged != null);
    assert(registerUser != null);
    assert(depChanged != null);
    return registerUser(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result firstNameChanged(FirstNameChanged value),
    Result lastNameChanged(LastNameChanged value),
    Result genderChanged(GenderChanged value),
    Result birthdayChanged(BirthdayChanged value),
    Result phoneChanged(PhoneChanged value),
    Result profilePictureChanged(ProfilePictureChanged value),
    Result registerUser(RegisterUser value),
    Result depChanged(DepChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registerUser != null) {
      return registerUser(this);
    }
    return orElse();
  }
}

abstract class RegisterUser implements RegisterFormEvent {
  const factory RegisterUser(bool isGuide) = _$RegisterUser;

  bool get isGuide;

  RegisterUser copyWith({bool isGuide});
}

class _$DepChanged implements DepChanged {
  const _$DepChanged(this.dep) : assert(dep != null);

  @override
  final String dep;

  @override
  String toString() {
    return 'RegisterFormEvent.depChanged(dep: $dep)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DepChanged &&
            (identical(other.dep, dep) ||
                const DeepCollectionEquality().equals(other.dep, dep)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(dep);

  @override
  _$DepChanged copyWith({
    Object dep = freezed,
  }) {
    return _$DepChanged(
      dep == freezed ? this.dep : dep as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result firstNameChanged(String firstName),
    @required Result lastNameChanged(String lastName),
    @required Result genderChanged(String gender),
    @required Result birthdayChanged(DateTime birthday),
    @required Result phoneChanged(String phone),
    @required Result profilePictureChanged(File image),
    @required Result registerUser(bool isGuide),
    @required Result depChanged(String dep),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(firstNameChanged != null);
    assert(lastNameChanged != null);
    assert(genderChanged != null);
    assert(birthdayChanged != null);
    assert(phoneChanged != null);
    assert(profilePictureChanged != null);
    assert(registerUser != null);
    assert(depChanged != null);
    return depChanged(dep);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result firstNameChanged(String firstName),
    Result lastNameChanged(String lastName),
    Result genderChanged(String gender),
    Result birthdayChanged(DateTime birthday),
    Result phoneChanged(String phone),
    Result profilePictureChanged(File image),
    Result registerUser(bool isGuide),
    Result depChanged(String dep),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (depChanged != null) {
      return depChanged(dep);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result firstNameChanged(FirstNameChanged value),
    @required Result lastNameChanged(LastNameChanged value),
    @required Result genderChanged(GenderChanged value),
    @required Result birthdayChanged(BirthdayChanged value),
    @required Result phoneChanged(PhoneChanged value),
    @required Result profilePictureChanged(ProfilePictureChanged value),
    @required Result registerUser(RegisterUser value),
    @required Result depChanged(DepChanged value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(firstNameChanged != null);
    assert(lastNameChanged != null);
    assert(genderChanged != null);
    assert(birthdayChanged != null);
    assert(phoneChanged != null);
    assert(profilePictureChanged != null);
    assert(registerUser != null);
    assert(depChanged != null);
    return depChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result firstNameChanged(FirstNameChanged value),
    Result lastNameChanged(LastNameChanged value),
    Result genderChanged(GenderChanged value),
    Result birthdayChanged(BirthdayChanged value),
    Result phoneChanged(PhoneChanged value),
    Result profilePictureChanged(ProfilePictureChanged value),
    Result registerUser(RegisterUser value),
    Result depChanged(DepChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (depChanged != null) {
      return depChanged(this);
    }
    return orElse();
  }
}

abstract class DepChanged implements RegisterFormEvent {
  const factory DepChanged(String dep) = _$DepChanged;

  String get dep;

  DepChanged copyWith({String dep});
}

mixin _$RegisterFormState {
  EmailAddress get emailAddress;
  Password get password;
  Name get firstName;
  Name get lastName;
  Gender get gender;
  Option<DateTime> get birthday;
  Option<File> get profileImageOption;
  bool get showErrorMessages;
  bool get isSubmitting;
  bool get isGuide;
  String get phone;
  Option<Either<AuthFailure, String>> get authFailureOrSuccessOption;
  String get department;

  RegisterFormState copyWith(
      {EmailAddress emailAddress,
      Password password,
      Name firstName,
      Name lastName,
      Gender gender,
      Option<DateTime> birthday,
      Option<File> profileImageOption,
      bool showErrorMessages,
      bool isSubmitting,
      bool isGuide,
      String phone,
      Option<Either<AuthFailure, String>> authFailureOrSuccessOption,
      String department});
}

class _$RegisterFormStateTearOff {
  const _$RegisterFormStateTearOff();

  _SignInFormState call(
      {@required EmailAddress emailAddress,
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
      @required String department}) {
    return _SignInFormState(
      emailAddress: emailAddress,
      password: password,
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      birthday: birthday,
      profileImageOption: profileImageOption,
      showErrorMessages: showErrorMessages,
      isSubmitting: isSubmitting,
      isGuide: isGuide,
      phone: phone,
      authFailureOrSuccessOption: authFailureOrSuccessOption,
      department: department,
    );
  }
}

const $RegisterFormState = _$RegisterFormStateTearOff();

class _$_SignInFormState implements _SignInFormState {
  const _$_SignInFormState(
      {@required this.emailAddress,
      @required this.password,
      @required this.firstName,
      @required this.lastName,
      @required this.gender,
      @required this.birthday,
      @required this.profileImageOption,
      @required this.showErrorMessages,
      @required this.isSubmitting,
      @required this.isGuide,
      @required this.phone,
      @required this.authFailureOrSuccessOption,
      @required this.department})
      : assert(emailAddress != null),
        assert(password != null),
        assert(firstName != null),
        assert(lastName != null),
        assert(gender != null),
        assert(birthday != null),
        assert(profileImageOption != null),
        assert(showErrorMessages != null),
        assert(isSubmitting != null),
        assert(isGuide != null),
        assert(phone != null),
        assert(authFailureOrSuccessOption != null),
        assert(department != null);

  @override
  final EmailAddress emailAddress;
  @override
  final Password password;
  @override
  final Name firstName;
  @override
  final Name lastName;
  @override
  final Gender gender;
  @override
  final Option<DateTime> birthday;
  @override
  final Option<File> profileImageOption;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final bool isGuide;
  @override
  final String phone;
  @override
  final Option<Either<AuthFailure, String>> authFailureOrSuccessOption;
  @override
  final String department;

  @override
  String toString() {
    return 'RegisterFormState(emailAddress: $emailAddress, password: $password, firstName: $firstName, lastName: $lastName, gender: $gender, birthday: $birthday, profileImageOption: $profileImageOption, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, isGuide: $isGuide, phone: $phone, authFailureOrSuccessOption: $authFailureOrSuccessOption, department: $department)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignInFormState &&
            (identical(other.emailAddress, emailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.emailAddress, emailAddress)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.birthday, birthday) ||
                const DeepCollectionEquality()
                    .equals(other.birthday, birthday)) &&
            (identical(other.profileImageOption, profileImageOption) ||
                const DeepCollectionEquality()
                    .equals(other.profileImageOption, profileImageOption)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.isGuide, isGuide) ||
                const DeepCollectionEquality()
                    .equals(other.isGuide, isGuide)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption)) &&
            (identical(other.department, department) ||
                const DeepCollectionEquality()
                    .equals(other.department, department)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(emailAddress) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(birthday) ^
      const DeepCollectionEquality().hash(profileImageOption) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(isGuide) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(authFailureOrSuccessOption) ^
      const DeepCollectionEquality().hash(department);

  @override
  _$_SignInFormState copyWith({
    Object emailAddress = freezed,
    Object password = freezed,
    Object firstName = freezed,
    Object lastName = freezed,
    Object gender = freezed,
    Object birthday = freezed,
    Object profileImageOption = freezed,
    Object showErrorMessages = freezed,
    Object isSubmitting = freezed,
    Object isGuide = freezed,
    Object phone = freezed,
    Object authFailureOrSuccessOption = freezed,
    Object department = freezed,
  }) {
    return _$_SignInFormState(
      emailAddress: emailAddress == freezed
          ? this.emailAddress
          : emailAddress as EmailAddress,
      password: password == freezed ? this.password : password as Password,
      firstName: firstName == freezed ? this.firstName : firstName as Name,
      lastName: lastName == freezed ? this.lastName : lastName as Name,
      gender: gender == freezed ? this.gender : gender as Gender,
      birthday:
          birthday == freezed ? this.birthday : birthday as Option<DateTime>,
      profileImageOption: profileImageOption == freezed
          ? this.profileImageOption
          : profileImageOption as Option<File>,
      showErrorMessages: showErrorMessages == freezed
          ? this.showErrorMessages
          : showErrorMessages as bool,
      isSubmitting:
          isSubmitting == freezed ? this.isSubmitting : isSubmitting as bool,
      isGuide: isGuide == freezed ? this.isGuide : isGuide as bool,
      phone: phone == freezed ? this.phone : phone as String,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? this.authFailureOrSuccessOption
          : authFailureOrSuccessOption as Option<Either<AuthFailure, String>>,
      department:
          department == freezed ? this.department : department as String,
    );
  }
}

abstract class _SignInFormState implements RegisterFormState {
  const factory _SignInFormState(
      {@required EmailAddress emailAddress,
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
      @required String department}) = _$_SignInFormState;

  @override
  EmailAddress get emailAddress;
  @override
  Password get password;
  @override
  Name get firstName;
  @override
  Name get lastName;
  @override
  Gender get gender;
  @override
  Option<DateTime> get birthday;
  @override
  Option<File> get profileImageOption;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  bool get isGuide;
  @override
  String get phone;
  @override
  Option<Either<AuthFailure, String>> get authFailureOrSuccessOption;
  @override
  String get department;

  @override
  _SignInFormState copyWith(
      {EmailAddress emailAddress,
      Password password,
      Name firstName,
      Name lastName,
      Gender gender,
      Option<DateTime> birthday,
      Option<File> profileImageOption,
      bool showErrorMessages,
      bool isSubmitting,
      bool isGuide,
      String phone,
      Option<Either<AuthFailure, String>> authFailureOrSuccessOption,
      String department});
}
