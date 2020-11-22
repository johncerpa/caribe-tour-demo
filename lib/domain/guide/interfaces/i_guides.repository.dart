import '../guide.dart';

/// Interfaz de repositorio que se encarga de manejar todo lo relacionado con la información de guias.
abstract class IGuidesRepositry {
  /// Método asíncrono encargado de obtener una lista de guías.
  Future<List<Guide>> getGuides();

  /// Método asíncrono que se encarga de obtener la imagen de perfil del guia.
  Future<String> getUrl(String id);
}
