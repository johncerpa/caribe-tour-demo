part of 'carousel_bloc.dart';

@freezed
abstract class CarouselEvent with _$CarouselEvent {
  const factory CarouselEvent.started() = _Started;
  const factory CarouselEvent.randomPlaces() = RandomPlaces;
}
