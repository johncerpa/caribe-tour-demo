import 'package:caribe_tour/domain/plans/dept_and_cities.dart';
import 'package:caribe_tour/domain/plans/interfaces/i_locations_repository.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

/// Implementación de la interfaz [ILocationsRepository]
@LazySingleton(as: ILocationsRepository)
class LocationsRepository implements ILocationsRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  LocationsRepository(this._firestore, this._storage);

  /// Método encargado de obtener todos los nombres de los departamentos y ciudades guardados en Firestore.
  @override
  Future<List<DeptAndCities>> getDepartmentsAndCities() async {
    final snapshots = await _firestore.collection('departments').get();

    final List<DeptAndCities> deptsAndCities = [];

    for (final snapshot in snapshots.docs) {
      final cities = (snapshot.data()['cities'] as List)
          ?.map((e) => e as String)
          ?.toList();

      deptsAndCities.add(DeptAndCities(
        departmentName: snapshot.id,
        cities: cities,
      ));
    }

    return deptsAndCities;
  }

  /// Método encargado de obtener todos los lugares dado unos departamentos, aplicando unos filtros.
  ///
  /// [departments] es una lista de `String`s que contienen los nombres de los departamentos
  /// [kidsFilter] es un filtro que indica si se desea que los lugares sean aptos para niños.
  /// [disabilitiesFilter] es un filtro que indica si se desea que los lugares sean aptos para gente con discapacidades.
  @override
  Future<List<Place>> getPlacesByDepartments({
    @required List<String> departments,
    @required bool kidsFilter,
    @required bool disabilitiesFilter,
  }) async {
    final List<Place> listOfPlaces = [];

    final CollectionReference collectionReference =
        _firestore.collection('places');

    QuerySnapshot snapshot;

    if (kidsFilter && disabilitiesFilter) {
      snapshot = await collectionReference
          .where('forAdults', isEqualTo: false)
          .where('accesibility', isEqualTo: true)
          .get();
    } else if (kidsFilter) {
      snapshot =
          await collectionReference.where('forAdults', isEqualTo: false).get();
    } else if (disabilitiesFilter) {
      snapshot = await collectionReference
          .where('accesibility', isEqualTo: true)
          .get();
    } else {
      snapshot = await collectionReference.get();
    }

    for (final place in snapshot.docs) {
      final placeData = place.data();

      if (departments.contains(placeData['department'])) {
        listOfPlaces.add(
          Place.fromJson(place.data()).copyWith(id: place.id),
        );
      }
    }

    listOfPlaces.sort((a, b) => b.rating.compareTo(a.rating));

    return listOfPlaces;
  }

  /// Método encargado de obtener todos los lugares dado un departamento y unas ciudades, aplicando unos filtros.
  ///
  /// [cities] es una lista de `String`s que contienen los nombres de las ciudades.
  /// [department] es el nombre del departamento.
  /// [kidsFilter] es un filtro que indica si se desea que los lugares sean aptos para niños.
  /// [disabilitiesFilter] es un filtro que indica si se desea que los lugares sean aptos para gente con discapacidades.
  @override
  Future<List<Place>> getPlacesByDepartmentAndCities({
    String department,
    List<String> cities,
    @required bool kidsFilter,
    @required bool disabilitiesFilter,
  }) async {
    final List<Place> listOfPlaces = [];

    QuerySnapshot snapshot;

    final collectionReference = _firestore.collection('places');

    if (kidsFilter && disabilitiesFilter) {
      snapshot = await collectionReference
          .where('forAdults', isEqualTo: false)
          .where('accesibility', isEqualTo: true)
          .get();
    } else if (kidsFilter) {
      snapshot =
          await collectionReference.where('forAdults', isEqualTo: false).get();
    } else if (disabilitiesFilter) {
      snapshot = await collectionReference
          .where('accesibility', isEqualTo: true)
          .get();
    } else {
      snapshot = await collectionReference.get();
    }

    for (final doc in snapshot.docs) {
      final placeData = doc.data();

      final equalDepartment = placeData['department'] == department;
      final containsCity = cities.contains(placeData['city']);

      if (equalDepartment && containsCity) {
        listOfPlaces.add(
          Place.fromJson(placeData).copyWith(id: doc.id),
        );
      }
    }

    return listOfPlaces;
  }

  /// Método encargado de obtener lugares al azar.
  @override
  Future<List<Place>> getRandomPlaces() async {
    final List<Place> listOfPlaces = [];

    final snapshot = await _firestore.collection('places').limit(10).get();

    for (final place in snapshot.docs) {
      listOfPlaces.add(Place.fromJson(place.data()).copyWith(id: place.id));
    }

    listOfPlaces.shuffle();

    if (listOfPlaces.length > 3) {
      listOfPlaces.removeRange(3, listOfPlaces.length);
    }

    return listOfPlaces;
  }

  /// Método encargado de obtener los lugares más populares.
  @override
  Future<List<Place>> getPopularPlaces() async {
    final List<Place> listOfPlaces = [];

    final snapshot = await _firestore.collection('places').get();

    for (final place in snapshot.docs) {
      listOfPlaces.add(Place.fromJson(place.data()).copyWith(id: place.id));
    }

    listOfPlaces.sort((a, b) => b.rating.compareTo(a.rating));

    if (listOfPlaces.length > 5) {
      listOfPlaces.removeRange(4, listOfPlaces.length);
    }

    return listOfPlaces;
  }

  /// Método encargado de obtener los lugares de una ruta.
  @override
  Future<List<Place>> getPlanPlaces(
    List<String> placesId,
    double locationLatitude,
    double locationLongitude,
  ) async {
    final List<Place> listOfPlaces = [];

    for (final placeId in placesId) {
      if (placeId == CURRENT_LOCATION) {
        listOfPlaces.add(
          Place.fromJson({
            "name": CURRENT_LOCATION,
            "latitude": locationLatitude,
            "longitude": locationLongitude,
            "imageUrl": "",
          }).copyWith(id: CURRENT_LOCATION),
        );
      } else {
        await _firestore.collection('places').doc(placeId).get().then(
              (doc) => listOfPlaces.add(
                Place.fromJson(doc.data()).copyWith(id: doc.id),
              ),
            );
      }
    }

    return listOfPlaces;
  }

  /// Método para buscar lugares.
  @override
  Future<List<Place>> searchPlaces() async {
    // TODO: implement searchPlaces
    final List<Place> listOfPlaces = [];
    final snapshot = await _firestore.collection('places').get();
    for (final place in snapshot.docs) {
      listOfPlaces.add(Place.fromJson(place.data()).copyWith(id: place.id));
    }

    return listOfPlaces;
  }

  /// Método encargado de obtener lugares dada una lista de ciudades.
  @override
  Future<List<Place>> getPlacesByCities(
      {List<String> cities, bool kidsFilter, bool disabilitiesFilter}) async {
    // TODO: implement getPlacesByCities
    final List<Place> listOfPlaces = [];

    final CollectionReference collectionReference =
        _firestore.collection('places');

    QuerySnapshot snapshot;

    if (kidsFilter && disabilitiesFilter) {
      snapshot = await collectionReference
          .where('forAdults', isEqualTo: false)
          .where('accesibility', isEqualTo: true)
          .get();
    } else if (kidsFilter) {
      snapshot =
          await collectionReference.where('forAdults', isEqualTo: false).get();
    } else if (disabilitiesFilter) {
      snapshot = await collectionReference
          .where('accesibility', isEqualTo: true)
          .get();
    } else {
      snapshot = await collectionReference.get();
    }

    for (final place in snapshot.docs) {
      final placeData = place.data();

      if (cities.contains(placeData['city'])) {
        listOfPlaces.add(
          Place.fromJson(place.data()).copyWith(id: place.id),
        );
      }
    }

    listOfPlaces.sort((a, b) => b.rating.compareTo(a.rating));

    return listOfPlaces;
  }
}
