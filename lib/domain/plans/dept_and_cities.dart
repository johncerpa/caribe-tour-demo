import 'package:freezed_annotation/freezed_annotation.dart';

part 'dept_and_cities.freezed.dart';
part 'dept_and_cities.g.dart';

@freezed
abstract class DeptAndCities with _$DeptAndCities {
  const factory DeptAndCities({
    @JsonKey(ignore: true) String id,
    @required String departmentName,
    @required List<String> cities,
  }) = _DeptAndCities;

  factory DeptAndCities.fromJson(Map<String, dynamic> json) {
    return _$DeptAndCitiesFromJson(json);
  }
}
