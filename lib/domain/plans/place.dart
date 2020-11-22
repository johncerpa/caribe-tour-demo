import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';
part 'place.g.dart';

/// Clase de datos para obtener la información de un lugar turisitico.
@freezed
abstract class Place with _$Place {
  const factory Place({
    ///[id] Es el campo que es generado por la firebase para identificar al documento.
    String id,

    ///[name] nombre del lugar.
    @required String name,

    ///[description] es un [Map] de [String] que contiene la descripcion del lugar en ingles y español.
    Map<String, String> description,

    ///[latitude] latitud del lugar.
    @required double latitude,

    ///[longitud] longitud del lugar.
    @required double longitude,

    ///[accesibility] [bool] que toma el valor de verdadero si el lugar esta apto para recibir a personas descapacitadas de lo contrario toma el valor de falso.
    bool accesibility,

    ///[forAdults] [bool] que toma el valor de verdadero si el lugar es para adultos de lo contrario toma el valor de falso.
    bool forAdults,

    /// [schedule] es un [Map] de [String] que contiene el horario en el cual es posible acceder al lugar en ingles y español.
    ///La llave `english` contiene el horario en inglés, toma los valores de All day, Day-time y Night-time.
    /// La llave `spanish` contiene el horario en español, toma los valores de Todo el día, diurno y nocturno.
    Map<String, String> schedule,

    /// [type] es un [Map] de [String] que especifica el tipo del lugar en ingles y español.
    ///
    ///La llave `english` contiene el tipo en inglés, toma los valores de Park, Beach, Recreational, Cultural, Museum, Historical y Bar.
    /// La llave `spanish` contiene el tipo en español, toma los valores de Parque, Playa, Recreacional, Cultural, Museuo, Histórico y Bar.
    Map<String, String> type,

    /// [rating] [bool] que contiene la calificacion del lugar basados en las [Review] de los usuarios.
    double rating,

    ///[imageUrl] Contine la url de la imagen del lugar.
    String imageUrl,

    ///[city] contiene el nombre de la ciudad donde se encuentra el lugar.
    String city,

    ///[department] contiene el nombre del departamento donde se encuentra el lugar.
    String department,

    ///[tips] es una lista que contiene un [Map] de [String] de consejos para el lugar en inglés y español.
    ///
    ///La llave `english` contiene el consejo en inglés.
    /// La llave `spanish` contiene el consejo en español.
    List<Map<String, String>> tips,
  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) {
    return _$PlaceFromJson(json);
  }
}
