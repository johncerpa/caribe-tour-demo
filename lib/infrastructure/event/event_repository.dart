import 'package:caribe_tour/domain/event/event.dart';
import 'package:caribe_tour/domain/event/interfaces/i_event.repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

/// Implementación de la interfaz [IEventRepository]
@LazySingleton(as: IEventRepository)
class EventRepository extends IEventRepository {
  final FirebaseFirestore _firestore;

  EventRepository(this._firestore);

  /// Método encargado de obtener todos los eventos desde Firestore
  @override
  Future<List<Event>> getAllevents() async {
    final List<Event> listOfEvents = [];
    final snapshot = await _firestore.collection('events').get();

    for (final doc in snapshot.docs) {
      final event = Event.fromJson(doc.data());
      final date = (doc.data()["date"] as Timestamp).toDate();
      listOfEvents.add(event.copyWith(evtDate: date));
    }

    return listOfEvents;
  }

  @override
  Future<Event> getEvent() {
    throw UnimplementedError();
  }
}
