import 'package:dartz/dartz.dart';
import 'package:caribe_tour/domain/core/value_failures.dart';

/// Método encargado de validar el correo electrónico del usuario mediante RegEx
///
/// [input] es el correo electrónico.
Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex = r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

/// Método encargado de validar la contraseña del usuario.
///
/// Este valida que la contraseña tenga la longitud mínima requerida.
/// [input] es la contraseña.
Either<ValueFailure<String>, String> validatePassword(String input) {
  const minPasswordLength = 6;

  if (input.length >= minPasswordLength) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
}

/// Método enargado de validar el nombre del usuario.
///
/// Esta valida que el nombre no este vació y que su longitudad sea menor o igual a `90`.
/// [input] es el nombre o apellido del usuario.
Either<ValueFailure<String>, String> validateName(String input) {
  if (input.isNotEmpty && input.length <= 90) {
    return right(input);
  } else {
    return left(ValueFailure.invalidName(failedValue: input));
  }
}

/// Método enargado de validar el genero del usuario.
///
/// Esta valida que el genero no este vació.
/// [input] es el nombre o apellido del usuario.
Either<ValueFailure<String>, String> validateGender(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.invalidGender(failedValue: input));
  }
}
