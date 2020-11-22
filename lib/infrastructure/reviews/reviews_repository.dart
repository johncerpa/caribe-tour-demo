import 'package:caribe_tour/domain/post/interfaces/i_reviews_repository.dart';
import 'package:caribe_tour/domain/post/review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:caribe_tour/infrastructure/core/firestore_helpers.dart';

/// Implementación de la interfaz [IReviewsRepository]
@LazySingleton(as: IReviewsRepository)
class ReviewsRepository implements IReviewsRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;
  ReviewsRepository(this._firestore, this._storage);

  ///Metodo creado para guardar una reseña de un evento, lugar o guía.
  ///
  ///[name] este campo toma el valor del nombre del evento o del lugar y en caso del guia tomara el email del guía donde se agregara la reseña.
  ///[comment] toma el valor del comentario escrito por usuario.
  ///[rating] es la valoracion dadá por el usario.
  ///[collection] toma el valor de la colleccion donde se subira la imagen, los valores que tomas son `events`, `place` o `users`.>
  ///[field] este campo es utilizado para obtener el documento de evento, lugar o usuario donde se agregara la reseña, toma los valores de `name` o `email`.
  @override
  Future<void> saveReview(String name, String comment, double rating,
      String collection, String field) async {
    final userDoc = await _firestore.userDocument();
    final docRef = await _firestore;
    final user = await userDoc.get();
    String userId;
    String nameU;

    userId = user.id.toString();
    nameU = user.data()["firstName"].toString() +
        " " +
        user.data()["lastName"].toString();
    final img = await imgUrl(userId);

    final query =
        await docRef.collection(collection).where(field, isEqualTo: name).get();
    final Map<String, dynamic> review = {
      "comment": comment,
      "userName": nameU,
      "rating": rating.round(),
      "userID": userId,
      "date": DateTime.now(),
      "img": img
    };

    await docRef
        .collection(collection)
        .doc(query.docs[0].id)
        .collection("reviews")
        .add(review);
    final docs = await docRef
        .collection(collection)
        .doc(query.docs[0].id)
        .collection('reviews')
        .get();
    double prom = getProm(docs, rating);
    await docRef
        .collection(collection)
        .doc(query.docs[0].id)
        .update({'rating': prom});
  }

  ///Metodo encargado de retornar una [List] de [Review] que contiene las reseñas subidas por los usuarios, a diferencia del metodo anterior este no es en tiempo real.
  ///
  ///[name] este campo toma el valor del nombre del evento o del lugar y en caso del guia tomara el email.
  ///[field] este campo es utilizado para obtener el documento de evento, lugar o usuario donde se agregara la reseña, toma los valores de `name` o `email`.
  ///[collection] toma el valor de la colleccion de eventos, lugares o usuario, los valores que tomas son `events`, `place` o `users`
  @override
  Future<List<Review>> getReviews(
      String name, String collection, String field) async {
    // TODO: implement getReviews

    List<Review> listOfReviews = [];
    final userDoc = await _firestore;
    final docRef = await _firestore;

    final query =
        await docRef.collection(collection).where(field, isEqualTo: name).get();

    final reviews = await docRef
        .collection(collection)
        .doc(query.docs[0].id)
        .collection("reviews")
        .orderBy(
          "date",
        )
        .get();

    for (final review in reviews.docs) {
      var userId = review.data()["userID"].toString();
      var date = (review.data()["date"] as Timestamp).toDate();
      print(date);
      final revie = Review.fromJson(review.data());
      listOfReviews.add(revie.copyWith(dat: date, id: review.id));
    }

    return listOfReviews.reversed.toList();
  }

  ///Metodo usado para obtener la url de la imagen del usuario
  Future<String> imgUrl(String userid) async {
    final aux = await _storage
        .ref()
        .child('profileImages/profileImg-$userid')
        .getDownloadURL();

    return aux.toString();
  }

  ///Metodo usado para calcular el valor de [rating]
  @override
  double getProm(QuerySnapshot docs, double ratn) {
    // TODO: implement getProm
    int i = 1;
    int sum = ratn.round();
    for (final doc in docs.docs) {
      i++;
      sum = int.parse(doc.data()['rating'].toString()) + sum;
    }
    double prom = sum / i;
    return prom;
  }

  ///Metodo encargado de retornar un [Stream] de [List] de [Review] que contiene las reseñas subidas por los usuarios en tiempo real.
  ///
  ///[name] este campo toma el valor del nombre del evento o del lugar y en caso del guia tomara el email.
  ///[field] este campo es utilizado para obtener el documento de evento, lugar o usuario donde se agregara la reseña, toma los valores de `name` o `email`.
  ///[collection] toma el valor de la colleccion de eventos, lugares o usuario, los valores que tomas son `events`, `place` o `users`
  @override
  Future<Stream<List<Review>>> reviewsStream(
      String name, String collection, String field) async {
    // TODO: implement reviewsStream
    final docref = await _firestore
        .collection(collection)
        .where(field, isEqualTo: name)
        .get();
    final reviews = _firestore
        .collection(collection)
        .doc(docref.docs[0].id)
        .collection("reviews")
        .snapshots()
        .map((event) => event.docs
            .map((e) => Review.fromJson(e.data()).copyWith(
                id: e.id, dat: (e.data()["date"] as Timestamp).toDate()))
            .toList());

    return reviews;
  }
}
