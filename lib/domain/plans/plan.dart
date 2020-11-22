import 'package:freezed_annotation/freezed_annotation.dart';
part 'plan.freezed.dart';
part 'plan.g.dart';

/// Clase de datos para obtener un plan armado por el usuario.
@freezed
abstract class Plan with _$Plan {
  const factory Plan({
    ///[id] Es el campo que es generado por la firebase para identificar al documento.
    String id,

    ///[active] es un [bool] que indica que el plan ha sido activado.
    @required bool active,

    ///[name] indica el nombre que se le ha dado al plan.
    @required String name,

    ///[source] indica el punto de partida.
    String source,

    ///[destination] indica el punto de llegada.
    String destination,

    ///[accepted] es un [bool] que tomará el valor de true si el plan ha sido aceptado por el turista, de lo contrario sera false.
    ///
    ///Este valor comenzara en false siempre que el guia cree un plan para un turista
    bool accepted,

    ///[places] una [List] que indica los lugares que se visitaran
    @required List<String> places,

    ///[guide] tomará el valor del correo del guia.
    ///
    ///Este campo tendra valor si el plan fue creado por un guia.
    String guide,

    ///[kidsFilter] [bool] que tomará el valor de true si se viajara con niños, de lo contrario sera false.
    bool kidsFilter,

    ///[disableFilter] [bool] tomará el valor de true si entre las personas que viajan hay una persona descapacitada, de lo contrario sera false.
    bool disableFilter,

    ///[byDepartment] [bool]  que tomará el valor true si se viajara por mas de un departamento, de lo contrario sera false.
    bool byDepartment,

    ///[latitude] indica la latitud actual del usuario.
    double latitude,

    ///[longitude] indica la longitud actual del usuario.
    double longitude,

    ///[citdepart] una [List] que tendra los nombres de los departamentos o ciudades por los cuales se viajara.
    List<String> citdepart,

    ///[touristE] tendra el email del usuario al cual pertenece el plan
    String touristE,

    ///[namesInOrder] una [List] que tendra los lugares ordenados de acuerdo en el orden que se visitaran.
    List<String> namesInOrder,
  }) = _Plan;

  factory Plan.fromJson(Map<String, dynamic> json) {
    return _$PlanFromJson(json);
  }
}
