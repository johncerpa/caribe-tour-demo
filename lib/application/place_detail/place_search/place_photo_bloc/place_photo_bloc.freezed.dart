// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'place_photo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$PlacePhotoEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result loadingPlaceInfo(String photoReference, String placeId),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result loadingPlaceInfo(String photoReference, String placeId),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result loadingPlaceInfo(_LoadingPlaceInfo value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result loadingPlaceInfo(_LoadingPlaceInfo value),
    @required Result orElse(),
  });
}

class _$PlacePhotoEventTearOff {
  const _$PlacePhotoEventTearOff();

  _Started started() {
    return const _Started();
  }

  _LoadingPlaceInfo loadingPlaceInfo(String photoReference, String placeId) {
    return _LoadingPlaceInfo(
      photoReference,
      placeId,
    );
  }
}

const $PlacePhotoEvent = _$PlacePhotoEventTearOff();

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'PlacePhotoEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result loadingPlaceInfo(String photoReference, String placeId),
  }) {
    assert(started != null);
    assert(loadingPlaceInfo != null);
    return started();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result loadingPlaceInfo(String photoReference, String placeId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result loadingPlaceInfo(_LoadingPlaceInfo value),
  }) {
    assert(started != null);
    assert(loadingPlaceInfo != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result loadingPlaceInfo(_LoadingPlaceInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements PlacePhotoEvent {
  const factory _Started() = _$_Started;
}

class _$_LoadingPlaceInfo implements _LoadingPlaceInfo {
  const _$_LoadingPlaceInfo(this.photoReference, this.placeId)
      : assert(photoReference != null),
        assert(placeId != null);

  @override
  final String photoReference;
  @override
  final String placeId;

  @override
  String toString() {
    return 'PlacePhotoEvent.loadingPlaceInfo(photoReference: $photoReference, placeId: $placeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadingPlaceInfo &&
            (identical(other.photoReference, photoReference) ||
                const DeepCollectionEquality()
                    .equals(other.photoReference, photoReference)) &&
            (identical(other.placeId, placeId) ||
                const DeepCollectionEquality().equals(other.placeId, placeId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(photoReference) ^
      const DeepCollectionEquality().hash(placeId);

  @override
  _$_LoadingPlaceInfo copyWith({
    Object photoReference = freezed,
    Object placeId = freezed,
  }) {
    return _$_LoadingPlaceInfo(
      photoReference == freezed
          ? this.photoReference
          : photoReference as String,
      placeId == freezed ? this.placeId : placeId as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result loadingPlaceInfo(String photoReference, String placeId),
  }) {
    assert(started != null);
    assert(loadingPlaceInfo != null);
    return loadingPlaceInfo(photoReference, placeId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result loadingPlaceInfo(String photoReference, String placeId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingPlaceInfo != null) {
      return loadingPlaceInfo(photoReference, placeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result loadingPlaceInfo(_LoadingPlaceInfo value),
  }) {
    assert(started != null);
    assert(loadingPlaceInfo != null);
    return loadingPlaceInfo(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result loadingPlaceInfo(_LoadingPlaceInfo value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingPlaceInfo != null) {
      return loadingPlaceInfo(this);
    }
    return orElse();
  }
}

abstract class _LoadingPlaceInfo implements PlacePhotoEvent {
  const factory _LoadingPlaceInfo(String photoReference, String placeId) =
      _$_LoadingPlaceInfo;

  String get photoReference;
  String get placeId;

  _LoadingPlaceInfo copyWith({String photoReference, String placeId});
}

mixin _$PlacePhotoState {
  Option<ResultModel> get result;

  PlacePhotoState copyWith({Option<ResultModel> result});
}

class _$PlacePhotoStateTearOff {
  const _$PlacePhotoStateTearOff();

  _PlacePhotoState call({@required Option<ResultModel> result}) {
    return _PlacePhotoState(
      result: result,
    );
  }
}

const $PlacePhotoState = _$PlacePhotoStateTearOff();

class _$_PlacePhotoState implements _PlacePhotoState {
  const _$_PlacePhotoState({@required this.result}) : assert(result != null);

  @override
  final Option<ResultModel> result;

  @override
  String toString() {
    return 'PlacePhotoState(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PlacePhotoState &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(result);

  @override
  _$_PlacePhotoState copyWith({
    Object result = freezed,
  }) {
    return _$_PlacePhotoState(
      result: result == freezed ? this.result : result as Option<ResultModel>,
    );
  }
}

abstract class _PlacePhotoState implements PlacePhotoState {
  const factory _PlacePhotoState({@required Option<ResultModel> result}) =
      _$_PlacePhotoState;

  @override
  Option<ResultModel> get result;

  @override
  _PlacePhotoState copyWith({Option<ResultModel> result});
}
