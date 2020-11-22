import 'package:caribe_tour/domain/plans/place.dart';
import 'package:caribe_tour/presentation/pages/map/map_page.dart';
import 'package:caribe_tour/presentation/shared_widgets/classic_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:page_transition/page_transition.dart';

class MapReadyPage extends StatelessWidget {
  final Map<String, Place> placesMap;

  final String email, title, planid;
  final bool kidsFilter, disableFilter, byDepartment, editing;
  final List<String> citdepart;
  final LocationData currentLocationData;
  final String source, destination;

  const MapReadyPage({
    Key key,
    this.placesMap,
    this.email,
    this.title,
    this.planid,
    this.kidsFilter,
    this.disableFilter,
    this.byDepartment,
    this.editing,
    this.citdepart,
    this.currentLocationData,
    this.source,
    this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Align(
          alignment: Alignment.centerRight,
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const FlareActor(
                  "assets/images/Rekab.flr",
                  animation: "Show ",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 80,
                left: 30,
                child: SizedBox(
                  width: 400,
                  child: Text(
                    tr('map_ready.map_ready'),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                right: 30,
                child: ClassicButton(
                  width: 150,
                  onPressedFn: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: MapPage(
                          places: placesMap,
                          source: source,
                          destination: destination,
                          email: email,
                          kidsFilter: kidsFilter,
                          disableFilter: disableFilter,
                          byDepartment: byDepartment,
                          citdepart: citdepart,
                          editing: editing,
                          title: title,
                          planid: planid,
                        ),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  },
                  child: Text(
                    tr('map_ready.next'),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
