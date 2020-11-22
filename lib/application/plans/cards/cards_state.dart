part of 'cards_bloc.dart';

@freezed
abstract class CardsState with _$CardsState {
  const factory CardsState({
    @required Option<List<Place>> places,
  }) = _CardsState;

  factory CardsState.initial() => CardsState(
        places: none(),
      );
}
