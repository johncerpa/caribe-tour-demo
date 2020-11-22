part of 'carousel_bloc.dart';

@freezed
abstract class CarouselState with _$CarouselState {
  const factory CarouselState({
    @required Option<List<Place>> places,
  }) = _CarouselState;
  factory CarouselState.initial() => CarouselState(places: none());
}
