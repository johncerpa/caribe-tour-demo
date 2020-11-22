import 'package:caribe_tour/domain/core/value_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import 'errors.dart';

/// Clase genérica inmutable para validar distintos valores.
@immutable
abstract class ValueObject<T> {
  const ValueObject();

  /// Esta clase tiene dos opciones, `left()` y `right()`.
  ///
  /// `left()` indica que el valor es inválido.
  /// `right()` indica que el valor es válido.
  Either<ValueFailure<T>, T> get value;

  /// Retorna [UnexpectedValueError] conteniendo el [ValueFailure].
  T getOrCrash() {
    return value.fold(
      (l) => throw UnexpectedValueError(l),
      (r) => r,
    );
  }

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (r) => right(unit));
  }

  /// Método helper que indica si el valor es válido o no.
  bool isValid() => value.isRight();

  @override
  String toString() => 'Value(value: $value)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

/// Clase helper para generar identificadores únicos.
class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueId() {
    return UniqueId._(right(Uuid().v1()));
  }

  /// En caso de que ya exista el identificador (cuando el usuario ya existe), se instancia el objeto con [uniqueId]
  factory UniqueId.fromUniqueString(String uniqueId) {
    assert(uniqueId != null);
    return UniqueId._(right(uniqueId));
  }

  const UniqueId._(this.value);
}
