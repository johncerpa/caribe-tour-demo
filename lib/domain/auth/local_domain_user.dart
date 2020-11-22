import 'package:caribe_tour/domain/auth/value_objects.dart';
import 'package:caribe_tour/domain/core/value_object.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_domain_user.freezed.dart';

/// Esta clase es usada para obtener la información del usuario, esto permite registrar y mostrar la información.
/// A diferencia de [DomainUser], esta clase no se usa para ingresar a la aplicación.
@freezed
abstract class LocalDomainUser with _$LocalDomainUser {
  const factory LocalDomainUser({
    /// [id] es un objeto validado, contiene un [String] y es generado automáticamente.
    ///
    /// Este se genera automáticamente por medio de [Uuid].
    /// En caso de ya existir el id se instancia un objeto de tipo [Uuid].
    @required UniqueId id,

    /// [firstName] es el nombre del usuario, es un objeto validado de clase [Name] y contiene un [String].
    ///
    /// Este valida que el nombre no sea vacio y su longitud sea menor o igual que `90`.
    /// En caso de no ser valido retorna un [ValueFailure<String>] por medio de [invalidName(failedValue: name)].
    @required Name firstName,

    /// [lastName] es el apellido del usuario, es un objeto validado de clase [Name] y contiene un [String].
    ///
    /// Este valida que el nombre no sea vacio y su longitud sea menor o igual que `90`.
    /// En caso de no ser valido retorna un [ValueFailure<String>] por medio de [invalidName(failedValue: name)].
    @required Name lastName,

    /// [email] es el correo del usuario, es un objeto validado de clase [EmailAddress] y contiene un [String].
    ///
    /// Este valida que el correo tenga la estructura correcta mediante RegEx.
    /// En caso de no ser valido retorna un [ValueFailure<String>].
    @required EmailAddress email,

    /// [birthday] es un objeto de clase [DateTime] para obtener la fecha de nacimiento del usuario.
    @required DateTime birthday,

    /// [gender] es el genero del usuario, es un objeto validado de clase [Gender] y contiene un [String].
    ///
    /// En este se valida que el genero tenga una longitud mayor a 0.
    @required Gender gender,

    /// [isGuide] es una variable primitiva de tipo [bool], esta es usada para diferenciar a los usuarios entre turistas y guías.
    @required bool isGuide,

    /// [phone] es una variable primitiva de tipo [String], esta es usada para obtener el teléfono del usuario.
    String phone,

    /// [profileImageUrl] es una variable dinámica, esta proviene de Firestore y es usada para mostrar la imagen subida por el usuario.
    ///
    /// Esta variable debe ser transformada a [String] para obtener la URL.
    dynamic profileImageUrl,
    String department,
  }) = _LocalDomainUser;
}
