import 'dart:io';
import 'package:caribe_tour/domain/auth/auth_failure.dart';
import 'package:caribe_tour/domain/auth/local_domain_user.dart';
import 'package:dartz/dartz.dart';

/// Clase encargada de manejar todo lo relacionado con los usuarios en la base de datos.
abstract class IUserRepository {
  /// Método asíncrono encargado de guardar información del usuario en la base de datos.
  ///
  /// [user] es un objeto validado de tipo [LocalDomainUser].
  /// [profileImage] es un archivo de tipo [File] el cual contiene la imagen de perfil del usuario.
  /// Retorna un [Either<AuthFailure, Unit>], [AuthFailure] indica el tipo de error y [Unit] indica que se guardó la información sin problema.
  Future<Either<AuthFailure, Unit>> saveUserInformation(
    LocalDomainUser user,
    File profileImage,
  );

  /// Método asíncrono encargado de obtener una lista de turistas desde la base de datos.
  Future<List<LocalDomainUser>> getTourist();

  /// Método asíncrono encargado de guardar la información del guía en la base de datos.
  ///
  /// [user] es un objeto validado de tipo [LocalDomainUser].
  /// [profileImage] es un archivo de tipo [File] el cual contiene la imagen de perfil del usuario.
  /// Retorna un [Either<AuthFailure, Unit>], [AuthFailure] indica el tipo de error y [Unit] indica que se guardó la información sin problema.
  Future<Either<AuthFailure, Unit>> saveGuideInformation(LocalDomainUser user, File profileIamge);

  Future<bool> saveUserProfileImage(File profileImage, String userId);

  /// Método asíncrono encargado de obtener la información del usuario desde la base de datos.
  ///
  /// Retorna un [Either<AuthFailure, LocalDomainUser>], [AuthFailure] indica el tipo de error y [LocalDomainUser] indica que se obtuvó la información sin problema.
  Future<Either<AuthFailure, LocalDomainUser>> getUserInformation();

  /// Método asíncrono encargado de obtener la URL de la imagen de perfil del usuario.
  ///
  /// [userId] es un `String` que indica la identificación del usuario.
  /// Retorna un `dynamic` que posteriormente sera transformado a `String`
  Future<dynamic> getProfileImageUrl(String userId);
}
