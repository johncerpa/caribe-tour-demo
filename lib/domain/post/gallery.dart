import 'package:freezed_annotation/freezed_annotation.dart';
part 'gallery.freezed.dart';
part 'gallery.g.dart';

/// Clase de datos para obtener las fotos que han subido los usuarios ya sean de un [Event] o un [Place].
@freezed
abstract class Gallery with _$Gallery {
  const factory Gallery({
    ///[id] Es el campo que es generado por la firebase para identificar al documento.
    String id,

    ///[imUrl] un [String] que contiene el link de la imagen subida por el usuario.
    String imUrl,

    ///[author] contiene el nombre de la persona que subio la imagen.
    String author,

    ///[time] [dateTime] contiene la fecha en la fue subida la imagen.
    DateTime time,
  }) = _Gallery;
  factory Gallery.fromJson(Map<String, dynamic> json) {
    return _$GalleryFromJson(json);
  }
}
