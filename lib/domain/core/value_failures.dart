import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failures.freezed.dart';

/// Esta clase genérica ayuda a indicar el tipo de error de un objeto validado.
@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  /// Indica que el valor usado como correo electrónico es inválido.
  const factory ValueFailure.invalidEmail({
    @required T failedValue,
  }) = InvalidEmail<T>;

  /// Indica que el valor usado como contraseña es inválido.
  const factory ValueFailure.shortPassword({
    @required T failedValue,
  }) = ShortPassword<T>;

  /// Indica que el valor usado como nombre es inválido.
  const factory ValueFailure.invalidName({
    @required T failedValue,
  }) = InvalidName<T>;

  /// Indica que el valor usado como género es inválido.
  const factory ValueFailure.invalidGender({
    @required T failedValue,
  }) = InvalidGender<T>;
}
