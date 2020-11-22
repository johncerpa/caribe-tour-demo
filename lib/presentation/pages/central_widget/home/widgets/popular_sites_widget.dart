import 'package:caribe_tour/application/home/popular_places/popular_places_bloc.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/place/placesdetail/places_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:transparent_image/transparent_image.dart';

Widget popularSitesWidget(BuildContext context) {
  return BlocBuilder<PopularPlacesBloc, PopularPlacesState>(
    builder: (context, state) {
      return state.places.fold(
        () => const Align(
          child: SizedBox(
            height: 240,
            width: 240,
            child: Center(
              child: SpinKitWanderingCubes(color: kSecondaryColor),
            ),
          ),
        ),
        (places) => Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: 240,
          width: 190,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: places.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return siteItem(context, places[index]);
            },
          ),
        ),
      );
    },
  );
}

Widget siteItem(BuildContext context, Place place) {
  return Container(
    height: 240,
    width: 190.0,
    margin: const EdgeInsets.all(10),
    decoration: placesDecoration(),
    child: Column(
      children: [
        Flexible(
          flex: 3,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  child: PlaceDetail(
                    place: place,
                    canPost: true,
                  ),
                  type: PageTransitionType.rightToLeft,
                ),
              );
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: FadeInImage(
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: MemoryImage(kTransparentImage),
                      image: NetworkImage(place.imageUrl),
                    ),
                  ),
                  Positioned(
                    left: 8,
                    bottom: 30,
                    child: Text(
                      place.name,
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: 'SF Pro Bold',
                        fontSize: MediaQuery.of(context).size.width * 0.035,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 8,
                    bottom: 10,
                    child: Row(
                      children: [
                        const Icon(
                          Ionicons.ios_navigate,
                          color: Colors.white,
                          size: 14,
                        ),
                        Text(
                          '${place.city}, ${place.department}',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

BoxDecoration placesDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        spreadRadius: 3,
        blurRadius: 3, // changes position of shadow
        offset: const Offset(2, 3),
      ),
    ],
  );
}
