import 'package:auto_route/auto_route.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/new_plan/tourist_plan/widgets/map_ready.dart';
import 'package:caribe_tour/presentation/shared_widgets/classic_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:page_transition/page_transition.dart';

class SelectDestinationPage extends StatefulWidget {
  final Map<String, Place> placesMap;
  final String sourcePlace;
  final String email, title, planid;
  final bool kidsFilter, disableFilter, byDepartment, editing;
  final List<String> citdepart;
  final LocationData currentLocationData;
  const SelectDestinationPage(
      {Key key,
      this.title,
      @required this.placesMap,
      @required this.sourcePlace,
      this.byDepartment,
      this.citdepart,
      this.disableFilter,
      this.kidsFilter,
      this.email,
      this.planid,
      this.currentLocationData,
      this.editing})
      : super(key: key);

  @override
  _SelectDestinationPageState createState() => _SelectDestinationPageState();
}

class _SelectDestinationPageState extends State<SelectDestinationPage> {
  String selectedPlace;
  Location location;
  List<String> places = [];

  @override
  void initState() {
    super.initState();
    location = Location();

    for (final place in widget.placesMap.entries) {
      places.add(place.value.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: flexibleSpace,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 2,
        iconTheme: appBarIconTheme,
        title: Text(
          tr('select_destination.select_a_destination'),
          style: getAppBarTextStyle(context),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPlace = CURRENT_LOCATION;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: selectedPlace == CURRENT_LOCATION
                        ? kSecondaryColor
                        : kPrimaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      selectedPlace == CURRENT_LOCATION
                          ? "${tr('select_source.current_location')}    ✔"
                          : tr('select_source.current_location'),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                  ),
                ),
              ),
              for (var place in places)
                if (place != CURRENT_LOCATION)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPlace = place;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: selectedPlace == place
                            ? kSecondaryColor
                            : kPrimaryColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          selectedPlace == place ? "$place   ✔" : place,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
              const SizedBox(height: 20),
              ClassicButton(
                onPressedFn: () {
                  if (selectedPlace != null) {
                    final source = widget.placesMap[widget.sourcePlace].name;
                    final destination = widget.placesMap[selectedPlace].name;

                    final bool placeIsAdded =
                        widget.placesMap.containsKey(CURRENT_LOCATION);

                    if (selectedPlace == CURRENT_LOCATION && !placeIsAdded) {
                      widget.placesMap[CURRENT_LOCATION] = Place(
                        name: CURRENT_LOCATION,
                        latitude: widget.currentLocationData.latitude,
                        longitude: widget.currentLocationData.longitude,
                      );
                    }

                    /* Navigator.push(
                      context,
                      PageTransition(
                        child: MapPage(
                            places: widget.placesMap,
                            source: source,
                            destination: destination,
                            email: widget.email,
                            kidsFilter: widget.kidsFilter,
                            disableFilter: widget.disableFilter,
                            byDepartment: widget.byDepartment,
                            citdepart: widget.citdepart,
                            editing: widget.editing,
                            title: widget.title,
                            planid: widget.planid),
                        type: PageTransitionType.rightToLeft,
                      ),
                    ); */

                    Navigator.push(
                      context,
                      PageTransition(
                        child: MapReadyPage(
                          placesMap: widget.placesMap,
                          source: source,
                          destination: destination,
                          email: widget.email,
                          kidsFilter: widget.kidsFilter,
                          disableFilter: widget.disableFilter,
                          byDepartment: widget.byDepartment,
                          citdepart: widget.citdepart,
                          editing: widget.editing,
                          title: widget.title,
                          planid: widget.planid,
                        ),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  } else {
                    FlushbarHelper.createError(
                      message: tr(
                        'select_destination.you_must_select_a_destination',
                      ),
                    ).show(context);
                  }
                },
                colors: const [kSecondaryColor, kSecondaryDarkerColor],
                child: Text(
                  tr('select_destination.continue'),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
