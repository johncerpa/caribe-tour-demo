import 'dart:io';
import 'package:caribe_tour/domain/auth/auth_failure.dart';
import 'package:caribe_tour/domain/auth/interfaces/i_user_repository.dart';
import 'package:caribe_tour/domain/auth/local_domain_user.dart';
import 'package:caribe_tour/infrastructure/auth/user_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:caribe_tour/infrastructure/core/firestore_helpers.dart';

/// Implementación de la interfaz [IUserRepository]
@LazySingleton(as: IUserRepository)
class UserRepository implements IUserRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;
  final FirebaseAuth _firebaseAuth;

  UserRepository(this._firestore, this._storage, this._firebaseAuth);

  /// Método encargado de obtener la información del usuario desde Firestore.
  ///
  /// Se obtiene el documento del usuario, la URL de la imagen de perfil y se transforma a [LocalDomainUser].
  /// En caso de obtener la información del usuario con éxito retorna un [Either] con `right(LocalDomainUser)`.
  /// En caso de fallar retorna un [Either] con `left(AuthFailure)` con el tipo de error.
  @override
  Future<Either<AuthFailure, LocalDomainUser>> getUserInformation() async {
    final userDoc = await _firestore.userDocument();

    final snapshot = await userDoc.get();

    final url = await getProfileImageUrl(userDoc.id);

    final domainUser = UserDto.fromFirestore(snapshot).toDomain(
      profileImageUrl: url,
    );

    return right(domainUser);
  }

  /// Método encargado de guardar la información del usuario en Firestore, al momento de registrarse
  ///
  /// [user] contiene la información del usuario
  /// [profileImage] es el archivo de la imagen
  /// En caso de guardar la información del  usuario con éxito retorna un [Either] con `right(Unit)`.
  /// En caso de fallar retorna un [Either] con `left(AuthFailure)` con el tipo de error.
  @override
  Future<Either<AuthFailure, Unit>> saveUserInformation(
    LocalDomainUser user,
    File profileImage,
  ) async {
    DocumentReference userDoc;

    try {
      // Set user information
      final userDto = UserDto.fromDomain(user);
      print(userDto);
      userDoc = await _firestore.userDocument();

      await userDoc.set(userDto.toJson());

      final isSuccessful = await saveUserProfileImage(profileImage, userDto.id);

      return isSuccessful ? right(unit) : throw PlatformException(code: null);
    } on PlatformException catch (_) {
      await userDoc?.delete();

      // Delete user in Firebase Auth
      await _firebaseAuth.currentUser?.delete();

      return left(const AuthFailure.serverError());
    }
  }

  /// Método encargado de guardar la imagen de perfil del usuario.
  ///
  /// [profileImage] archivo que contiene la imagen de perfil.
  /// [userId] es la identificación del usuario.
  /// Retorna un `bool` indicando si la imagen se subió exitosamente o no.
  @override
  Future<bool> saveUserProfileImage(File profileImage, String userId) async {
    final reference = _storage.ref().child('profileImages/profileImg-$userId');

    final uploadTask = reference.putFile(profileImage);

    await uploadTask.onComplete;

    return Future.value(uploadTask.isSuccessful);
  }

  /// Método encargado de obtener la URL de la imagen de perfil del usuario.
  ///
  /// [userId] es la identificación del usuario.
  /// Retorna `dynamic` que después puede ser convertido a `String`.
  @override
  Future<dynamic> getProfileImageUrl(String userId) async {
    final imgUrl = await _storage
        .ref()
        .child('profileImages/profileImg-$userId')
        .getDownloadURL();
    return imgUrl;
  }

  /// Método encargado de guardar la información de un guia.
  ///
  /// [user] contiene la información del guía.
  /// [profileIamge] contiene el archivo de la imagen de perfil.
  @override
  Future<Either<AuthFailure, Unit>> saveGuideInformation(
      LocalDomainUser user, File profileIamge) async {
    DocumentReference userDoc;

    try {
      final userDto = UserDto.fromDomain(user);

      userDoc = await _firestore.userDocument();

      await userDoc.set(userDto.toJson());

      final isSuccessful = await saveUserProfileImage(profileIamge, userDto.id);

      return isSuccessful ? right(unit) : throw PlatformException(code: null);
    } on PlatformException catch (_) {
      await userDoc?.delete();

      // Delete user in Firebase Auth
      await _firebaseAuth.currentUser?.delete();

      return left(const AuthFailure.serverError());
    }
  }

  /// Método encargado de obtener una lista de turistas desde Firestore.
  @override
  Future<List<LocalDomainUser>> getTourist() async {
    final List<LocalDomainUser> listOfUsers = [];
    final userDoc = await _firestore.userDocument();

    final snapshot = await userDoc.get();

    final url = await getProfileImageUrl(userDoc.id);

    final domainUser = UserDto.fromFirestore(snapshot).toDomain(
      profileImageUrl: url,
    );
    final usersDocs = await _firestore.collection('users').get();
    for (final user in usersDocs.docs) {
      if (user.data()['email'] != domainUser.email.getOrCrash()) {
        final url1 = await getProfileImageUrl(user.id);

        final tourist = UserDto.fromFirestore(user).toDomain(
          profileImageUrl: url1,
        );

        listOfUsers.add(tourist);
      }
    }

    return listOfUsers;
  }
}
