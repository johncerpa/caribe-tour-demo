import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:caribe_tour/application/place_detail/place_search/place_photo_bloc/result_model.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_place/google_place.dart';
import 'package:injectable/injectable.dart';

part 'place_photo_event.dart';
part 'place_photo_state.dart';
part 'place_photo_bloc.freezed.dart';

@injectable
class PlacePhotoBloc extends Bloc<PlacePhotoEvent, PlacePhotoState> {
  PlacePhotoBloc() : super(PlacePhotoState.initial());

  GooglePlace placeApi = GooglePlace(
    "AIzaSyBi6m7NZzZj5FohxxFzWkg8CLhyZRWxS8Y",
  );

  @override
  Stream<PlacePhotoState> mapEventToState(
    PlacePhotoEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {},
      loadingPlaceInfo: (e) async* {
        Uint8List photo;

        if (e.photoReference.isNotEmpty) {
          photo = await placeApi.photos.get(e.photoReference, 800, 800);
        }

        final detail = await placeApi.details.get(e.placeId);

        yield state.copyWith(
          result: some(
            ResultModel(
              photo: photo,
              address: detail.result.formattedAddress ?? '',
            ),
          ),
        );
      },
    );
  }
}
