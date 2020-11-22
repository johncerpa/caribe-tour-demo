import 'package:caribe_tour/domain/plans/place.dart';
import 'package:caribe_tour/domain/plans/plan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Repositorio de eventos encargado de manejar todo lo relacionado con las rutas  en la base de datos.
abstract class IPlansRepository {
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
  Future<void> savePlan(
    String planName,
    Map<String, Place> places,
    String source,
    String destination,
    String emailT,
    bool kidsFilter,
    bool disableFilter,
    bool byDepartment,
    List<String> citdepart,
    List<Place> placesOrder,
  );

  ///Metodo que retorna las rutas de un usuario
  Future<List<Plan>> getUserPlans();

  ///Metodo que retorna un [Stream] de [QuerySnapshot] para luego armar una lista de [Plan] en tiempo real.
  Future<Stream<QuerySnapshot>> getUserPlansStream();

  ///Metodo que retorna un [Stream] de [List] de [Plan] del usuario  en tiempo real.
  Future<Stream<List<Plan>>> getUserPlansStreamH();

  ///Metodo para actualizar determinada ruta
  ///
  ///[planName] indica el nombre que se le ha dado al plan.
  ///[places] un [Map] editado que indica los lugares que se visitaran.
  ///[source] indica el punto de partida.
  ///[destination] indica el punto de llegada.
  ///[email] tendra el email del usuario al cual pertenece el plan
  ///[planid] indica el id del plan que se va a editar.
  Future<void> updatePlan(String planName, Map<String, Place> places,
      String source, String destination, String email, String planid);

  ///Metodo que se utiliza para marcar lugares como visitados de manera manual o cuando el usuario llegue al lugar
  ///
  ///[planId] indica el id del plan deonde se marcara el lugar visitado.
  ///[planVisitedId] indica el id del lugar es visitado.
  Future<void> savePlaceVisited(String planId, String placeVisitedId);

  ///Metodo que retorna [Stream] de [Plan] en tiempo real.
  Future<Stream<Plan>> planStream(String id);

  ///Metodo que se utiliza para quitar de visitados un lugar en especifico.
  ///[planId] indica el id del plan deonde se marcara el lugar como no visitado
  ///[planVisitedId] indica el id del lugar que se marcara como no visitado.
  Future<void> removePlaceVisited(String planId, String placeVisitedId);

  ///Retorna una [List] de [Place] que han sido vistados.
  ///
  ///[planId] indica el id un plan en especifico.
  Future<List<Place>> getPlacesVisited(String planId);

  ///Metodo que retorna un [Stream] de [QuerySnapshot] para luego armar una lista de [Plan] en tiempo real.
  ///
  ///[planId] indica el id un plan en especifico.
  Future<Stream<QuerySnapshot>> getPlacesVisitedStream(String planId);

  ///Funcion encargada de aceptar o rechazar un plan
  ///
  ///[id] indica el id un plan en especifico.
  ///[update] valor que se actualizara tomara el valor de true si el plan es aceptado, de lo contrario sera falso
  Future<void> updateRequest(String id, bool update);
}
