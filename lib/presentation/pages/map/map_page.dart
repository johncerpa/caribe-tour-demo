import 'dart:collection';
import 'package:auto_route/auto_route.dart';
import 'package:caribe_tour/application/plans/map/map_bloc.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:caribe_tour/injection.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/central_widget/central_widget.dart';
import 'package:caribe_tour/presentation/pages/map/camera_settings.dart';
import 'package:caribe_tour/presentation/pages/map/herlpers.dart';
import 'package:caribe_tour/presentation/shared_widgets/classic_button.dart';
import 'package:duration/duration.dart';
import 'package:duration/locale.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_directions_api/google_directions_api.dart' as google_directions_api;
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:transparent_image/transparent_image.dart';

class MapPage extends StatefulWidget {
  const MapPage({
    Key key,
    this.planid,
    @required this.places,
    @required this.source,
    @required this.destination,
    this.email,
    this.byDepartment,
    this.citdepart,
    this.disableFilter,
    this.kidsFilter,
    this.editing,
    this.title,
  }) : super(key: key);

  final Map<String, Place> places;
  final String source, destination, email, title, planid;
  final bool kidsFilter, disableFilter, byDepartment, editing;
  final List<String> citdepart;

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng sourceLocation, destLocation;
  List<google_directions_api.DirectionsWaypoint> waypoints = [];
  List<String> waypointsNames = [];

  final directionsService = google_directions_api.DirectionsService();
  google_directions_api.DirectionsRequest request;

  GoogleMapController _mapController;
  // TODO: Remove key
  String googleApiKey = "";

  // Icons
  BitmapDescriptor sourceIcon, intermediateIcon, destinationIcon;

  // Polyline objects
  PolylinePoints polylinePoints = PolylinePoints();
  final Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [];

  final Set<Marker> _markers = HashSet<Marker>();
  Marker sourceMarker, destinationMarker;

  TextEditingController nameInputController = TextEditingController();

  MapType mapType = MapType.hybrid;

  Future<List<Place>> _future;
  bool mapWasCreated = false;

  String durationFormatted = "";

  double distanceInMeters = 0;
  double totalDistance = 0;

  List<Place> userPlacesOrder;

  Place currentPlace;

  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.title != null) {
        nameInputController.text = widget.title;
      } else {
        nameInputController.text = "";
      }
    });

    final firstPlace = widget.places[widget.source];
    final lastPlace = widget.places[widget.destination];

    sourceLocation = LatLng(firstPlace.latitude, firstPlace.longitude);
    destLocation = LatLng(lastPlace.latitude, lastPlace.longitude);

    if (widget.places.length > 2) {
      for (final mapEntry in widget.places.entries) {
        final isNotSource = mapEntry.value.name != widget.source;
        final isNotDestination = mapEntry.value.name != widget.destination;

        if (isNotSource && isNotDestination) {
          waypointsNames.add(mapEntry.value.name);

          waypoints.add(
            google_directions_api.DirectionsWaypoint(
              location: "${mapEntry.value.latitude}, ${mapEntry.value.longitude}",
            ),
          );
        }
      }
    }

    google_directions_api.DirectionsService.init(googleApiKey);

    setIcons();

    request = google_directions_api.DirectionsRequest(
      origin: "${sourceLocation.latitude},${sourceLocation.longitude}",
      destination: "${destLocation.latitude},${destLocation.longitude}",
      waypoints: waypoints,
      optimizeWaypoints: true,
      travelMode: google_directions_api.TravelMode.driving,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _mapController.dispose();
    nameInputController.dispose();
  }

  Future<void> setIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/green_pin.png',
    );

    intermediateIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/blue_pin.png',
    );

    destinationIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/red_pin.png',
    );
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _mapController = controller;

    await setPolylines();

    setMapPins();

    _setMapStyle();

    setState(() {
      _future = getPlacesOrder();
      mapWasCreated = true;
    });

    await Future.delayed(const Duration(milliseconds: 100));

    _mapController.showMarkerInfoWindow(sourceMarker.markerId);
  }

  Future<List<Place>> getPlacesOrder() async {
    final List<Place> placesOrder = [];

    for (int i = 0; i < polylineCoordinates.length; i++) {
      for (final place in widget.places.entries) {
        final double distance = calculateDistance(
          place.value.latitude,
          place.value.longitude,
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
        );

        if (distance <= 250 && !placesOrder.contains(place.value)) {
          placesOrder.add(place.value);
        }
      }
    }

    if (widget.destination == CURRENT_LOCATION) {
      placesOrder.add(widget.places[widget.destination]);
    }

    userPlacesOrder = placesOrder;

    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          zoom: 14,
          //bearing: currentLocation.heading,
          target: LatLng(
            widget.places[widget.source].latitude,
            widget.places[widget.source].longitude,
          ),
        ),
      ),
    );

    return placesOrder;
  }

  void setMapPins() {
    setState(() {
      sourceMarker = Marker(
        markerId: MarkerId(widget.places[widget.source].name),
        position: sourceLocation,
        icon: sourceIcon,
        infoWindow: InfoWindow(
          title: widget.source == CURRENT_LOCATION ? tr('map_page.current_location') : widget.source,
        ),
      );

      destinationMarker = Marker(
        markerId: MarkerId(widget.destination),
        position: destLocation,
        icon: destinationIcon,
        infoWindow: InfoWindow(
          title: widget.destination,
        ),
      );

      final List<Marker> intermediateMarkers = [];

      int i = 0;
      for (final element in waypoints) {
        final location = element.location as String;
        final latlng = location.split(",");

        final intermediateMarker = Marker(
          markerId: MarkerId(waypointsNames[i]),
          position: LatLng(double.parse(latlng[0]), double.parse(latlng[1])),
          icon: intermediateIcon,
          infoWindow: InfoWindow(
            title: widget.places[waypointsNames[i++]].name,
          ),
        );

        intermediateMarkers.add(intermediateMarker);
      }

      _markers.addAll(
        [sourceMarker, destinationMarker, ...intermediateMarkers],
      );
    });
  }

  Future<void> setPolylines() async {
    await directionsService.route(request, (response, status) {
      distanceInMeters = 0;
      double durationInSeconds = 0;

      if (status == google_directions_api.DirectionsStatus.ok) {
        for (final leg in response.routes.first.legs) {
          distanceInMeters += leg.distance.value;
          durationInSeconds += leg.duration.value;

          for (final step in leg.steps) {
            final decodedPoints = polylinePoints.decodePolyline(
              step.polylinePoints,
            );
            for (final point in decodedPoints) {
              polylineCoordinates.add(LatLng(
                point.latitude,
                point.longitude,
              ));
            }
          }
        }

        setState(() {
          _polylines.add(
            Polyline(
              polylineId: PolylineId('orangePolyline'),
              color: kSecondaryColor,
              points: polylineCoordinates,
              width: 5,
            ),
          );

          durationFormatted = printDuration(
            Duration(seconds: durationInSeconds.toInt()),
            abbreviated: true,
            locale: DurationLocale.fromLanguageCode(
              context.locale.languageCode,
            ),
          );

          // Convert to kilometers
          if (distanceInMeters > 999) {
            totalDistance = distanceInMeters / 1000;
          } else {
            totalDistance = distanceInMeters;
          }
        });
      }
    });
  }

  Future<void> _setMapStyle() async {
    final style = await DefaultAssetBundle.of(context).loadString(
      'assets/darkMode.json',
    );

    /* _mapController.setMapStyle(style); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        automaticallyImplyLeading: false,
      ),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff03dac6),
        onPressed: () {
          setState(() {
            mapType = mapType == MapType.satellite ? MapType.terrain : MapType.satellite;
          });
        },
        child: const Icon(LineAwesomeIcons.adjust, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: BlocProvider(
        create: (context) => getIt<MapBloc>(),
        child: BlocConsumer<MapBloc, MapState>(
          listener: (context1, state) {
            state.map(
              initial: (value) {},
              saving: (_) {
                FlushbarHelper.createInformation(
                  message: !widget.editing ? tr('map_page.saving_plan') : tr('map_page.updating_plan'),
                ).show(context);
              },
              saved: (_) {
                showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: !widget.editing ? Text(tr('map_page.plan_saved')) : Text(tr('map_page.plan_updated')),
                      content: !widget.editing
                          ? Text(tr('map_page.plan_saved_succesfully'))
                          : Text(tr('map_page.plan_updated_succesfully')),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          onPressed: () {
                            context1.bloc<MapBloc>().add(const MapBlocEvent.returnHome());

                            Navigator.pop(context);
                          },
                          child: const Text("Ok"),
                        ),
                      ],
                    );
                  },
                );
              },
              home: (_) {
                Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                    child: const CentralWidget(index: 1),
                    duration: const Duration(milliseconds: 500),
                    type: PageTransitionType.leftToRight,
                  ),
                  (route) => false,
                );
              },
            );
          },
          builder: (context, state) {
            /* final List<Place> placesToShow = [
              widget.places[widget.source],
            ];

            for (final place in widget.places.entries) {
              final isNotSource = place.value.name != widget.source;
              final isNotDestination = place.value.name != widget.destination;

              if (isNotSource && isNotDestination) {
                placesToShow.add(place.value);
              }
            }

            placesToShow.add(widget.places[widget.destination]); */

            return Stack(
              children: <Widget>[
                GoogleMap(
                  mapType: mapType,
                  polylines: _polylines,
                  onMapCreated: _onMapCreated,
                  markers: _markers,
                  initialCameraPosition: CameraPosition(
                    target: sourceLocation,
                    zoom: cameraZoom,
                    bearing: cameraBearing,
                  ),
                ),
                Visibility(
                  visible: totalDistance != 0,
                  child: Positioned(
                    top: 80,
                    left: 20,
                    child: SizedBox(
                      height: 40,
                      width: 180,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: kPrimaryColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  tr('plan_map.distance'),
                                  style: const TextStyle(
                                    fontFamily: 'SF Pro Bold',
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '${totalDistance.toStringAsFixed(2)} ${distanceInMeters > 999 ? 'kms' : 'm'}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: durationFormatted.isNotEmpty,
                  child: Positioned(
                    top: 30,
                    left: 20,
                    child: SizedBox(
                      height: 40,
                      width: 180,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: kPrimaryColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  tr('plan_map.duration'),
                                  style: const TextStyle(
                                    fontFamily: 'SF Pro Bold',
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  durationFormatted,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ClassicButton(
                      colors: const [kSecondaryColor, kSecondaryDarkerColor],
                      height: 50,
                      onPressedFn: () {
                        _showNameInputDialog(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            !widget.editing ? LineAwesomeIcons.map : LineAwesomeIcons.edit,
                            color: Colors.white,
                            size: 15,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            !widget.editing ? tr('map_page.create_plan') : tr('map_page.save'),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width - 200) / 2,
                  bottom: 80,
                  child: ClassicButton(
                    height: 50,
                    onPressedFn: () {
                      int count = 0;
                      Navigator.popUntil(context, (route) {
                        return count++ == 3;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          LineAwesomeIcons.edit,
                          color: Colors.white,
                          size: 15,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          tr('map_page.edit'),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                if (mapWasCreated)
                  FutureBuilder(
                    future: _future,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final resultList = snapshot.data as List<Place>;

                        return Positioned(
                          bottom: 150,
                          left: 10,
                          child: SizedBox(
                            height: 130,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.separated(
                              itemCount: resultList.length,
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.all(0),
                              physics: const BouncingScrollPhysics(),
                              separatorBuilder: (context, index) => const SizedBox(width: 10),
                              itemBuilder: (context, index) {
                                final place = resultList[index];

                                return GestureDetector(
                                  onTap: () {
                                    final cPosition = CameraPosition(
                                      zoom: 16,
                                      //bearing: currentLocation.heading,
                                      target: LatLng(
                                        place.latitude,
                                        place.longitude,
                                      ),
                                    );

                                    _mapController.animateCamera(
                                      CameraUpdate.newCameraPosition(cPosition),
                                    );

                                    for (final marker in _markers) {
                                      if (marker.markerId.value == place.name) {
                                        _mapController.showMarkerInfoWindow(marker.markerId);
                                      }
                                    }

                                    setState(() => currentPlace = place);
                                  },
                                  child: SizedBox(
                                    height: 133,
                                    width: 180,
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
                                              image: NetworkImage(
                                                place.name == CURRENT_LOCATION
                                                    ? 'https://encolombia.com/wp-content/uploads/2020/05/Regi%C3%B3n-Caribe-en-Colombia-696x398.jpg'
                                                    : place.imageUrl,
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: currentPlace?.name == place.name,
                                            child: const Positioned(
                                              top: 0,
                                              left: 10,
                                              child: SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: FlareActor(
                                                  "assets/images/Loading.flr",
                                                  animation: "active",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 8,
                                            bottom: 30,
                                            child: Text(
                                              place.name == CURRENT_LOCATION
                                                  ? tr('map_page.current_location')
                                                  : place.name,
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontFamily: 'SF Pro Bold',
                                                fontSize: MediaQuery.of(context).size.width * 0.035,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          if (place.name != CURRENT_LOCATION)
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
                                );
                              },
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  )
              ],
            );
          },
        ),
      ),
    );
  }

  void _showNameInputDialog(BuildContext thisContext) {
    showDialog(
      context: thisContext,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 200),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: tr('map_page.plan_name'),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: kPrimaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: kSecondaryColor,
                      ),
                    ),
                  ),
                  controller: nameInputController,
                ),
                const SizedBox(height: 10),
                ClassicButton(
                  onPressedFn: () {
                    if (nameInputController.text.isNotEmpty) {
                      Navigator.of(thisContext, rootNavigator: true).pop();
                      if (widget.editing) {
                        thisContext.bloc<MapBloc>().add(MapBlocEvent.updatePlan(nameInputController.text, widget.places,
                            widget.source, widget.destination, widget.email, widget.planid));
                      } else {
                        String emal;
                        if (widget.email != null && widget.email.isNotEmpty) {
                          emal = widget.email;
                        } else {
                          emal = "";
                        }

                        thisContext.bloc<MapBloc>().add(
                              MapBlocEvent.savingNewPlan(
                                nameInputController.text,
                                widget.places,
                                widget.source,
                                widget.destination,
                                emal,
                                widget.kidsFilter,
                                widget.disableFilter,
                                widget.byDepartment,
                                widget.citdepart,
                                userPlacesOrder,
                              ),
                            );
                      }
                    } else {
                      FlushbarHelper.createError(
                        message: tr('map_page.name_cannot_be_empty'),
                      ).show(context);
                    }
                  },
                  child: Text(
                    tr('map_page.save'),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
