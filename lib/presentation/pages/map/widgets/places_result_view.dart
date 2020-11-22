import 'package:caribe_tour/application/place_detail/place_search/place_search_bloc.dart';
import 'package:caribe_tour/injection.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/map/widgets/simple_map_source_destination.dart';
import 'package:caribe_tour/presentation/shared_widgets/loading_resources.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:page_transition/page_transition.dart';

class PlacesResult extends StatelessWidget {
  final String placeType;
  final String language;
  final LocationData location;

  const PlacesResult({
    Key key,
    @required this.placeType,
    @required this.location,
    @required this.language,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return getIt<PlaceSearchBloc>()
            ..add(
              PlaceSearchEvent.loadingPlaces(
                location.latitude,
                location.longitude,
                placeType,
                language,
              ),
            );
        },
        child: BlocBuilder<PlaceSearchBloc, PlaceSearchState>(
          builder: (context, state) {
            return state.places.fold(
              () => const LoadingResources(
                color1: kSecondaryColor,
                color2: kSecondaryDarkerColor,
              ),
              (placesFound) => Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: 5,
                  bottom: 10,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [kPrimaryDarkerColor, kPrimaryColor],
                    stops: [0.2, 0.8],
                  ),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        tr('place_search.results'),
                        style: TextStyle(
                          fontFamily: 'SF Pro bold',
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.08,
                        ),
                      ),
                    ),
                    if (placesFound.isEmpty)
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 40),
                              child: Align(
                                child: Image.asset(
                                  'assets/images/reloj.png',
                                  width: 150,
                                ),
                              ),
                            ),
                            Text(
                              tr('place_search.no_results'),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (placesFound.isNotEmpty)
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.all(0),
                          physics: const BouncingScrollPhysics(),
                          itemCount: placesFound.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            final currentPlace = placesFound[index];

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    child: SimpleMapSourceDest(
                                      sourceLat: location.latitude,
                                      sourceLng: location.longitude,
                                      destLat:
                                          currentPlace.geometry.location.lat,
                                      destLng:
                                          currentPlace.geometry.location.lng,
                                      sourceName: tr('place_search.youre_here'),
                                      destinationName: currentPlace.name,
                                      place: currentPlace,
                                      placeType: placeType,
                                    ),
                                    type: PageTransitionType.rightToLeft,
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    )
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 110,
                                        width: 110,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images/$placeType.png',
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              currentPlace.name,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04,
                                                color: kSecondaryColor,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 5),
                                            if (currentPlace.rating !=
                                                null) ...[
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: kPrimaryColor,
                                                    size: 16,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    currentPlace.rating
                                                        .toString(),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                            ],
                                            const SizedBox(height: 5),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 5,
                                                bottom: 5,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Text(
                                                tr('place_search.open'),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
