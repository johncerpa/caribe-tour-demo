import 'package:caribe_tour/domain/auth/local_domain_user.dart';
import 'package:caribe_tour/domain/auth/value_objects.dart';
import 'package:caribe_tour/domain/core/value_object.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

/// Clase helper para la transferencia de información entre Firebase y la aplicación
@freezed
abstract class UserDto with _$UserDto {
  const factory UserDto({
    @JsonKey(ignore: true) String id,
    @required String firstName,
    @required String lastName,
    @required String email,
    @required DateTime birthday,
    @required String gender,
    @required bool isGuide,
    @required String phone,
    String dep,
  }) = _UserDto;

  factory UserDto.fromDomain(LocalDomainUser user) {
    return UserDto(
      id: user.id.getOrCrash(),
      firstName: user.firstName.getOrCrash(),
      lastName: user.lastName.getOrCrash(),
      email: user.email.getOrCrash(),
      birthday: user.birthday,
      gender: user.gender.getOrCrash(),
      phone: user.phone,
      isGuide: user.isGuide,
      dep: user.department,
    );
  }

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return _$UserDtoFromJson(json);
  }

  factory UserDto.fromFirestore(DocumentSnapshot doc) {
    return UserDto.fromJson(doc.data()).copyWith(id: doc.id);
  }
}

extension UserDtoExtension on UserDto {
  LocalDomainUser toDomain({dynamic profileImageUrl}) {
    return LocalDomainUser(
      id: UniqueId.fromUniqueString(id),
      firstName: Name(firstName),
      lastName: Name(lastName),
      birthday: birthday,
      email: EmailAddress(email),
      gender: Gender(gender),
      profileImageUrl: profileImageUrl,
      isGuide: isGuide,
      phone: phone,
    );
  }
}
