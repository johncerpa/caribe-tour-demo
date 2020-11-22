import 'package:caribe_tour/domain/guide/guide.dart';
import 'package:caribe_tour/domain/guide/interfaces/i_guides.repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

/// Implementación de la interfaz [IGuidesRepository]
@LazySingleton(as: IGuidesRepositry)
class GuideRepository implements IGuidesRepositry {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;
  GuideRepository(this._firestore, this._storage);

  /// Método encargado de obtener todos los guias desde Firestore.
  @override
  Future<List<Guide>> getGuides() async {
    // TODO: implement getGuides
    List<Guide> guides = [];
    final docRef = _firestore.collection("users");
    final guidesDoc = await docRef.where('isGuide', isEqualTo: true).get();
    print(guidesDoc.docs.toList());
    for (final guide in guidesDoc.docs) {
      final guid = Guide.fromJson(guide.data());
      String url = await getUrl(guide.id);
      guides.add(guid.copyWith(profileImageUrl: url));
    }
    return guides;
  }

  /// Método encargado de obtener la imagen de perfil del guia desde Firebase Storage.
  @override
  Future<String> getUrl(String userId) async {
    final String imgUrl = await _storage.ref().child('profileImages/profileImg-$userId').getDownloadURL() as String;
    return imgUrl;
  }
}
