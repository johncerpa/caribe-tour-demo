import 'package:caribe_tour/domain/auth/interfaces/i_auth_facade.dart';
import 'package:caribe_tour/domain/core/errors.dart';
import 'package:caribe_tour/injection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

extension FirestoreExt on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = getIt<IAuthFacade>().getSignedInUser();

    final user = userOption.getOrElse(() => throw NotAuthenticatedError());

    return FirebaseFirestore.instance.collection('users').doc(user.id.getOrCrash());
  }
}

extension DocumentReferenceExt on DocumentReference {
  CollectionReference get plansCollection => collection('plans');
}
