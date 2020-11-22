import 'package:caribe_tour/domain/auth/domain_user.dart';
import 'package:caribe_tour/domain/auth/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import '../auth_failure.dart';

/// Esta interfaz utiliza el patrón Facade para simplificar el manejo de la clase de Firebase Auth.
///
/// En esta interfaz se encuentran los métodos relevantes que necesita la aplicación para realizar la autenticación.
/// Las interfaces se encuentra en la capa de dominio porque son completamente independientes de dependencias de terceros.
abstract class IAuthFacade {
  /// Este método es usado para obtener el usuario que ha ingresado a la aplicación.
  Option<DomainUser> getSignedInUser();

  /// Este es un método asíncrono que se encarga de registrar al usuario en el sistema de usuarios de Firebae Auth.
  ///
  /// [emailAddress] es el correo electrónico del usuario.
  /// [password] es la contrsseña del usuario.
  Future<Either<AuthFailure, String>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  /// Este es un método asíncrono que se encarga de validar las credenciales del usuario para posteriormente ingresar a la aplicación.
  ///
  /// [emailAddress] es el correo electrónico del usuario.
  /// [password] es la contrsseña del usuario.
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  /// Este es un método asíncrono que se encarga de validar las credenciales del usuario mediante OAuth para posteriormente ingresar a la aplicación.
  ///
  /// Este método permite al usuario ingresar a la aplicación si cuenta con un correo electrónico de Google.
  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  /// Este es un método asíncrono que se encarga de borrar los datos locales del usuario de la aplicación y llevarlo a la página de ingreso.
  Future<void> signOut();
}
