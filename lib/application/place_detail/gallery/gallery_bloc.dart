import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:caribe_tour/domain/post/gallery.dart';
import 'package:caribe_tour/domain/post/interfaces/i_gallery_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';
part 'gallery_bloc.freezed.dart';

@injectable
class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final IGalleryRepository _galleryRepository;

  GalleryBloc(this._galleryRepository) : super(GalleryState.initial());

  @override
  Stream<GalleryState> mapEventToState(
    GalleryEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {},
      save: (e) async* {
        _galleryRepository.addGallery(e.namePlace, e.photo, e.coll);
      },
      getGallery: (e) async* {
        final gallery =
            await _galleryRepository.getGallery(e.namePlace, e.coll);
        print(gallery);
        final galleryStream =
            await _galleryRepository.getGalleryStream(e.namePlace, e.coll);
        yield state.copyWith(
            gallery: some(gallery), galleryStream: galleryStream);
      },
    );
  }
}
