import 'dart:async';
import 'package:caribe_tour/domain/plans/interfaces/i_plans_repository.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:caribe_tour/domain/plans/plan.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:caribe_tour/infrastructure/core/firestore_helpers.dart';

@LazySingleton(as: IPlansRepository)
class PlansRepository implements IPlansRepository {
  final FirebaseFirestore _firestore;

  PlansRepository(this._firestore);

  ///Metodo encargado de guardar la ruta
  ///

  ///[planName] indica el nombre que se le ha dado al plan.
  ///[places] un [Map] que indica los lugares que se visitaran.
  ///[source] indica el punto de partida.
  ///[destination] indica el punto de llegada.
  ///[emailT] tendra el email del usuario al cual pertenece el plan
  ///[kidsFilter] [bool] que tomará el valor de true si se viajara con niños, de lo contrario sera false.
  ///[disableFilter] [bool] tomará el valor de true si entre las personas que viajan hay una persona descapacitada, de lo contrario sera false.
  ///[byDepartment] [bool]  que tomará el valor true si se viajara por mas de un departamento, de lo contrario sera false.
  ///[citdepart] una [List] que contiene los nombres de los departamentos o ciudades por los cuales se viajara.
  ///[placesOrder] una [List] que tendra los lugares ordenados de acuerdo en el orden que se visitaran.
  @override
  Future<void> savePlan(
    String planName,
    Map<String, Place> places,
    String source,
    String destination,
    String email,
    bool kidsFilter,
    bool disableFilter,
    bool byDepartment,
    List<String> citdepart,
    List<Place> placesOrder,
  ) async {
    var userDoc;

    bool accepted = true;
    String guideid = "";
    String emT = "";

    final List<String> placesNames = [];

    for (final place in placesOrder) {
      placesNames.add(place.name);
    }

    if (email != null && email.isNotEmpty) {
      final tourist = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      accepted = false;
      emT = email;
      userDoc = _firestore.collection('users').doc(tourist.docs[0].id);
      final guide = await _firestore.userDocument();
      guideid = guide.id;
    } else {
      userDoc = await _firestore.userDocument();
      final email = await _firestore.userDocument();
      final userEM = await email.get();
      emT = userEM.data()['email'].toString();
    }

    final List<String> placesIds = [];
    for (final entry in places.entries) {
      if (entry.value.name == CURRENT_LOCATION) {
        placesIds.add(CURRENT_LOCATION);
      } else {
        placesIds.add(entry.value.id);
      }
    }

    final Map<String, dynamic> map = {
      "active": accepted,
      "accepted": accepted,
      "name": planName,
      "places": placesIds,
      "source": source,
      "destination": destination,
      "guide": guideid,
      "kidsFilter": kidsFilter,
      "disableFilter": disableFilter,
      "byDepartment": byDepartment,
      "citdepart": citdepart,
      'touristE': emT,
      'namesInOrder': placesNames,
    };

    if (source == CURRENT_LOCATION || destination == CURRENT_LOCATION) {
      map['latitude'] = places[CURRENT_LOCATION].latitude;
      map['longitude'] = places[CURRENT_LOCATION].longitude;
    }

    await userDoc.collection('plans').add(map);
  }

  ///Metodo que retorna un [Stream] de [QuerySnapshot] para luego armar una lista de [Plan] en tiempo real.
  Future<Stream<QuerySnapshot>> getUserPlansStream() async {
    final userDoc = await _firestore.userDocument();

    final reference = userDoc.collection('plans');

    return reference.snapshots();
  }

  ///Metodo que retorna las rutas de un usuario
  @override
  Future<List<Plan>> getUserPlans() async {
    final List<Plan> plans = [];

    final userDoc = await _firestore.userDocument();

    final snapshot = await userDoc.collection('plans').get();

    for (final doc in snapshot.docs) {
      plans.add(Plan.fromJson(doc.data()).copyWith(id: doc.id));
    }

    return plans;
  }

  ///Metodo que se utiliza para marcar lugares como visitados de manera manual o cuando el usuario llegue al lugar
  ///
  ///[planId] indica el id del plan deonde se marcara el lugar visitado.
  ///[planVisitedId] indica el id del lugar es visitado.
  @override
  Future<void> savePlaceVisited(String planId, String placeVisitedId) async {
    final userDoc = await _firestore.userDocument();

    userDoc
        .collection('plans')
        .doc(planId)
        .collection('placesVisited')
        .add({'placeId': placeVisitedId});
  }

  ///Metodo que se utiliza para quitar de visitados un lugar en especifico.
  ///[planId] indica el id del plan deonde se marcara el lugar como no visitado
  ///[planVisitedId] indica el id del lugar que se marcara como no visitado.
  @override
  Future<void> removePlaceVisited(String planId, String placeVisitedId) async {
    final userDoc = await _firestore.userDocument();

    userDoc
        .collection('plans')
        .doc(planId)
        .collection('placesVisited')
        .where('placeId', isEqualTo: placeVisitedId)
        .get()
        .then((snapshot) {
      for (final doc in snapshot.docs) {
        doc.reference.delete();
      }
    });
  }

  ///Metodo que retorna un [Stream] de [QuerySnapshot] para luego armar una lista de [Plan] en tiempo real.
  ///
  ///[planId] indica el id un plan en especifico.
  @override
  Future<Stream<QuerySnapshot>> getPlacesVisitedStream(String planId) async {
    final userDoc = await _firestore.userDocument();

    final reference =
        userDoc.collection('plans').doc(planId).collection('placesVisited');

    return reference.snapshots();
  }

  ///Retorna una [List] de [Place] que han sido vistados.
  ///
  ///[planId] indica el id un plan en especifico.
  @override
  Future<List<Place>> getPlacesVisited(String planId) async {
    final List<Place> placesVisited = [];

    final userDoc = await _firestore.userDocument();

    final snapshot = await userDoc
        .collection('plans')
        .doc(planId)
        .collection('placesVisited')
        .get();

    for (final id in snapshot.docs) {
      final placeId = id.data()['placeId'] as String;
      final placeDoc = await _firestore.collection('places').doc(placeId).get();
      placesVisited.add(
        Place.fromJson(placeDoc.data()).copyWith(id: placeId),
      );
    }

    return placesVisited;
  }

  ///Funcion encargada de aceptar o rechazar un plan
  ///
  ///[id] indica el id un plan en especifico.
  ///[update] valor que se actualizara tomara el valor de true si el plan es aceptado, de lo contrario sera falso

  @override
  Future<void> updateRequest(String id, bool update) async {
    // TODO: implement updateRequest
    final userDoc = await _firestore.userDocument();

    if (!update) {
      final plan = await userDoc.collection("plans").doc(id).get();
      await userDoc
          .collection("plans")
          .doc(id)
          .update({'accepted': true, 'active': update});
      await _firestore
          .collection("users")
          .doc(plan.data()['guide'].toString())
          .collection("plans")
          .doc(plan.id)
          .set(plan.data());
      await userDoc.collection("plans").doc(id).delete();
    } else {
      userDoc
          .collection("plans")
          .doc(id)
          .update({'accepted': update, 'active': update});
    }
  }

  ///Metodo para actualizar determinada ruta
  ///
  ///[planName] indica el nombre que se le ha dado al plan.
  ///[places] un [Map] editado que indica los lugares que se visitaran.
  ///[source] indica el punto de partida.
  ///[destination] indica el punto de llegada.
  ///[email] tendra el email del usuario al cual pertenece el plan
  ///[planid] indica el id del plan que se va a editar.
  @override
  Future<void> updatePlan(String planName, Map<String, Place> places,
      String source, String destination, String email, String planid) async {
    // TODO: implement updatePlan
    final List<String> placesIds = [];

    for (final entry in places.entries) {
      if (entry.value.name == "Current location") {
        placesIds.add("Current location");
      } else {
        placesIds.add(entry.value.id);
      }
    }

    final userDoc = await _firestore.userDocument();
    final author = await userDoc.get();
    if (email != author.data()["email"]) {
      final tourist = await _firestore
          .collection("users")
          .where('email', isEqualTo: email)
          .get();
      await userDoc.collection("plans").doc(planid).update({
        'source': source,
        'destination': destination,
        'places': placesIds,
        'name': planName,
        'accepted': false,
      });
      final plan = await userDoc.collection("plans").doc(planid).get();
      await _firestore
          .collection("users")
          .doc(tourist.docs[0].id)
          .collection("plans")
          .doc(planid)
          .set(plan.data());
      await userDoc.collection("plans").doc(planid).delete();
    } else {
      await userDoc.collection("plans").doc(planid).update({
        'source': source,
        'destination': destination,
        'places': placesIds,
        'name': planName,
      });
    }
  }

  ///Metodo que retorna un [Stream] de [List] de [Plan] del usuario  en tiempo real.
  @override
  Future<Stream<List<Plan>>> getUserPlansStreamH() async {
    // TODO: implement
    final userDoc = await _firestore.userDocument();
    final plans = userDoc.collection("plans").snapshots().map((event) => event
        .docs
        .map((e) => Plan.fromJson(e.data()).copyWith(id: e.id))
        .toList());

    return plans;
  }

  ///Metodo que retorna [Stream] de [Plan] en tiempo real.
  @override
  Future<Stream<Plan>> planStream(String id) async {
    // TODO: implement planStream
    final userDoc = await _firestore.userDocument();
    final plans = userDoc
        .collection("plans")
        .doc(id)
        .snapshots()
        .map((event) => Plan.fromJson(event.data()).copyWith(id: event.id));
    return plans;
  }
}
