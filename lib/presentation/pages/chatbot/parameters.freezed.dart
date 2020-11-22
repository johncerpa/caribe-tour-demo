// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

ParametersStart _$ParametersStartFromJson(Map<String, dynamic> json) {
  return _ParametersStart.fromJson(json);
}

mixin _$ParametersStart {
  @JsonKey(ignore: true)
  String get id;
  int get dias;
  List<String> get departamentos;

  ParametersStart copyWith(
      {@JsonKey(ignore: true) String id, int dias, List<String> departamentos});

  Map<String, dynamic> toJson();
}

class _$ParametersStartTearOff {
  const _$ParametersStartTearOff();

  _ParametersStart call(
      {@JsonKey(ignore: true) String id,
      @required int dias,
      @required List<String> departamentos}) {
    return _ParametersStart(
      id: id,
      dias: dias,
      departamentos: departamentos,
    );
  }
}

const $ParametersStart = _$ParametersStartTearOff();

@JsonSerializable()
class _$_ParametersStart implements _ParametersStart {
  const _$_ParametersStart(
      {@JsonKey(ignore: true) this.id,
      @required this.dias,
      @required this.departamentos})
      : assert(dias != null),
        assert(departamentos != null);

  factory _$_ParametersStart.fromJson(Map<String, dynamic> json) =>
      _$_$_ParametersStartFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  final int dias;
  @override
  final List<String> departamentos;

  @override
  String toString() {
    return 'ParametersStart(id: $id, dias: $dias, departamentos: $departamentos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ParametersStart &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.dias, dias) ||
                const DeepCollectionEquality().equals(other.dias, dias)) &&
            (identical(other.departamentos, departamentos) ||
                const DeepCollectionEquality()
                    .equals(other.departamentos, departamentos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(dias) ^
      const DeepCollectionEquality().hash(departamentos);

  @override
  _$_ParametersStart copyWith({
    Object id = freezed,
    Object dias = freezed,
    Object departamentos = freezed,
  }) {
    return _$_ParametersStart(
      id: id == freezed ? this.id : id as String,
      dias: dias == freezed ? this.dias : dias as int,
      departamentos: departamentos == freezed
          ? this.departamentos
          : departamentos as List<String>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ParametersStartToJson(this);
  }
}

abstract class _ParametersStart implements ParametersStart {
  const factory _ParametersStart(
      {@JsonKey(ignore: true) String id,
      @required int dias,
      @required List<String> departamentos}) = _$_ParametersStart;

  factory _ParametersStart.fromJson(Map<String, dynamic> json) =
      _$_ParametersStart.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  int get dias;
  @override
  List<String> get departamentos;

  @override
  _ParametersStart copyWith(
      {@JsonKey(ignore: true) String id, int dias, List<String> departamentos});
}
