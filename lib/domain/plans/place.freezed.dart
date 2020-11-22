// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return _Place.fromJson(json);
}

mixin _$Place {
  String get id;
  String get name;
  Map<String, String> get description;
  double get latitude;
  double get longitude;
  bool get accesibility;
  bool get forAdults;
  Map<String, String> get schedule;
  Map<String, String> get type;
  double get rating;
  String get imageUrl;
  String get city;
  String get department;
  List<Map<String, String>> get tips;

  Place copyWith(
      {String id,
      String name,
      Map<String, String> description,
      double latitude,
      double longitude,
      bool accesibility,
      bool forAdults,
      Map<String, String> schedule,
      Map<String, String> type,
      double rating,
      String imageUrl,
      String city,
      String department,
      List<Map<String, String>> tips});

  Map<String, dynamic> toJson();
}

class _$PlaceTearOff {
  const _$PlaceTearOff();

  _Place call(
      {String id,
      @required String name,
      Map<String, String> description,
      @required double latitude,
      @required double longitude,
      bool accesibility,
      bool forAdults,
      Map<String, String> schedule,
      Map<String, String> type,
      double rating,
      String imageUrl,
      String city,
      String department,
      List<Map<String, String>> tips}) {
    return _Place(
      id: id,
      name: name,
      description: description,
      latitude: latitude,
      longitude: longitude,
      accesibility: accesibility,
      forAdults: forAdults,
      schedule: schedule,
      type: type,
      rating: rating,
      imageUrl: imageUrl,
      city: city,
      department: department,
      tips: tips,
    );
  }
}

const $Place = _$PlaceTearOff();

@JsonSerializable()
class _$_Place implements _Place {
  const _$_Place(
      {this.id,
      @required this.name,
      this.description,
      @required this.latitude,
      @required this.longitude,
      this.accesibility,
      this.forAdults,
      this.schedule,
      this.type,
      this.rating,
      this.imageUrl,
      this.city,
      this.department,
      this.tips})
      : assert(name != null),
        assert(latitude != null),
        assert(longitude != null);

  factory _$_Place.fromJson(Map<String, dynamic> json) =>
      _$_$_PlaceFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final Map<String, String> description;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final bool accesibility;
  @override
  final bool forAdults;
  @override
  final Map<String, String> schedule;
  @override
  final Map<String, String> type;
  @override
  final double rating;
  @override
  final String imageUrl;
  @override
  final String city;
  @override
  final String department;
  @override
  final List<Map<String, String>> tips;

  @override
  String toString() {
    return 'Place(id: $id, name: $name, description: $description, latitude: $latitude, longitude: $longitude, accesibility: $accesibility, forAdults: $forAdults, schedule: $schedule, type: $type, rating: $rating, imageUrl: $imageUrl, city: $city, department: $department, tips: $tips)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Place &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.accesibility, accesibility) ||
                const DeepCollectionEquality()
                    .equals(other.accesibility, accesibility)) &&
            (identical(other.forAdults, forAdults) ||
                const DeepCollectionEquality()
                    .equals(other.forAdults, forAdults)) &&
            (identical(other.schedule, schedule) ||
                const DeepCollectionEquality()
                    .equals(other.schedule, schedule)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.department, department) ||
                const DeepCollectionEquality()
                    .equals(other.department, department)) &&
            (identical(other.tips, tips) ||
                const DeepCollectionEquality().equals(other.tips, tips)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(accesibility) ^
      const DeepCollectionEquality().hash(forAdults) ^
      const DeepCollectionEquality().hash(schedule) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(department) ^
      const DeepCollectionEquality().hash(tips);

  @override
  _$_Place copyWith({
    Object id = freezed,
    Object name = freezed,
    Object description = freezed,
    Object latitude = freezed,
    Object longitude = freezed,
    Object accesibility = freezed,
    Object forAdults = freezed,
    Object schedule = freezed,
    Object type = freezed,
    Object rating = freezed,
    Object imageUrl = freezed,
    Object city = freezed,
    Object department = freezed,
    Object tips = freezed,
  }) {
    return _$_Place(
      id: id == freezed ? this.id : id as String,
      name: name == freezed ? this.name : name as String,
      description: description == freezed
          ? this.description
          : description as Map<String, String>,
      latitude: latitude == freezed ? this.latitude : latitude as double,
      longitude: longitude == freezed ? this.longitude : longitude as double,
      accesibility:
          accesibility == freezed ? this.accesibility : accesibility as bool,
      forAdults: forAdults == freezed ? this.forAdults : forAdults as bool,
      schedule:
          schedule == freezed ? this.schedule : schedule as Map<String, String>,
      type: type == freezed ? this.type : type as Map<String, String>,
      rating: rating == freezed ? this.rating : rating as double,
      imageUrl: imageUrl == freezed ? this.imageUrl : imageUrl as String,
      city: city == freezed ? this.city : city as String,
      department:
          department == freezed ? this.department : department as String,
      tips: tips == freezed ? this.tips : tips as List<Map<String, String>>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PlaceToJson(this);
  }
}

abstract class _Place implements Place {
  const factory _Place(
      {String id,
      @required String name,
      Map<String, String> description,
      @required double latitude,
      @required double longitude,
      bool accesibility,
      bool forAdults,
      Map<String, String> schedule,
      Map<String, String> type,
      double rating,
      String imageUrl,
      String city,
      String department,
      List<Map<String, String>> tips}) = _$_Place;

  factory _Place.fromJson(Map<String, dynamic> json) = _$_Place.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  Map<String, String> get description;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  bool get accesibility;
  @override
  bool get forAdults;
  @override
  Map<String, String> get schedule;
  @override
  Map<String, String> get type;
  @override
  double get rating;
  @override
  String get imageUrl;
  @override
  String get city;
  @override
  String get department;
  @override
  List<Map<String, String>> get tips;

  @override
  _Place copyWith(
      {String id,
      String name,
      Map<String, String> description,
      double latitude,
      double longitude,
      bool accesibility,
      bool forAdults,
      Map<String, String> schedule,
      Map<String, String> type,
      double rating,
      String imageUrl,
      String city,
      String department,
      List<Map<String, String>> tips});
}
