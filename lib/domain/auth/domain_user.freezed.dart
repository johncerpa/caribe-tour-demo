// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'domain_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$DomainUser {
  UniqueId get id;

  DomainUser copyWith({UniqueId id});
}

class _$DomainUserTearOff {
  const _$DomainUserTearOff();

  _DomainUser call({@required UniqueId id}) {
    return _DomainUser(
      id: id,
    );
  }
}

const $DomainUser = _$DomainUserTearOff();

class _$_DomainUser implements _DomainUser {
  const _$_DomainUser({@required this.id}) : assert(id != null);

  @override
  final UniqueId id;

  @override
  String toString() {
    return 'DomainUser(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DomainUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @override
  _$_DomainUser copyWith({
    Object id = freezed,
  }) {
    return _$_DomainUser(
      id: id == freezed ? this.id : id as UniqueId,
    );
  }
}

abstract class _DomainUser implements DomainUser {
  const factory _DomainUser({@required UniqueId id}) = _$_DomainUser;

  @override
  UniqueId get id;

  @override
  _DomainUser copyWith({UniqueId id});
}
