import 'package:caribe_tour/domain/plans/place.dart';
import 'package:caribe_tour/domain/plans/plan.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/central_widget/plans/plans_detail/widgets/place_item.dart';
import 'package:caribe_tour/presentation/pages/new_plan/edit_plan/edit_plan_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PlacesList extends StatelessWidget {
  final List<Place> places;
  final Plan plan;
  final bool accepted;
  final List<Place> placesVisited;

  const PlacesList({
    @required this.places,
    @required this.placesVisited,
    this.plan,
    this.accepted,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> placesVisitedNames = [];

    for (final place in placesVisited) {
      placesVisitedNames.add(place.name);
    }

    final List<Place> placesInOrder = [];
    for (final placeName in plan.namesInOrder) {
      for (final place in places) {
        if (place.name == placeName) {
          placesInOrder.add(place);
        }
      }
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 60),
      physics: const BouncingScrollPhysics(),
      itemCount: placesInOrder.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Row(
            children: [
              Expanded(
                child: Text(
                  tr('plan_details.places'),
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    fontFamily: 'SF Pro Bold',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Visibility(
                visible: accepted,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: EditPlan(plan: plan),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                    ),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 70,
                    height: 30,
                    child: Center(
                      child: Text(
                        tr('plan_details.edit'),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        } else {
          if (placesInOrder[index - 1].id != CURRENT_LOCATION) {
            return PlaceItem(
              place: placesInOrder[index - 1],
              placesVisitedNames: placesVisitedNames,
              planId: plan.id,
            );
          } else {
            return const SizedBox();
          }
        }
      },
    );
  }
}
