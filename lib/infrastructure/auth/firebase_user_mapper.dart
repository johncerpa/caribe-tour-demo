import 'package:caribe_tour/domain/auth/domain_user.dart';
import 'package:caribe_tour/domain/core/value_object.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserDomain on User {
  DomainUser toDomain() {
    return DomainUser(
      id: UniqueId.fromUniqueString(uid),
    );
  }
}
