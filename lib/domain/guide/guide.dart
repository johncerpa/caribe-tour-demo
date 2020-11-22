import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'guide.freezed.dart';
part 'guide.g.dart';

/// Clase de datos para obtener la información de un guía.
@freezed
abstract class Guide with _$Guide {
  const factory Guide({
    /// [firstName] es el nombre del guia.
    @required String firstName,

    /// [lastName] es el apellido del guia.
    @required String lastName,

    /// [email] es el correo electrónico del guia.
    @required String email,

    /// [gender] es el genero del guia.
    @required String gender,

    /// [phone] es el número telefónico del guia.
    String phone,

    /// [profileImageUrl] es la URL de la imagen de perfil del guia.
    String profileImageUrl,

    /// [rating] es la puntuación general del guia.
    double rating,
    String department,
  }) = _Guide;

  factory Guide.fromJson(Map<String, dynamic> json) {
    return _$GuideFromJson(json);
  }
}
