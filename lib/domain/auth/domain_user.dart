import 'package:caribe_tour/domain/core/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// Clase de datos autogenerada (Serialización, toString, etc.)
part 'domain_user.freezed.dart';

/// Un [DomainUser] es una clase de datos autogenerada y es usada para autenticar el usuario mediante Firebase Auth.
@freezed
abstract class DomainUser with _$DomainUser {
  const factory DomainUser({
    /// [DomainUser] tiene un id único.
    ///
    /// Si un nuevo usuario se registra se genera un id único mediante [Uuid()]
    /// Si el usuario ya existe se instancia un objeto de [Uuid]
    @required UniqueId id,
  }) = _DomainUser;
}
