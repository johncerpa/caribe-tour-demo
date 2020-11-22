import 'package:caribe_tour/domain/core/value_failures.dart';
import 'package:caribe_tour/domain/core/value_object.dart';
import 'package:caribe_tour/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';

/// Esta clase es usada para validar el correo electrónico del usuario.
///
/// Esta hereda de [ValueObject<String>] y se encarga de contener y validar el [String] del correo electrónico del usuario.
/// [Either<ValueFailure<String>, String>] contiene dos tipos, [ValueFailure<String>] y [String]
/// Si [Either] retorna `left()` obtenemos [ValueFailure<String>], lo cual indica que el correo electrónico es inválido.
/// Si [Either] retorna `right()` obtenemos [String], lo cual indica que el correo electrónico es válido.
class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String emailInput) {
    assert(emailInput != null);
    return EmailAddress._(validateEmailAddress(emailInput));
  }

  const EmailAddress._(this.value);
}

/// Esta clase es usada para validar la contraseña del usuario.
///
/// Esta hereda de [ValueObject<String>] y se encarga de contener y validar el [String] de la contraseña del usuario.
/// [Either<ValueFailure<String>, String>] contiene dos tipos, [ValueFailure<String>] y [String]
/// Si [Either] retorna `left()` obtenemos [ValueFailure<String>], lo cual indica que la contraseña es inválida.
/// Si [Either] retorna `right()` obtenemos [String], lo cual indica que la contraseña es válida.
class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String passwordInput) {
    assert(passwordInput != null);
    return Password._(validatePassword(passwordInput));
  }

  const Password._(this.value);
}

/// Esta clase es usada para validar el nombre del usuario.
///
/// Esta hereda de [ValueObject<String>] y se encarga de contener y validar el [String] nombre del usuario.
/// [Either<ValueFailure<String>, String>] contiene dos tipos, [ValueFailure<String>] y [String]
/// Si [Either] retorna `left()` obtenemos [ValueFailure<String>], lo cual indica que el nombre es inválido.
/// Si [Either] retorna `right()` obtenemos [String], lo cual indica que el nombre es válido.
class Name extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Name(String nameInput) {
    assert(nameInput != null);
    return Name._(validateName(nameInput));
  }

  const Name._(this.value);
}

/// Esta clase es usada para validar el genero del usuario.
///
/// Esta hereda de [ValueObject<String>] y se encarga de contener y validar el [String] genero del usuario.
/// [Either<ValueFailure<String>, String>] contiene dos tipos, [ValueFailure<String>] y [String]
/// Si [Either] retorna `left()` obtenemos [ValueFailure<String>], lo cual indica que el genero es inválido.
/// Si [Either] retorna `right()` obtenemos [String], lo cual indica que el genero es válido.
class Gender extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Gender(String genderInput) {
    assert(genderInput != null);
    return Gender._(validateGender(genderInput));
  }

  const Gender._(this.value);
}
