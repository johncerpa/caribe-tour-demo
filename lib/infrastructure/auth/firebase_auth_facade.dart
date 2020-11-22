import 'package:caribe_tour/domain/auth/domain_user.dart';
import 'package:caribe_tour/domain/auth/auth_failure.dart';
import 'package:caribe_tour/domain/auth/interfaces/i_auth_facade.dart';
import 'package:dartz/dartz.dart';
import 'package:caribe_tour/domain/auth/value_objects.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'firebase_user_mapper.dart';

/// Implementación de la interfaz [IAuthFacade]
@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  /// [_firebaseAuth] es un objeto de tipo [FirebaseAuth] inyectado por `get_it`
  final FirebaseAuth _firebaseAuth;

  /// [_googleSignIn] es un objeto de tipo [GoogleSignIn] inyectado por `get_it`
  final GoogleSignIn _googleSignIn;

  FirebaseAuthFacade(this._firebaseAuth, this._googleSignIn);

  /// Método encargado de obtener el usuario logueado actualmente. Puede ser nulo.
  @override
  Option<DomainUser> getSignedInUser() {
    return optionOf(_firebaseAuth.currentUser?.toDomain());
  }

  /// Método encargado de registrar al usuario en Firebase Auth.
  ///
  /// En caso de registrar al usuario con éxito retorna un [Either] con `right(String)`.
  /// En caso de fallar retorna un [Either] con `left(AuthFailure)` con el tipo de error.
  @override
  Future<Either<AuthFailure, String>> registerWithEmailAndPassword({
    EmailAddress emailAddress,
    Password password,
  }) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    try {
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddressStr,
        password: passwordStr,
      );

      return right(credentials.user.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  /// Método encargado de ingresar al usuario a la aplicación mediante Firebase Auth.
  ///
  /// En caso de ingresar al usuario con éxito retorna un [Either] con `right(Unit)`.
  /// En caso de fallar retorna un [Either] con `left(AuthFailure)` con el tipo de error.
  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    EmailAddress emailAddress,
    Password password,
  }) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAddressStr,
        password: passwordStr,
      );

      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password' || e.code == 'user-not-found') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  /// Método encargado de ingresar al usuario a la aplicación mediante Google con OAuth.
  ///
  /// En caso de ingresar al usuario con éxito retorna un [Either] con `right(Unit)`.
  /// En caso de fallar retorna un [Either] con `left(AuthFailure)` con el tipo de error.
  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }

      final googleAuth = await googleUser.authentication;

      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      return _firebaseAuth.signInWithCredential(authCredential).then((_) => right(unit));
    } on FirebaseAuthException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  /// Método encargado de sacar al usuario de la aplicación.
  @override
  Future<void> signOut() {
    return Future.wait([_googleSignIn.signOut(), _firebaseAuth.signOut()]);
  }
}
