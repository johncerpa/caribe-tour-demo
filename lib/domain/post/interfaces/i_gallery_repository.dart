import 'dart:io';
import '../gallery.dart';

/// Repositorio de eventos encargado de manejar todo lo relacionado con la información de galeria en la base de datos.
abstract class IGalleryRepository {
  ///Metodo encargado de agregar una foto a la galeria
  ///
  ///[name] este campo toma el valor del nombre del evento o del lugar donde se agregara la foto.
  ///[photo] un [File] que contiene la imagen que sera subida.
  ///[coll] toma el valor de la colleccion donde se subira la imagen, los valores que tomas son `events` y `place`.
  Future<void> addGallery(String name, File photo, String coll);

  ///Metodo encargado de retornar una [List] de [Gallery] que contiene las imagenes subidas por los usuarios
  ///
  ///[name] este campo toma el valor del nombre del evento o del lugar.
  //////[coll] toma el valor de la colleccion de ventos o lugares, los valores que tomas son `events` y `place`.
  Future<List<Gallery>> getGallery(String name, String coll);

  ///Metodo encargado de retornar un [Stream] de [List] de [Gallery] que contiene las imagenes subidas por los usuarios
  ///a diferencia del metodo anterior este es encargado de retornar la galeria en tiempo real.
  ///
  ///[name] este campo toma el valor del nombre del evento o del lugar.
  ///[coll] toma el valor de la colleccion de eventos o lugares, los valores que tomas son `events` y `place`.
  Future<Stream<List<Gallery>>> getGalleryStream(String name, String coll);
}
