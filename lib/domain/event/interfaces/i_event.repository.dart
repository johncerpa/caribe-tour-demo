import '../event.dart';

/// Repositorio de eventos encargado de manejar todo lo relacionado con la información de eventos en la base de datos.
abstract class IEventRepository {
  /// Método asíncrono encargado de obtener todos los eventos guardados en la base de datos.
  Future<List<Event>> getAllevents();

  /// Método asíncrono encargado de obtener un evento.
  Future<Event> getEvent();
}
