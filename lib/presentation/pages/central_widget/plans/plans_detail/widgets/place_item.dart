import 'package:caribe_tour/application/plan_detail/plan_details/plan_details_bloc.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:caribe_tour/injection.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/place/placesdetail/places_detail_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class PlaceItem extends StatelessWidget {
  final Place place;
  final List<String> placesVisitedNames;
  final String planId;

  const PlaceItem({
    this.place,
    this.placesVisitedNames,
    this.planId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
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
            flex: 2,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: PlaceDetail(
                      place: place,
                      canPost: true,
                    ),
                    type: PageTransitionType.leftToRight,
                  ),
                );
              },
              child: Container(
                height: 135,
                width: 190,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(place.imageUrl),
                    fit: BoxFit.fill,
                  ),
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 5,
                      left: 5,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 15,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${place.city}, ${place.department}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03,
                              fontFamily: 'SF Pro Bold',
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
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    place.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      color: kSecondaryColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  if (place.rating != null) ...[
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: kPrimaryColor,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          place.rating.toStringAsFixed(1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                  ],
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: placesVisitedNames.contains(place.name)
                              ? kPrimaryColor
                              : kSecondaryDarkerColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 95,
                        height: 40,
                        child: Center(
                          child: Text(
                            placesVisitedNames.contains(place.name)
                                ? tr('plan_details.visited')
                                : tr('plan_details.not_visited'),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      if (!placesVisitedNames.contains(place.name))
                        GestureDetector(
                          onTap: () {
                            context.bloc<PlanDetailsBloc>().add(
                                  PlanDetailsEvent.savingPlaceVisited(
                                    planId,
                                    place.id,
                                  ),
                                );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 40,
                            height: 40,
                            child: const Center(
                              child: Icon(Icons.check, color: Colors.white),
                            ),
                          ),
                        ),
                      if (placesVisitedNames.contains(place.name))
                        GestureDetector(
                          onTap: () {
                            context.bloc<PlanDetailsBloc>().add(
                                  PlanDetailsEvent.removePlaceVisited(
                                    planId,
                                    place.id,
                                  ),
                                );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: kSecondaryDarkerColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 40,
                            height: 40,
                            child: const Center(
                              child: Icon(Icons.remove, color: Colors.white),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
