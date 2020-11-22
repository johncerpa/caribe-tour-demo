import 'package:auto_route/auto_route.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/new_plan/tourist_plan/select_destination_page.dart';
import 'package:caribe_tour/presentation/shared_widgets/classic_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:page_transition/page_transition.dart';

class SelectSourcePage extends StatefulWidget {
  final Map<String, Place> placesMap;
  final String email, title, planid;
  final bool kidsFilter, disableFilter, byDepartment, editing;
  final List<String> citdepart;
  const SelectSourcePage(
      {Key key,
      @required this.placesMap,
      this.email,
      this.byDepartment,
      this.citdepart,
      this.disableFilter,
      @required this.editing,
      @required this.title,
      this.planid,
      this.kidsFilter})
      : super(key: key);

  @override
  _SelectSourcePageState createState() => _SelectSourcePageState();
}

class _SelectSourcePageState extends State<SelectSourcePage> {
  String selectedPlace;
  Location location;
  List<String> placeTexts = [];

  @override
  void initState() {
    super.initState();
    location = Location();

    widget.placesMap.remove(CURRENT_LOCATION);

    for (final place in widget.placesMap.entries) {
      placeTexts.add(place.value.name);
    }
  }

  Future<LocationData> getLocationData() async {
    PermissionStatus permissionStatus = await location.hasPermission();

    while (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }

    final LocationData currentLocationData = await location.getLocation();
    return currentLocationData;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return FutureBuilder(
      future: getLocationData(),
      builder: (context, AsyncSnapshot<LocationData> snapshot) {
        final LocationData currentLocationData = snapshot.data;

        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: flexibleSpace,
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              elevation: 2,
              iconTheme: appBarIconTheme,
              title: Text(
                tr('select_source.select_a_source'),
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Text(
                            selectedPlace == CURRENT_LOCATION
                                ? "${tr('select_source.current_location')}    ✔"
                                : tr('select_source.current_location'),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                        ),
                      ),
                    ),
                    for (var place in placeTexts)
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text(
                              selectedPlace == place ? "$place    ✔" : place,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                              ),
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(height: 20),
                    ClassicButton(
                      colors: const [kSecondaryColor, kSecondaryDarkerColor],
                      onPressedFn: () {
                        if (selectedPlace != null) {
                          if (selectedPlace == CURRENT_LOCATION) {
                            widget.placesMap[CURRENT_LOCATION] = Place(
                              name: CURRENT_LOCATION,
                              latitude: currentLocationData.latitude,
                              longitude: currentLocationData.longitude,
                            );
                          }

                          Navigator.push(
                            context,
                            PageTransition(
                              child: SelectDestinationPage(
                                title: widget.title,
                                placesMap: widget.placesMap,
                                sourcePlace: selectedPlace,
                                email: widget.email,
                                kidsFilter: widget.kidsFilter,
                                disableFilter: widget.disableFilter,
                                byDepartment: widget.byDepartment,
                                citdepart: widget.citdepart,
                                editing: widget.editing,
                                planid: widget.planid,
                                currentLocationData: currentLocationData,
                              ),
                              duration: const Duration(milliseconds: 500),
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
                        } else {
                          FlushbarHelper.createError(
                            message: tr(
                              'select_source.you_must_select_a_source',
                            ),
                          ).show(context);
                        }
                      },
                      child: Text(
                        tr('select_source.continue'),
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
        } else {
          return const Center(
            child: SizedBox(
              height: 150,
              width: 150,
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: FlareActor(
                    "assets/images/PalmProject.flr",
                    animation: "Untitled",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
