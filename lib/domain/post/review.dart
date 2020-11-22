import 'package:freezed_annotation/freezed_annotation.dart';
part 'review.freezed.dart';
part 'review.g.dart';

/// Clase de datos para obtener las reseñas que han subido los usuarios ya sean de un [Event], [Place] o [Guide].
@freezed
abstract class Review with _$Review {
  const factory Review({
    ///[id] es el campo que es generado por la firebase para identificar al documento.
    String id,

    ///[comment] contiene el comentario que escribio el usuario.
    String comment,

    ///[comment] contiene el nombre del usuario que escribio el comentario.
    String userName,

    ///[rating] contine la valoracion que el usuario le dio al lugar, evento o al guia.
    double rating,

    ///[userID] contiene el id del usuario que escribio el comentario.
    String userID,

    ///[img] contiene el link de la imagen del usuario que escribio el comentario.
    String img,

    ///[dat] un [DateTime] que contiene la fecha en la cual se escribio el comentario.
    DateTime dat,
  }) = _Review;
  factory Review.fromJson(Map<String, dynamic> json) {
    return _$ReviewFromJson(json);
  }
}
