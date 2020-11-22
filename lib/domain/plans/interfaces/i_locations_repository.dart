import 'package:caribe_tour/domain/plans/dept_and_cities.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:flutter/foundation.dart';
import 'package:google_place/google_place.dart';

/// Repositorio de eventos encargado de manejar todo lo relacionado con la información de los lugares turisiticos y de departamentos  en la base de datos.
abstract class ILocationsRepository {
  ///Metodo que retorna una [List] de [DeptAndCities] de los departamentos que tienen un lugar turisitico.
  Future<List<DeptAndCities>> getDepartmentsAndCities();

  ///Metodo que retorna una [List] de [Place] para armar un plan con lugares turisitcios en los departamentos elegidos por el usuario.
  ///
  ///[departments] una [List] que contiene los departamentos que el usuario desea visitar.
  ///[kidsFilter] [bool] que tomara el valor de true si el usuario viajara con niños de lo contrario sera false.
  ///[disabilitiesFilter] [bool] que tomara el valor de true si el usuario viajar con personas discapacitadas de lo contrario sera false.
  Future<List<Place>> getPlacesByDepartments({
    @required List<String> departments,
    @required bool kidsFilter,
    @required bool disabilitiesFilter,
  });

  ///Metodo que retorna una [List] de [Place] para armar un plan con lugares turisitcios en las ciudades elegidas por el usuario.
  ///
  ///[cities] una [List] que contiene las ciudades que el usuario desea visitar.
  ///[kidsFilter] [bool] que tomara el valor de true si el usuario viajara con niños de lo contrario sera false.
  ///[disabilitiesFilter] [bool] que tomara el valor de true si el usuario viajar con personas discapacitadas de lo contrario sera false.
  Future<List<Place>> getPlacesByCities({
    @required List<String> cities,
    @required bool kidsFilter,
    @required bool disabilitiesFilter,
  });

  ///Metodo que retorna todos los sitios turisticos para luego hacer un busqueda mas personalizada.
  Future<List<Place>> searchPlaces();

  ///Metodo que retorna una [List] de [Place] para armar un plan con lugares turisitcios en las ciudades y en el departamento elegido por el usuario.
  ///
  ///[department] toma el valor del departamento que desea visitar el usuario.
  ///[cities] una [List] que contiene las ciudades que el usuario desea visitar.
  ///[kidsFilter] [bool] que tomara el valor de true si el usuario viajara con niños de lo contrario sera false.
  ///[disabilitiesFilter] [bool] que tomara el valor de true si el usuario viajar con personas discapacitadas de lo contrario sera false.
  Future<List<Place>> getPlacesByDepartmentAndCities({
    @required String department,
    @required List<String> cities,
    @required bool kidsFilter,
    @required bool disabilitiesFilter,
  });

  ///Metodo que retorna una [List] de [Place] al azar.
  Future<List<Place>> getRandomPlaces();

  ///Metodo que retorna una [List] de [Place] basado en su [rating].
  Future<List<Place>> getPopularPlaces();

  ///Metodo que retorna una [List] de [Place] que seran visitados por el usuario.
  ///
  ///[placesID] id´s de lugares que seran visitados.
  ///[locationLatitude] latitud actual del usuario.
  ///[locationLongitude] longitud actual del usuario.
  Future<List<Place>> getPlanPlaces(
    List<String> placesID,
    double locationLatitude,
    double locationLongitude,
  );
}
