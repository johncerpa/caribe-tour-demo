import 'package:cloud_firestore/cloud_firestore.dart';

import '../review.dart';

/// Repositorio de eventos encargado de manejar todo lo relacionado con la información de reseñas en la base de datos.
abstract class IReviewsRepository {
  ///Metodo creado para guardar una reseña de un evento, lugar o guía.
  ///
  ///[name] este campo toma el valor del nombre del evento o del lugar y en caso del guia tomara el email del guía donde se agregara la reseña.
  ///[comment] toma el valor del comentario escrito por usuario.
  ///[rating] es la valoracion dadá por el usario.
  ///[collection] toma el valor de la colleccion donde se subira la imagen, los valores que tomas son `events`, `place` o `users`.>
  ///[field] este campo es utilizado para obtener el documento de evento, lugar o usuario donde se agregara la reseña, toma los valores de `name` o `email`.
  Future<void> saveReview(String name, String comment, double rating,
      String collection, String field);

  ///Metodo usado para calcular el valor de [rating]
  double getProm(QuerySnapshot docs, double raten);

  ///Metodo encargado de retornar un [Stream] de [List] de [Review] que contiene las reseñas subidas por los usuarios en tiempo real.
  ///
  ///[name] este campo toma el valor del nombre del evento o del lugar y en caso del guia tomara el email.
  ///[field] este campo es utilizado para obtener el documento de evento, lugar o usuario donde se agregara la reseña, toma los valores de `name` o `email`.
  ///[collection] toma el valor de la colleccion de eventos, lugares o usuario, los valores que tomas son `events`, `place` o `users`
  Future<Stream<List<Review>>> reviewsStream(
      String name, String collection, String field);

  ///Metodo encargado de retornar una [List] de [Review] que contiene las reseñas subidas por los usuarios, a diferencia del metodo anterior este no es en tiempo real.
  ///
  ///[name] este campo toma el valor del nombre del evento o del lugar y en caso del guia tomara el email.
  ///[field] este campo es utilizado para obtener el documento de evento, lugar o usuario donde se agregara la reseña, toma los valores de `name` o `email`.
  ///[collection] toma el valor de la colleccion de eventos, lugares o usuario, los valores que tomas son `events`, `place` o `users`
  Future<List<Review>> getReviews(String name, String collection, String field);
}
