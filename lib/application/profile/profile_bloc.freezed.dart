// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ProfileEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loadingUserInformation(),
    @required Result initial(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loadingUserInformation(),
    Result initial(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loadingUserInformation(LoadingUserInformation value),
    @required Result initial(Initial value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loadingUserInformation(LoadingUserInformation value),
    Result initial(Initial value),
    @required Result orElse(),
  });
}

class _$ProfileEventTearOff {
  const _$ProfileEventTearOff();

  LoadingUserInformation loadingUserInformation() {
    return const LoadingUserInformation();
  }

  Initial initial() {
    return const Initial();
  }
}

const $ProfileEvent = _$ProfileEventTearOff();

class _$LoadingUserInformation implements LoadingUserInformation {
  const _$LoadingUserInformation();

  @override
  String toString() {
    return 'ProfileEvent.loadingUserInformation()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingUserInformation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loadingUserInformation(),
    @required Result initial(),
  }) {
    assert(loadingUserInformation != null);
    assert(initial != null);
    return loadingUserInformation();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loadingUserInformation(),
    Result initial(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingUserInformation != null) {
      return loadingUserInformation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loadingUserInformation(LoadingUserInformation value),
    @required Result initial(Initial value),
  }) {
    assert(loadingUserInformation != null);
    assert(initial != null);
    return loadingUserInformation(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loadingUserInformation(LoadingUserInformation value),
    Result initial(Initial value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingUserInformation != null) {
      return loadingUserInformation(this);
    }
    return orElse();
  }
}

abstract class LoadingUserInformation implements ProfileEvent {
  const factory LoadingUserInformation() = _$LoadingUserInformation;
}

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'ProfileEvent.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loadingUserInformation(),
    @required Result initial(),
  }) {
    assert(loadingUserInformation != null);
    assert(initial != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loadingUserInformation(),
    Result initial(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loadingUserInformation(LoadingUserInformation value),
    @required Result initial(Initial value),
  }) {
    assert(loadingUserInformation != null);
    assert(initial != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loadingUserInformation(LoadingUserInformation value),
    Result initial(Initial value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ProfileEvent {
  const factory Initial() = _$Initial;
}

mixin _$ProfileState {
  Option<LocalDomainUser> get localDomainUser;

  ProfileState copyWith({Option<LocalDomainUser> localDomainUser});
}

class _$ProfileStateTearOff {
  const _$ProfileStateTearOff();

  _ProfileState call({@required Option<LocalDomainUser> localDomainUser}) {
    return _ProfileState(
      localDomainUser: localDomainUser,
    );
  }
}

const $ProfileState = _$ProfileStateTearOff();

class _$_ProfileState implements _ProfileState {
  const _$_ProfileState({@required this.localDomainUser})
      : assert(localDomainUser != null);

  @override
  final Option<LocalDomainUser> localDomainUser;

  @override
  String toString() {
    return 'ProfileState(localDomainUser: $localDomainUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProfileState &&
            (identical(other.localDomainUser, localDomainUser) ||
                const DeepCollectionEquality()
                    .equals(other.localDomainUser, localDomainUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(localDomainUser);

  @override
  _$_ProfileState copyWith({
    Object localDomainUser = freezed,
  }) {
    return _$_ProfileState(
      localDomainUser: localDomainUser == freezed
          ? this.localDomainUser
          : localDomainUser as Option<LocalDomainUser>,
    );
  }
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState(
      {@required Option<LocalDomainUser> localDomainUser}) = _$_ProfileState;

  @override
  Option<LocalDomainUser> get localDomainUser;

  @override
  _ProfileState copyWith({Option<LocalDomainUser> localDomainUser});
}
