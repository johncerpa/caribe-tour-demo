import 'package:caribe_tour/application/home/carousel/carousel_bloc.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:caribe_tour/presentation/pages/central_widget/home/widgets/gallery_home.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:transparent_image/transparent_image.dart';

Widget carouselSlider(BuildContext context) {
  return BlocBuilder<CarouselBloc, CarouselState>(
    builder: (context, state) {
      return state.places.fold(
        () => const Center(child: CircularProgressIndicator()),
        (places) => Center(
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width * 0.9,
            child: CarouselSlider(
              items: places
                  .map((item) => carouselItem(context, item, places))
                  .toList(),
              options: CarouselOptions(
                height: 250,
                viewportFraction: 1.0,
                autoPlay: true,
              ),
            ),
          ),
        ),
      );
    },
  );
}

Widget carouselItem(BuildContext context, Place place, List<Place> places) {
  return SizedBox(
    height: 300,
    child: Stack(
      children: [
        FadeInImage(
          fit: BoxFit.fill,
          placeholder: MemoryImage(kTransparentImage),
          image: NetworkImage(place.imageUrl),
          height: 250,
          width: double.infinity,
        ),
        Container(
          color: Colors.black.withOpacity(0.3),
        ),
        GestureDetector(
            onTap: () {
              var index = places.indexOf(place);
              var aux = places.sublist(index, places.length);
              if (aux.length < places.length) {
                var aux2 = places.sublist(0, index);
                aux = aux + aux2;
              }
              Navigator.push(
                context,
                PageTransition(
                  child: GalleryHome(
                    places: aux,
                  ),
                  type: PageTransitionType.scale,
                ),
              );
            },
            child: Align(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  place.name.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.065,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
      ],
    ),
  );
}
