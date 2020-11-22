import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

/// Clase de datos para obtener la información de un evento desde la base de datos.
@freezed
abstract class Event with _$Event {
  const factory Event({
    /// [name] es el nombre del evento
    @required String name,

    /// [department] es el departamento donde está localizado el evento.
    @required String department,

    /// [city] es la ciudad donde está localizada el evento.
    @required String city,

    /// [description] es un [Map] que contiene la descripción del evento en inglés y español.
    ///
    /// La llave `english` contiene la descripción en inglés.
    /// La llave `spanish` contiene la descripción en español.
    @required Map<String, String> description,

    /// [imgUrl] es un `String` que contiene la URL de la imagen principal del evento.
    @required String imgUrl,

    /// [evtDate] es un [DateTime] que contiene la fecha del evento.
    DateTime evtDate,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) {
    return _$EventFromJson(json);
  }
}
