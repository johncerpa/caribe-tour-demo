// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'value_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ValueFailure<T> {
  T get failedValue;

  ValueFailure<T> copyWith({T failedValue});

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidEmail(@required T failedValue),
    @required Result shortPassword(@required T failedValue),
    @required Result invalidName(@required T failedValue),
    @required Result invalidGender(@required T failedValue),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidEmail(@required T failedValue),
    Result shortPassword(@required T failedValue),
    Result invalidName(@required T failedValue),
    Result invalidGender(@required T failedValue),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
    @required Result invalidName(InvalidName<T> value),
    @required Result invalidGender(InvalidGender<T> value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    Result invalidName(InvalidName<T> value),
    Result invalidGender(InvalidGender<T> value),
    @required Result orElse(),
  });
}

class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

  InvalidEmail<T> invalidEmail<T>({@required T failedValue}) {
    return InvalidEmail<T>(
      failedValue: failedValue,
    );
  }

  ShortPassword<T> shortPassword<T>({@required T failedValue}) {
    return ShortPassword<T>(
      failedValue: failedValue,
    );
  }

  InvalidName<T> invalidName<T>({@required T failedValue}) {
    return InvalidName<T>(
      failedValue: failedValue,
    );
  }

  InvalidGender<T> invalidGender<T>({@required T failedValue}) {
    return InvalidGender<T>(
      failedValue: failedValue,
    );
  }
}

const $ValueFailure = _$ValueFailureTearOff();

class _$InvalidEmail<T> implements InvalidEmail<T> {
  const _$InvalidEmail({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidEmail(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidEmail<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  _$InvalidEmail<T> copyWith({
    Object failedValue = freezed,
  }) {
    return _$InvalidEmail<T>(
      failedValue: failedValue == freezed ? this.failedValue : failedValue as T,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidEmail(@required T failedValue),
    @required Result shortPassword(@required T failedValue),
    @required Result invalidName(@required T failedValue),
    @required Result invalidGender(@required T failedValue),
  }) {
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidName != null);
    assert(invalidGender != null);
    return invalidEmail(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidEmail(@required T failedValue),
    Result shortPassword(@required T failedValue),
    Result invalidName(@required T failedValue),
    Result invalidGender(@required T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidEmail != null) {
      return invalidEmail(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
    @required Result invalidName(InvalidName<T> value),
    @required Result invalidGender(InvalidGender<T> value),
  }) {
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidName != null);
    assert(invalidGender != null);
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    Result invalidName(InvalidName<T> value),
    Result invalidGender(InvalidGender<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail<T> implements ValueFailure<T> {
  const factory InvalidEmail({@required T failedValue}) = _$InvalidEmail<T>;

  @override
  T get failedValue;

  @override
  InvalidEmail<T> copyWith({T failedValue});
}

class _$ShortPassword<T> implements ShortPassword<T> {
  const _$ShortPassword({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.shortPassword(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShortPassword<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  _$ShortPassword<T> copyWith({
    Object failedValue = freezed,
  }) {
    return _$ShortPassword<T>(
      failedValue: failedValue == freezed ? this.failedValue : failedValue as T,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidEmail(@required T failedValue),
    @required Result shortPassword(@required T failedValue),
    @required Result invalidName(@required T failedValue),
    @required Result invalidGender(@required T failedValue),
  }) {
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidName != null);
    assert(invalidGender != null);
    return shortPassword(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidEmail(@required T failedValue),
    Result shortPassword(@required T failedValue),
    Result invalidName(@required T failedValue),
    Result invalidGender(@required T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shortPassword != null) {
      return shortPassword(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
    @required Result invalidName(InvalidName<T> value),
    @required Result invalidGender(InvalidGender<T> value),
  }) {
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidName != null);
    assert(invalidGender != null);
    return shortPassword(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    Result invalidName(InvalidName<T> value),
    Result invalidGender(InvalidGender<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class ShortPassword<T> implements ValueFailure<T> {
  const factory ShortPassword({@required T failedValue}) = _$ShortPassword<T>;

  @override
  T get failedValue;

  @override
  ShortPassword<T> copyWith({T failedValue});
}

class _$InvalidName<T> implements InvalidName<T> {
  const _$InvalidName({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidName(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidName<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  _$InvalidName<T> copyWith({
    Object failedValue = freezed,
  }) {
    return _$InvalidName<T>(
      failedValue: failedValue == freezed ? this.failedValue : failedValue as T,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidEmail(@required T failedValue),
    @required Result shortPassword(@required T failedValue),
    @required Result invalidName(@required T failedValue),
    @required Result invalidGender(@required T failedValue),
  }) {
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidName != null);
    assert(invalidGender != null);
    return invalidName(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidEmail(@required T failedValue),
    Result shortPassword(@required T failedValue),
    Result invalidName(@required T failedValue),
    Result invalidGender(@required T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidName != null) {
      return invalidName(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
    @required Result invalidName(InvalidName<T> value),
    @required Result invalidGender(InvalidGender<T> value),
  }) {
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidName != null);
    assert(invalidGender != null);
    return invalidName(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    Result invalidName(InvalidName<T> value),
    Result invalidGender(InvalidGender<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidName != null) {
      return invalidName(this);
    }
    return orElse();
  }
}

abstract class InvalidName<T> implements ValueFailure<T> {
  const factory InvalidName({@required T failedValue}) = _$InvalidName<T>;

  @override
  T get failedValue;

  @override
  InvalidName<T> copyWith({T failedValue});
}

class _$InvalidGender<T> implements InvalidGender<T> {
  const _$InvalidGender({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidGender(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidGender<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  _$InvalidGender<T> copyWith({
    Object failedValue = freezed,
  }) {
    return _$InvalidGender<T>(
      failedValue: failedValue == freezed ? this.failedValue : failedValue as T,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidEmail(@required T failedValue),
    @required Result shortPassword(@required T failedValue),
    @required Result invalidName(@required T failedValue),
    @required Result invalidGender(@required T failedValue),
  }) {
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidName != null);
    assert(invalidGender != null);
    return invalidGender(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidEmail(@required T failedValue),
    Result shortPassword(@required T failedValue),
    Result invalidName(@required T failedValue),
    Result invalidGender(@required T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidGender != null) {
      return invalidGender(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
    @required Result invalidName(InvalidName<T> value),
    @required Result invalidGender(InvalidGender<T> value),
  }) {
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidName != null);
    assert(invalidGender != null);
    return invalidGender(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    Result invalidName(InvalidName<T> value),
    Result invalidGender(InvalidGender<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidGender != null) {
      return invalidGender(this);
    }
    return orElse();
  }
}

abstract class InvalidGender<T> implements ValueFailure<T> {
  const factory InvalidGender({@required T failedValue}) = _$InvalidGender<T>;

  @override
  T get failedValue;

  @override
  InvalidGender<T> copyWith({T failedValue});
}
