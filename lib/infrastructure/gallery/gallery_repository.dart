import 'dart:io';
import 'package:caribe_tour/domain/post/gallery.dart';
import 'package:caribe_tour/domain/post/interfaces/i_gallery_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:caribe_tour/infrastructure/core/firestore_helpers.dart';
import 'package:path/path.dart';

@LazySingleton(as: IGalleryRepository)
class GalleryRepository implements IGalleryRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;
  GalleryRepository(this._firestore, this._storage);

  ///Metodo encargado de agregar una foto a la galeria
  ///
  ///[name] este campo toma el valor del nombre del evento o del lugar donde se agregara la foto.
  ///[photo] un [File] que contiene la imagen que sera subida.
  ///[coll] toma el valor de la colleccion donde se subira la imagen, los valores que tomas son `events` y `place`.
  @override
  Future<void> addGallery(String name, File photo, String coll) async {
    final userDoc = await _firestore.userDocument();
    final storRef = _storage.ref();
    final docPlaceRef = await _firestore.collection("$coll");
    final place = await docPlaceRef.where("name", isEqualTo: name).get();

    final user = await userDoc.get();
    String imgName = basename(photo.path);
    String city = place.docs[0]['city'].toString();
    String dep = place.docs[0]['department'].toString();
    String usN = user.data()["firstName"].toString() +
        " " +
        user.data()["lastName"].toString();
    final galRef = _storage
        .ref()
        .child('$coll/$dep/$city/$name/gallery/$imgName')
        .putFile(photo)
        .onComplete
        .then((value) {
      _storage
          .ref()
          .child('$coll/$dep/$city/$name/gallery/$imgName')
          .getDownloadURL()
          .then((value) async => await docPlaceRef
                  .doc(place.docs[0].id)
                  .collection("gallery")
                  .add({
                'author': usN,
                'userId': user.id,
                'imUrl': value.toString(),
                'date': DateTime.now()
              }));
    });
  }

  ///Metodo encargado de retornar una [List] de [Gallery] que contiene las imagenes subidas por los usuarios
  ///
  ///[name] este campo toma el valor del nombre del evento o del lugar.
  //////[coll] toma el valor de la colleccion de ventos o lugares, los valores que tomas son `events` y `place`.
  @override
  Future<List<Gallery>> getGallery(String name, String coll) async {
    List<Gallery> album = [];
    final docPlaceRef = await _firestore.collection("$coll");
    final place = await docPlaceRef.where("name", isEqualTo: name).get();
    final gallery =
        await docPlaceRef.doc(place.docs[0].id).collection('gallery').get();

    String city = place.docs[0]['city'].toString();
    String dep = place.docs[0]['department'].toString();

    for (final photo in gallery.docs) {
      final pic = Gallery.fromJson(photo.data());
      String name = photo.data()['name'].toString();

      album.add(
          pic.copyWith(time: (photo.data()['date'] as Timestamp).toDate()));
    }

    return album;
  }

  ///Metodo encargado de retornar un [Stream] de [List] de [Gallery] que contiene las imagenes subidas por los usuarios
  ///a diferencia del metodo anterior este es encargado de retornar la galeria en tiempo real.
  ///
  ///[name] este campo toma el valor del nombre del evento o del lugar.
  ///[coll] toma el valor de la colleccion de eventos o lugares, los valores que tomas son `events` y `place`.
  @override
  Future<Stream<List<Gallery>>> getGalleryStream(
      String name, String coll) async {
    // TODO: implement getGalleryStream
    final docPlaceRef = await _firestore.collection("$coll");
    final place = await docPlaceRef.where("name", isEqualTo: name).get();
    final algo = _firestore
        .collection(coll)
        .doc(place.docs[0].id)
        .collection("gallery")
        .snapshots()
        .map((event) => event.docs
            .map((e) => Gallery.fromJson(e.data())
                .copyWith(time: (e.data()['date'] as Timestamp).toDate()))
            .toList());
    return algo;
  }
}
