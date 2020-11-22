// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'map_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$MapBlocEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required
        Result updatePlan(String planName, Map<String, Place> places,
            String source, String destination, String email, String planid),
    @required Result returnHome(),
    @required
        Result savingNewPlan(
            String planName,
            Map<String, Place> places,
            String source,
            String destination,
            String email,
            bool kidsFilter,
            bool disableFilter,
            bool byDepartment,
            List<String> citdepart,
            List<Place> placesOrder),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result updatePlan(String planName, Map<String, Place> places, String source,
        String destination, String email, String planid),
    Result returnHome(),
    Result savingNewPlan(
        String planName,
        Map<String, Place> places,
        String source,
        String destination,
        String email,
        bool kidsFilter,
        bool disableFilter,
        bool byDepartment,
        List<String> citdepart,
        List<Place> placesOrder),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result updatePlan(_UpdatePlan value),
    @required Result returnHome(_ReturnHome value),
    @required Result savingNewPlan(_SavingNewPlan value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result updatePlan(_UpdatePlan value),
    Result returnHome(_ReturnHome value),
    Result savingNewPlan(_SavingNewPlan value),
    @required Result orElse(),
  });
}

class _$MapBlocEventTearOff {
  const _$MapBlocEventTearOff();

  _Started started() {
    return const _Started();
  }

  _UpdatePlan updatePlan(String planName, Map<String, Place> places,
      String source, String destination, String email, String planid) {
    return _UpdatePlan(
      planName,
      places,
      source,
      destination,
      email,
      planid,
    );
  }

  _ReturnHome returnHome() {
    return const _ReturnHome();
  }

  _SavingNewPlan savingNewPlan(
      String planName,
      Map<String, Place> places,
      String source,
      String destination,
      String email,
      bool kidsFilter,
      bool disableFilter,
      bool byDepartment,
      List<String> citdepart,
      List<Place> placesOrder) {
    return _SavingNewPlan(
      planName,
      places,
      source,
      destination,
      email,
      kidsFilter,
      disableFilter,
      byDepartment,
      citdepart,
      placesOrder,
    );
  }
}

const $MapBlocEvent = _$MapBlocEventTearOff();

class _$_Started with DiagnosticableTreeMixin implements _Started {
  const _$_Started();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MapBlocEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MapBlocEvent.started'));
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
    @required
        Result updatePlan(String planName, Map<String, Place> places,
            String source, String destination, String email, String planid),
    @required Result returnHome(),
    @required
        Result savingNewPlan(
            String planName,
            Map<String, Place> places,
            String source,
            String destination,
            String email,
            bool kidsFilter,
            bool disableFilter,
            bool byDepartment,
            List<String> citdepart,
            List<Place> placesOrder),
  }) {
    assert(started != null);
    assert(updatePlan != null);
    assert(returnHome != null);
    assert(savingNewPlan != null);
    return started();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result updatePlan(String planName, Map<String, Place> places, String source,
        String destination, String email, String planid),
    Result returnHome(),
    Result savingNewPlan(
        String planName,
        Map<String, Place> places,
        String source,
        String destination,
        String email,
        bool kidsFilter,
        bool disableFilter,
        bool byDepartment,
        List<String> citdepart,
        List<Place> placesOrder),
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
    @required Result updatePlan(_UpdatePlan value),
    @required Result returnHome(_ReturnHome value),
    @required Result savingNewPlan(_SavingNewPlan value),
  }) {
    assert(started != null);
    assert(updatePlan != null);
    assert(returnHome != null);
    assert(savingNewPlan != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result updatePlan(_UpdatePlan value),
    Result returnHome(_ReturnHome value),
    Result savingNewPlan(_SavingNewPlan value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements MapBlocEvent {
  const factory _Started() = _$_Started;
}

class _$_UpdatePlan with DiagnosticableTreeMixin implements _UpdatePlan {
  const _$_UpdatePlan(this.planName, this.places, this.source, this.destination,
      this.email, this.planid)
      : assert(planName != null),
        assert(places != null),
        assert(source != null),
        assert(destination != null),
        assert(email != null),
        assert(planid != null);

  @override
  final String planName;
  @override
  final Map<String, Place> places;
  @override
  final String source;
  @override
  final String destination;
  @override
  final String email;
  @override
  final String planid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MapBlocEvent.updatePlan(planName: $planName, places: $places, source: $source, destination: $destination, email: $email, planid: $planid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MapBlocEvent.updatePlan'))
      ..add(DiagnosticsProperty('planName', planName))
      ..add(DiagnosticsProperty('places', places))
      ..add(DiagnosticsProperty('source', source))
      ..add(DiagnosticsProperty('destination', destination))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('planid', planid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdatePlan &&
            (identical(other.planName, planName) ||
                const DeepCollectionEquality()
                    .equals(other.planName, planName)) &&
            (identical(other.places, places) ||
                const DeepCollectionEquality().equals(other.places, places)) &&
            (identical(other.source, source) ||
                const DeepCollectionEquality().equals(other.source, source)) &&
            (identical(other.destination, destination) ||
                const DeepCollectionEquality()
                    .equals(other.destination, destination)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.planid, planid) ||
                const DeepCollectionEquality().equals(other.planid, planid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(planName) ^
      const DeepCollectionEquality().hash(places) ^
      const DeepCollectionEquality().hash(source) ^
      const DeepCollectionEquality().hash(destination) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(planid);

  @override
  _$_UpdatePlan copyWith({
    Object planName = freezed,
    Object places = freezed,
    Object source = freezed,
    Object destination = freezed,
    Object email = freezed,
    Object planid = freezed,
  }) {
    return _$_UpdatePlan(
      planName == freezed ? this.planName : planName as String,
      places == freezed ? this.places : places as Map<String, Place>,
      source == freezed ? this.source : source as String,
      destination == freezed ? this.destination : destination as String,
      email == freezed ? this.email : email as String,
      planid == freezed ? this.planid : planid as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required
        Result updatePlan(String planName, Map<String, Place> places,
            String source, String destination, String email, String planid),
    @required Result returnHome(),
    @required
        Result savingNewPlan(
            String planName,
            Map<String, Place> places,
            String source,
            String destination,
            String email,
            bool kidsFilter,
            bool disableFilter,
            bool byDepartment,
            List<String> citdepart,
            List<Place> placesOrder),
  }) {
    assert(started != null);
    assert(updatePlan != null);
    assert(returnHome != null);
    assert(savingNewPlan != null);
    return updatePlan(planName, places, source, destination, email, planid);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result updatePlan(String planName, Map<String, Place> places, String source,
        String destination, String email, String planid),
    Result returnHome(),
    Result savingNewPlan(
        String planName,
        Map<String, Place> places,
        String source,
        String destination,
        String email,
        bool kidsFilter,
        bool disableFilter,
        bool byDepartment,
        List<String> citdepart,
        List<Place> placesOrder),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updatePlan != null) {
      return updatePlan(planName, places, source, destination, email, planid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result updatePlan(_UpdatePlan value),
    @required Result returnHome(_ReturnHome value),
    @required Result savingNewPlan(_SavingNewPlan value),
  }) {
    assert(started != null);
    assert(updatePlan != null);
    assert(returnHome != null);
    assert(savingNewPlan != null);
    return updatePlan(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result updatePlan(_UpdatePlan value),
    Result returnHome(_ReturnHome value),
    Result savingNewPlan(_SavingNewPlan value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updatePlan != null) {
      return updatePlan(this);
    }
    return orElse();
  }
}

abstract class _UpdatePlan implements MapBlocEvent {
  const factory _UpdatePlan(
      String planName,
      Map<String, Place> places,
      String source,
      String destination,
      String email,
      String planid) = _$_UpdatePlan;

  String get planName;
  Map<String, Place> get places;
  String get source;
  String get destination;
  String get email;
  String get planid;

  _UpdatePlan copyWith(
      {String planName,
      Map<String, Place> places,
      String source,
      String destination,
      String email,
      String planid});
}

class _$_ReturnHome with DiagnosticableTreeMixin implements _ReturnHome {
  const _$_ReturnHome();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MapBlocEvent.returnHome()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MapBlocEvent.returnHome'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ReturnHome);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required
        Result updatePlan(String planName, Map<String, Place> places,
            String source, String destination, String email, String planid),
    @required Result returnHome(),
    @required
        Result savingNewPlan(
            String planName,
            Map<String, Place> places,
            String source,
            String destination,
            String email,
            bool kidsFilter,
            bool disableFilter,
            bool byDepartment,
            List<String> citdepart,
            List<Place> placesOrder),
  }) {
    assert(started != null);
    assert(updatePlan != null);
    assert(returnHome != null);
    assert(savingNewPlan != null);
    return returnHome();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result updatePlan(String planName, Map<String, Place> places, String source,
        String destination, String email, String planid),
    Result returnHome(),
    Result savingNewPlan(
        String planName,
        Map<String, Place> places,
        String source,
        String destination,
        String email,
        bool kidsFilter,
        bool disableFilter,
        bool byDepartment,
        List<String> citdepart,
        List<Place> placesOrder),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (returnHome != null) {
      return returnHome();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result updatePlan(_UpdatePlan value),
    @required Result returnHome(_ReturnHome value),
    @required Result savingNewPlan(_SavingNewPlan value),
  }) {
    assert(started != null);
    assert(updatePlan != null);
    assert(returnHome != null);
    assert(savingNewPlan != null);
    return returnHome(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result updatePlan(_UpdatePlan value),
    Result returnHome(_ReturnHome value),
    Result savingNewPlan(_SavingNewPlan value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (returnHome != null) {
      return returnHome(this);
    }
    return orElse();
  }
}

abstract class _ReturnHome implements MapBlocEvent {
  const factory _ReturnHome() = _$_ReturnHome;
}

class _$_SavingNewPlan with DiagnosticableTreeMixin implements _SavingNewPlan {
  const _$_SavingNewPlan(
      this.planName,
      this.places,
      this.source,
      this.destination,
      this.email,
      this.kidsFilter,
      this.disableFilter,
      this.byDepartment,
      this.citdepart,
      this.placesOrder)
      : assert(planName != null),
        assert(places != null),
        assert(source != null),
        assert(destination != null),
        assert(email != null),
        assert(kidsFilter != null),
        assert(disableFilter != null),
        assert(byDepartment != null),
        assert(citdepart != null),
        assert(placesOrder != null);

  @override
  final String planName;
  @override
  final Map<String, Place> places;
  @override
  final String source;
  @override
  final String destination;
  @override
  final String email;
  @override
  final bool kidsFilter;
  @override
  final bool disableFilter;
  @override
  final bool byDepartment;
  @override
  final List<String> citdepart;
  @override
  final List<Place> placesOrder;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MapBlocEvent.savingNewPlan(planName: $planName, places: $places, source: $source, destination: $destination, email: $email, kidsFilter: $kidsFilter, disableFilter: $disableFilter, byDepartment: $byDepartment, citdepart: $citdepart, placesOrder: $placesOrder)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MapBlocEvent.savingNewPlan'))
      ..add(DiagnosticsProperty('planName', planName))
      ..add(DiagnosticsProperty('places', places))
      ..add(DiagnosticsProperty('source', source))
      ..add(DiagnosticsProperty('destination', destination))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('kidsFilter', kidsFilter))
      ..add(DiagnosticsProperty('disableFilter', disableFilter))
      ..add(DiagnosticsProperty('byDepartment', byDepartment))
      ..add(DiagnosticsProperty('citdepart', citdepart))
      ..add(DiagnosticsProperty('placesOrder', placesOrder));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SavingNewPlan &&
            (identical(other.planName, planName) ||
                const DeepCollectionEquality()
                    .equals(other.planName, planName)) &&
            (identical(other.places, places) ||
                const DeepCollectionEquality().equals(other.places, places)) &&
            (identical(other.source, source) ||
                const DeepCollectionEquality().equals(other.source, source)) &&
            (identical(other.destination, destination) ||
                const DeepCollectionEquality()
                    .equals(other.destination, destination)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.kidsFilter, kidsFilter) ||
                const DeepCollectionEquality()
                    .equals(other.kidsFilter, kidsFilter)) &&
            (identical(other.disableFilter, disableFilter) ||
                const DeepCollectionEquality()
                    .equals(other.disableFilter, disableFilter)) &&
            (identical(other.byDepartment, byDepartment) ||
                const DeepCollectionEquality()
                    .equals(other.byDepartment, byDepartment)) &&
            (identical(other.citdepart, citdepart) ||
                const DeepCollectionEquality()
                    .equals(other.citdepart, citdepart)) &&
            (identical(other.placesOrder, placesOrder) ||
                const DeepCollectionEquality()
                    .equals(other.placesOrder, placesOrder)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(planName) ^
      const DeepCollectionEquality().hash(places) ^
      const DeepCollectionEquality().hash(source) ^
      const DeepCollectionEquality().hash(destination) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(kidsFilter) ^
      const DeepCollectionEquality().hash(disableFilter) ^
      const DeepCollectionEquality().hash(byDepartment) ^
      const DeepCollectionEquality().hash(citdepart) ^
      const DeepCollectionEquality().hash(placesOrder);

  @override
  _$_SavingNewPlan copyWith({
    Object planName = freezed,
    Object places = freezed,
    Object source = freezed,
    Object destination = freezed,
    Object email = freezed,
    Object kidsFilter = freezed,
    Object disableFilter = freezed,
    Object byDepartment = freezed,
    Object citdepart = freezed,
    Object placesOrder = freezed,
  }) {
    return _$_SavingNewPlan(
      planName == freezed ? this.planName : planName as String,
      places == freezed ? this.places : places as Map<String, Place>,
      source == freezed ? this.source : source as String,
      destination == freezed ? this.destination : destination as String,
      email == freezed ? this.email : email as String,
      kidsFilter == freezed ? this.kidsFilter : kidsFilter as bool,
      disableFilter == freezed ? this.disableFilter : disableFilter as bool,
      byDepartment == freezed ? this.byDepartment : byDepartment as bool,
      citdepart == freezed ? this.citdepart : citdepart as List<String>,
      placesOrder == freezed ? this.placesOrder : placesOrder as List<Place>,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required
        Result updatePlan(String planName, Map<String, Place> places,
            String source, String destination, String email, String planid),
    @required Result returnHome(),
    @required
        Result savingNewPlan(
            String planName,
            Map<String, Place> places,
            String source,
            String destination,
            String email,
            bool kidsFilter,
            bool disableFilter,
            bool byDepartment,
            List<String> citdepart,
            List<Place> placesOrder),
  }) {
    assert(started != null);
    assert(updatePlan != null);
    assert(returnHome != null);
    assert(savingNewPlan != null);
    return savingNewPlan(planName, places, source, destination, email,
        kidsFilter, disableFilter, byDepartment, citdepart, placesOrder);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result updatePlan(String planName, Map<String, Place> places, String source,
        String destination, String email, String planid),
    Result returnHome(),
    Result savingNewPlan(
        String planName,
        Map<String, Place> places,
        String source,
        String destination,
        String email,
        bool kidsFilter,
        bool disableFilter,
        bool byDepartment,
        List<String> citdepart,
        List<Place> placesOrder),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (savingNewPlan != null) {
      return savingNewPlan(planName, places, source, destination, email,
          kidsFilter, disableFilter, byDepartment, citdepart, placesOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(_Started value),
    @required Result updatePlan(_UpdatePlan value),
    @required Result returnHome(_ReturnHome value),
    @required Result savingNewPlan(_SavingNewPlan value),
  }) {
    assert(started != null);
    assert(updatePlan != null);
    assert(returnHome != null);
    assert(savingNewPlan != null);
    return savingNewPlan(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(_Started value),
    Result updatePlan(_UpdatePlan value),
    Result returnHome(_ReturnHome value),
    Result savingNewPlan(_SavingNewPlan value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (savingNewPlan != null) {
      return savingNewPlan(this);
    }
    return orElse();
  }
}

abstract class _SavingNewPlan implements MapBlocEvent {
  const factory _SavingNewPlan(
      String planName,
      Map<String, Place> places,
      String source,
      String destination,
      String email,
      bool kidsFilter,
      bool disableFilter,
      bool byDepartment,
      List<String> citdepart,
      List<Place> placesOrder) = _$_SavingNewPlan;

  String get planName;
  Map<String, Place> get places;
  String get source;
  String get destination;
  String get email;
  bool get kidsFilter;
  bool get disableFilter;
  bool get byDepartment;
  List<String> get citdepart;
  List<Place> get placesOrder;

  _SavingNewPlan copyWith(
      {String planName,
      Map<String, Place> places,
      String source,
      String destination,
      String email,
      bool kidsFilter,
      bool disableFilter,
      bool byDepartment,
      List<String> citdepart,
      List<Place> placesOrder});
}

mixin _$MapState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result saving(),
    @required Result saved(),
    @required Result home(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result saving(),
    Result saved(),
    Result home(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result saving(_Saving value),
    @required Result saved(_Saved value),
    @required Result home(_Home value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result saving(_Saving value),
    Result saved(_Saved value),
    Result home(_Home value),
    @required Result orElse(),
  });
}

class _$MapStateTearOff {
  const _$MapStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Saving saving() {
    return const _Saving();
  }

  _Saved saved() {
    return const _Saved();
  }

  _Home home() {
    return const _Home();
  }
}

const $MapState = _$MapStateTearOff();

class _$_Initial with DiagnosticableTreeMixin implements _Initial {
  const _$_Initial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MapState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MapState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result saving(),
    @required Result saved(),
    @required Result home(),
  }) {
    assert(initial != null);
    assert(saving != null);
    assert(saved != null);
    assert(home != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result saving(),
    Result saved(),
    Result home(),
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
    @required Result initial(_Initial value),
    @required Result saving(_Saving value),
    @required Result saved(_Saved value),
    @required Result home(_Home value),
  }) {
    assert(initial != null);
    assert(saving != null);
    assert(saved != null);
    assert(home != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result saving(_Saving value),
    Result saved(_Saved value),
    Result home(_Home value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MapState {
  const factory _Initial() = _$_Initial;
}

class _$_Saving with DiagnosticableTreeMixin implements _Saving {
  const _$_Saving();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MapState.saving()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MapState.saving'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Saving);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result saving(),
    @required Result saved(),
    @required Result home(),
  }) {
    assert(initial != null);
    assert(saving != null);
    assert(saved != null);
    assert(home != null);
    return saving();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result saving(),
    Result saved(),
    Result home(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saving != null) {
      return saving();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result saving(_Saving value),
    @required Result saved(_Saved value),
    @required Result home(_Home value),
  }) {
    assert(initial != null);
    assert(saving != null);
    assert(saved != null);
    assert(home != null);
    return saving(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result saving(_Saving value),
    Result saved(_Saved value),
    Result home(_Home value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saving != null) {
      return saving(this);
    }
    return orElse();
  }
}

abstract class _Saving implements MapState {
  const factory _Saving() = _$_Saving;
}

class _$_Saved with DiagnosticableTreeMixin implements _Saved {
  const _$_Saved();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MapState.saved()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MapState.saved'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Saved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result saving(),
    @required Result saved(),
    @required Result home(),
  }) {
    assert(initial != null);
    assert(saving != null);
    assert(saved != null);
    assert(home != null);
    return saved();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result saving(),
    Result saved(),
    Result home(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result saving(_Saving value),
    @required Result saved(_Saved value),
    @required Result home(_Home value),
  }) {
    assert(initial != null);
    assert(saving != null);
    assert(saved != null);
    assert(home != null);
    return saved(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result saving(_Saving value),
    Result saved(_Saved value),
    Result home(_Home value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class _Saved implements MapState {
  const factory _Saved() = _$_Saved;
}

class _$_Home with DiagnosticableTreeMixin implements _Home {
  const _$_Home();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MapState.home()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MapState.home'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Home);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result saving(),
    @required Result saved(),
    @required Result home(),
  }) {
    assert(initial != null);
    assert(saving != null);
    assert(saved != null);
    assert(home != null);
    return home();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result saving(),
    Result saved(),
    Result home(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (home != null) {
      return home();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result saving(_Saving value),
    @required Result saved(_Saved value),
    @required Result home(_Home value),
  }) {
    assert(initial != null);
    assert(saving != null);
    assert(saved != null);
    assert(home != null);
    return home(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result saving(_Saving value),
    Result saved(_Saved value),
    Result home(_Home value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (home != null) {
      return home(this);
    }
    return orElse();
  }
}

abstract class _Home implements MapState {
  const factory _Home() = _$_Home;
}
