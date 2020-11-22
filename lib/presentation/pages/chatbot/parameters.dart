import 'package:freezed_annotation/freezed_annotation.dart';

part 'parameters.freezed.dart';
part 'parameters.g.dart';

@freezed
///Esta clase contiene los parametros que el bot detectó como partes de la respuesta del usuario
///los cuales posteriormente son utilizados dentro de la lógica de la app.
abstract class ParametersStart with _$ParametersStart {
  const factory ParametersStart({
    @JsonKey(ignore: true) String id,
    @required int dias,
    @required List<String> departamentos,
  }) = _ParametersStart;

  factory ParametersStart.fromJson(Map<String, dynamic> json) {
    return _$ParametersStartFromJson(json);
  }
}


