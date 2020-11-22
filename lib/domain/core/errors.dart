import 'package:caribe_tour/domain/core/value_failures.dart';

/// Indica que ocurrió un error inesperado.
class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    return Error.safeToString(
      "Encountered a ValueFailure at an unrecoverable point. Terminating. Failure was: $valueFailure",
    );
  }
}

// Indica que ocurrió un error de autenticación, si el usuario no esta logueado no deja al usuario usar la aplicación.
class NotAuthenticatedError extends Error {}
