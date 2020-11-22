import 'dart:async';
import 'dart:collection';
import 'package:auto_route/auto_route.dart';
import 'package:caribe_tour/application/plans/plan_map/plan_map_bloc.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:caribe_tour/injection.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/map/widgets/explore_button.dart';
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
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_directions_api/google_directions_api.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_directions_api/google_directions_api.dart' as google_directions_api;
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:location/location.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:weather/weather.dart';
import 'camera_settings.dart';
import 'herlpers.dart';

class PlanMap extends StatefulWidget {
  const PlanMap({
    Key key,
    @required this.places,
    @required this.source,
    @required this.destination,
    @required this.planId,
  }) : super(key: key);

  final Map<String, Place> places;
  final String source;
  final String destination;
  final String planId;

  @override
  PlanMapViewState createState() => PlanMapViewState();
}

class PlanMapViewState extends State<PlanMap> with WidgetsBindingObserver {
  /// Coordenadas del lugar de partida
  LatLng sourceLocation;

  /// Coordenadas del lugar de destino
  LatLng destLocation;

  /// Los waypoints son las coordenadas de los lugares intermedios entre el lugar de partida y el lugar de destino
  List<google_directions_api.DirectionsWaypoint> waypoints = [];

  /// Los nombres de los lugares intermedios
  List<String> waypointsNames = [];

  /// `Directions Service` es el servicio de direcciones proveido por `Google`
  ///
  /// Este servicio nos permite obtener la ruta más óptima entre las coordenadas dadas
  final directionsService = google_directions_api.DirectionsService();

  /// [_mapController] es el controlador para el mapa.
  ///
  /// Permite controlar la ubicación de la camara, el zoom, entre otros parámetros.
  GoogleMapController _mapController;

  /// Iconos de los [Marker]s
  BitmapDescriptor sourceIcon, intermediateIcon, destinationIcon, userIcon;

  /// [polylinePoints] es pasado al controlador del mapa para mostrar las polilíneas.
  PolylinePoints polylinePoints = PolylinePoints();

  final Set<Polyline> _polylines = {};

  /// [polylineCoordinates] son las coordenadas que permiten trazar las lineas sobre el mapa.
  List<LatLng> polylineCoordinates = [];

  /// [Marker] del punto de partida
  Marker sourceMarker;

  /// [Marker] del punto de destino
  Marker destinationMarker;
  final Set<Marker> _markers = HashSet<Marker>();
  final Map<String, Marker> markerMap = {};

  /// [result] retornado por `Directions Service`, este contiene información de la ruta más óptima.
  List<google_directions_api.GeoCoord> result;

  // Location
  LocationData currentLocation;
  Location location;

  /// [locationStream] contiene la información de la ubicación del usuario en tiempo real.
  StreamSubscription<LocationData> locationStream;

  // Tracking state
  bool isTracking = false;
  bool isDone = false;
  Map<String, String> placesVisited = {};

  FlutterTts flutterTts;
  String language = 'english';

  LocationData locationForExplore;

  BuildContext _blocContext;

  MapType mapType = MapType.hybrid;

  bool mapWasCreated = false;

  List<Place> userPlacesOrder;

  Future<List<Place>> _future;

  String durationFormatted = "", nextDuration = "";

  double distanceInMeters = 0, totalDistance = 0;

  double nextDistanceInMeters = 0, nextDistance = 0;

  List<Leg> legs;

  Place currentPlace;

  WeatherFactory wf;

  /// Cuando el usuario reanuda la aplicación el mapa a veces aparece en blanco, esta es una posible solución.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _setMapStyle();
    }
  }

  @override
  void initState() {
    super.initState();

    addWaypoints();

    google_directions_api.DirectionsService.init(
      "",
    );

    setIcons();

    // Location settings
    location = Location();
    location.changeSettings(distanceFilter: 0.5);
    setInitialLocation();

    flutterTts = FlutterTts();
  }

  /// Configuración del lenguaje
  void setLanguage(BuildContext context) {
    if (context.locale.languageCode.toLowerCase() == 'es') {
      flutterTts.setLanguage('es-ES');
      flutterTts.setVoice('es-US-language');
      language = 'spanish';
    }
  }

  void setWeatherApi(BuildContext context) {
    wf = WeatherFactory(
      "",
      language: context.locale.languageCode == 'es' ? Language.SPANISH : Language.ENGLISH,
    );
  }

  /// Obtiene todos los `waypoints`, asegurando que no sean el punto de partida ni el punto de destino.
  void addWaypoints() {
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
  }

  /// Configura las coordenadas iniciales del usuario
  Future<void> setInitialLocation() async {
    currentLocation = await location.getLocation();
  }

  /// Método encargado de actualizar la posición del [Marker] en el mapa
  Future<void> updatePinOnMap() async {
    final currentZoom = await _mapController.getZoomLevel();

    final cPosition = CameraPosition(
      zoom: currentZoom,
      bearing: currentLocation.heading,
      target: LatLng(currentLocation.latitude, currentLocation.longitude),
    );

    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(cPosition),
    );

    final pinPosition = LatLng(
      currentLocation.latitude,
      currentLocation.longitude,
    );

    _markers.removeWhere((m) => m.markerId.value == 'movingPin');

    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('movingPin'),
        position: pinPosition,
        icon: userIcon,
        rotation: currentLocation.heading,
      ));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _mapController.dispose();
    if (locationStream != null) {
      locationStream.cancel();
    }
  }

  /// Método encargado de configurar los iconos de los [Marker]s.
  Future<void> setIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/green_pin.png',
    );

    intermediateIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/blue_pin.png',
    );

    userIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/busetica.png',
    );

    destinationIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/red_pin.png',
    );
  }

  /// Método que se ejecuta cuando el mapa ha sido creado. En este mostramos las líneas, iconos, etc.
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
  }

  /// Método encargado de obtener el orden correcto de los lugares basados en el resultado de la API de `Directions Service`.
  ///
  /// En este método también se hace zoom al último lugar visitado.
  /// Se encarga de pintar la trayectoria hasta el último lugar visitado.
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

        if (distance <= 150 && !placesOrder.contains(place.value)) {
          placesOrder.add(place.value);
        }
      }
    }

    if (widget.destination == CURRENT_LOCATION) {
      placesOrder.add(widget.places[widget.destination]);
    }

    LatLng newPosition;
    Place lastVisitedPlace;

    for (final place in placesOrder) {
      if (placesVisited.containsKey(place.name)) {
        lastVisitedPlace = place;
      }
    }

    MarkerId selectedMarker;

    if (lastVisitedPlace == null) {
      newPosition = LatLng(
        widget.places[widget.source].latitude,
        widget.places[widget.source].longitude,
      );

      selectedMarker = MarkerId(widget.source);
    } else {
      newPosition = LatLng(
        lastVisitedPlace.latitude,
        lastVisitedPlace.longitude,
      );

      selectedMarker = MarkerId(lastVisitedPlace.name);
    }

    _mapController
        .animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          tilt: cameraTilt,
          zoom: 14,
          //bearing: currentLocation.heading,
          target: newPosition,
        ),
      ),
    )
        .then((_) async {
      await Future.delayed(const Duration(seconds: 1));
      _mapController.showMarkerInfoWindow(selectedMarker);
    });

    userPlacesOrder = placesOrder;

    // It paints up to the last place visited in the waypoints order
    for (final place in placesOrder) {
      if (placesVisited.containsKey(place.name)) {
        paintTrajectory(place.latitude, place.longitude);
      }
    }

    return placesOrder;
  }

  /// Método encargado de pintar la trayectoria cuando el turista llega a un lugar.
  void paintTrajectory(double latitude, double longitude) {
    final List<int> indices = [0];

    for (int i = 0; i < polylineCoordinates.length; i++) {
      final double distance = calculateDistance(
        latitude,
        longitude,
        polylineCoordinates[i].latitude,
        polylineCoordinates[i].longitude,
      );

      if (distance <= 200 && !indices.contains(i)) {
        indices.add(i);
      }
    }

    final List<LatLng> visitedLine = [];

    for (int i = 0; i < indices.length - 1; i++) {
      visitedLine.addAll(
        polylineCoordinates.sublist(indices[i], indices[i + 1]),
      );
    }

    final Polyline newPolyline = Polyline(
      polylineId: PolylineId('newPoly'),
      color: Colors.green,
      points: visitedLine,
      width: 6,
    );

    setState(() {
      _polylines.add(newPolyline);
    });
  }

  Future<void> setMapPins() async {
    sourceMarker = Marker(
      markerId: MarkerId(widget.source),
      position: sourceLocation,
      icon: sourceIcon,
      infoWindow: InfoWindow(
        title: widget.source == CURRENT_LOCATION ? tr('plan_map.current_location') : widget.source,
      ),
    );

    markerMap[widget.source] = sourceMarker;

    destinationMarker = Marker(
      markerId: MarkerId(widget.destination),
      position: destLocation,
      icon: destinationIcon,
      infoWindow: InfoWindow(
        title: widget.destination,
      ),
    );

    markerMap[widget.destination] = destinationMarker;

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
          title: widget.places[waypointsNames[i]].name,
        ),
      );

      markerMap[waypointsNames[i]] = intermediateMarker;

      i++;

      intermediateMarkers.add(intermediateMarker);
    }

    _markers.addAll(
      [sourceMarker, destinationMarker, ...intermediateMarkers],
    );
  }

  /// Método encargado de mostrar las lineas dado el resultado de `Directions Service`
  Future<void> setPolylines() async {
    await directionsService.route(
      google_directions_api.DirectionsRequest(
        origin: "${sourceLocation.latitude},${sourceLocation.longitude}",
        destination: "${destLocation.latitude},${destLocation.longitude}",
        waypoints: waypoints,
        optimizeWaypoints: true,
        travelMode: google_directions_api.TravelMode.driving,
      ),
      (response, status) {
        distanceInMeters = 0;
        double durationInSeconds = 0;

        if (status == google_directions_api.DirectionsStatus.ok) {
          legs = response.routes.first.legs;

          for (final leg in legs) {
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

          final userVisited = _blocContext.bloc<PlanMapBloc>().state.placesVisited.getOrElse(() => []);

          for (final place in userVisited) {
            placesVisited[place.name] = place.name;
          }
        }
      },
    );
  }

  /// Método encargado de inicializar el seguimiento en tiempo real del usuario.
  Future<void> startTracking() async {
    locationStream = location.onLocationChanged.listen((cLoc) async {
      currentLocation = cLoc;

      updatePinOnMap();

      await Future.delayed(const Duration(milliseconds: 100));
      trackUser();
    });

    Place nextPlaceToVisit;

    int i;
    for (i = 0; i < userPlacesOrder.length - 1; i++) {
      if (placesVisited.containsKey(userPlacesOrder[i].name)) {
        nextPlaceToVisit = userPlacesOrder[i + 1];
      }
    }

    if (nextPlaceToVisit == null && placesVisited.isNotEmpty) {
      _mapController.showMarkerInfoWindow(MarkerId(widget.destination));
      i = userPlacesOrder.length - 1;
    } else if (nextPlaceToVisit == null && placesVisited.isEmpty) {
      _mapController.showMarkerInfoWindow(MarkerId(userPlacesOrder[1].name));

      await flutterTts.speak(
        '${tr('plan_map.next_place_is')} ${userPlacesOrder[1].name}',
      );

      i = 1;
    } else {
      _mapController.showMarkerInfoWindow(MarkerId(nextPlaceToVisit.name));

      await flutterTts.speak(
        '${tr('plan_map.next_place_is')} ${nextPlaceToVisit.name}',
      );

      i--;
    }

    int j = 1;
    for (final leg in legs) {
      if (j == i) {
        setState(() {
          nextDuration = printDuration(
            Duration(seconds: leg.duration.value.toInt()),
            abbreviated: true,
            locale: DurationLocale.fromLanguageCode(
              context.locale.languageCode,
            ),
          );

          nextDistanceInMeters = leg.distance.value.toDouble();
          if (nextDistanceInMeters > 999) {
            nextDistance = nextDistanceInMeters / 1000;
          } else {
            nextDistance = nextDistanceInMeters;
          }
        });

        break;
      }
      j++;
    }
  }

  Future<void> trackUser() async {
    // Calculate distance between current location and places to visit location
    for (final place in widget.places.entries) {
      final d = calculateDistance(
        currentLocation.latitude,
        currentLocation.longitude,
        place.value.latitude,
        place.value.longitude,
      );

      // If close to that place then paint green
      if (d <= 150) {
        if (!placesVisited.containsKey(place.value.name) && place.value.name != CURRENT_LOCATION) {
          // Pause tracking
          locationStream.cancel();

          // Show tips on screen
          showPlaceTip(place.value);

          setState(() {
            isTracking = false;
            // Mark place as visited
            placesVisited[place.value.name] = place.value.name;
          });

          paintTrajectory(place.value.latitude, place.value.longitude);

          await flutterTts.speak(place.value.description[language]);

          for (int i = 0; i < place.value.tips.length; i++) {
            await flutterTts.speak(
              '${tr('plan_map.tips_introduction')}. ${place.value.tips[0][language]}',
            );
          }

          for (final marker in _markers) {
            final distanceMarkerPlace = calculateDistance(
              marker.position.latitude,
              marker.position.longitude,
              place.value.latitude,
              place.value.longitude,
            );

            if (distanceMarkerPlace <= 150) {
              _mapController.showMarkerInfoWindow(marker.markerId);
            }
          }

          // Check if the place found is destination and mark trip as done
          if (place.value.name == widget.destination) {
            setState(() {
              isDone = true;
            });
          }

          // save place visited in database
          _blocContext.bloc<PlanMapBloc>().add(
                PlanMapEvent.savingPlaceVisited(widget.planId, place.value.id),
              );

          FlushbarHelper.createSuccess(
            message: "${tr('plan_map.you_arrived_to')} ${place.value.name}",
          ).show(context);
        }
      }
    }
  }

  /// Método encargado de mostrar los tips del lugar al que el turista ha llegado.
  Future<void> showPlaceTip(Place place) async {
    final weather = await wf.currentWeatherByLocation(place.latitude, place.longitude);
    final forecast = await wf.fiveDayForecastByLocation(place.latitude, place.longitude);
    final DateFormat formatter = DateFormat('EEE, h:mm aa');

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.85,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      placeholder: MemoryImage(kTransparentImage),
                      image: NetworkImage(place.imageUrl),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    color: Colors.black12,
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 5,
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                place.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: MediaQuery.of(context).size.width * 0.055,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.white70,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "${place.city}, ${place.department}",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w500,
                                      fontSize: MediaQuery.of(context).size.width * 0.045,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 5,
                  top: 5,
                ),
                child: Text(
                  tr('plan_map.description'),
                  style: TextStyle(
                    fontFamily: 'SF Pro Bold',
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: Text(
                  place.description[context.locale.languageCode == 'es' ? 'spanish' : 'english'],
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
              ),
              const Divider(),
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: Text(
                  'Tips',
                  style: TextStyle(
                    fontFamily: 'SF Pro Bold',
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              for (final tip in place.tips) ...[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Icon(
                                Ionicons.ios_information_circle,
                                color: kPrimaryColor,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    child: Text(
                                      tip[context.locale.languageCode == 'es' ? 'spanish' : 'english'],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 10,
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
              const Divider(),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: Text(
                  tr('plan_map.current_weather'),
                  style: TextStyle(
                    fontFamily: 'SF Pro Bold',
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 80,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [kPrimaryColor, kPrimaryDarkerColor],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.0, 0.9],
                              ),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: const Offset(2, 1.5),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      child: Image.network(
                                        'http://openweathermap.org/img/wn/${weather.weatherIcon}@2x.png',
                                        width: 60,
                                        height: 60,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          tr('plan_map.weather').toUpperCase(),
                                          style: TextStyle(
                                            fontFamily: boldFontFamily,
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context).size.width * 0.035,
                                          ),
                                        ),
                                        Text(
                                          weather.weatherDescription,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context).size.width * 0.035,
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
                        const SizedBox(width: 5),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 80,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [kPrimaryColor, kPrimaryDarkerColor],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.0, 0.9],
                              ),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: const Offset(2, 1.5),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      child: Image.asset(
                                        'assets/images/temperature.png',
                                        width: 30,
                                        height: 30,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          tr('plan_map.temperature'),
                                          style: TextStyle(
                                            fontFamily: boldFontFamily,
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context).size.width * 0.035,
                                          ),
                                        ),
                                        Text(
                                          "${weather.temperature.celsius.toStringAsFixed(0)} °C",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context).size.width * 0.035,
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
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 80,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [kPrimaryColor, kPrimaryDarkerColor],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.0, 0.9],
                              ),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: const Offset(2, 1.5),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      child: Image.asset(
                                        'assets/images/humidity.png',
                                        width: 30,
                                        height: 30,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          tr('plan_map.humidity'),
                                          style: TextStyle(
                                            fontFamily: boldFontFamily,
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context).size.width * 0.035,
                                          ),
                                        ),
                                        Text(
                                          "${weather.humidity}%",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context).size.width * 0.035,
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
                        const SizedBox(width: 5),
                        Expanded(
                          child: Container(
                            height: 80,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: const LinearGradient(
                                colors: [kPrimaryColor, kPrimaryDarkerColor],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.0, 0.9],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: const Offset(2, 1.5),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      child: Image.asset(
                                        'assets/images/wind.png',
                                        width: 30,
                                        height: 30,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          tr('plan_map.wind'),
                                          style: TextStyle(
                                            fontFamily: boldFontFamily,
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context).size.width * 0.035,
                                          ),
                                        ),
                                        Text(
                                          "${weather.windSpeed} m/s",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context).size.width * 0.035,
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
                  ],
                ),
              ),
              const Divider(),
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: Text(
                  tr('plan_map.forecast_title'),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 120,
                margin: const EdgeInsets.all(5),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: forecast.length,
                  itemBuilder: (context, index) {
                    final weather = forecast[index];

                    return Container(
                      padding: const EdgeInsets.all(10),
                      height: 115,
                      width: 120,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [kPrimaryColor, kPrimaryDarkerColor],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0, 0.9],
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(2, 1.5),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              formatter.format(weather.date),
                              style: TextStyle(
                                fontFamily: boldFontFamily,
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width * 0.030,
                              ),
                            ),
                            Align(
                              child: Image.network(
                                'http://openweathermap.org/img/wn/${weather.weatherIcon}@2x.png',
                                width: 60,
                                height: 60,
                              ),
                            ),
                            Text(
                              "${weather.temperature.celsius.toStringAsFixed(0)} °C",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width * 0.035,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 5);
                  },
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }

  Future<void> _setMapStyle() async {
    final style = await DefaultAssetBundle.of(context).loadString(
      'assets/darkMode.json',
    );

    //_mapController.setMapStyle(style);
  }

  @override
  Widget build(BuildContext context) {
    setLanguage(context);
    setWeatherApi(context);

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        onPressed: () {
          setState(() {
            mapType = mapType == MapType.hybrid ? MapType.terrain : MapType.hybrid;
          });
        },
        child: const Icon(LineAwesomeIcons.adjust, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: BlocProvider(
        create: (context) => getIt<PlanMapBloc>()
          ..add(
            PlanMapEvent.getPlacesVisited(widget.planId),
          ),
        child: BlocBuilder<PlanMapBloc, PlanMapState>(
          builder: (context, state) {
            _blocContext = context;

            return state.placesVisited.fold(
              () => const Center(child: CircularProgressIndicator()),
              (placesVisitedSaved) {
                for (final place in placesVisitedSaved) {
                  placesVisited[place.name] = place.name;
                }

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
                      visible: !isTracking && locationForExplore != null,
                      child: ExploreButton(
                        location: locationForExplore,
                        screenWidth: screenWidth,
                      ),
                    ),
                    Visibility(
                      visible: isTracking && nextDistance != 0,
                      child: Positioned(
                        top: 40,
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
                                      '$nextDuration (${nextDistance.toStringAsFixed(2)} ${nextDistanceInMeters > 999 ? 'kms' : 'm'})',
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
                      visible: !isTracking && totalDistance != 0,
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
                      visible: !isTracking && durationFormatted.isNotEmpty,
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
                    Positioned(
                      left: (screenWidth - 200) / 2,
                      bottom: 30,
                      child: ClassicButton(
                        colors: const [kSecondaryColor, kSecondaryDarkerColor],
                        height: 50,
                        onPressedFn: () {
                          if (isDone) {
                            FlushbarHelper.createInformation(
                              message: tr('plan_map.already_at_destination'),
                            ).show(context);
                          } else {
                            if (isTracking && locationStream != null) {
                              locationStream.cancel();
                              setState(() {
                                isTracking = false;
                                locationForExplore = currentLocation;
                              });
                            } else {
                              startTracking();
                              setState(() {
                                isTracking = true;
                              });
                            }
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              isTracking ? Icons.pause : Icons.explore,
                              color: Colors.white,
                              size: 15,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              isTracking ? tr('plan_map.pause') : tr('plan_map.start'),
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

                            return Visibility(
                              visible: !isTracking,
                              child: Positioned(
                                bottom: !isTracking && locationForExplore != null ? 160 : 120,
                                left: 5,
                                child: SizedBox(
                                  height: 130,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.separated(
                                    itemCount: resultList.length,
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
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
                                            CameraUpdate.newCameraPosition(
                                              cPosition,
                                            ),
                                          );

                                          for (final marker in _markers) {
                                            if (marker.markerId.value == place.name) {
                                              _mapController.showMarkerInfoWindow(
                                                marker.markerId,
                                              );
                                            }
                                          }

                                          setState(() => currentPlace = place);
                                        },
                                        child: SizedBox(
                                          height: 133,
                                          width: 180,
                                          child: ClipRRect(
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  decoration: const BoxDecoration(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: FadeInImage(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                    placeholder: MemoryImage(
                                                      kTransparentImage,
                                                    ),
                                                    image: NetworkImage(
                                                      place.name == CURRENT_LOCATION
                                                          ? 'https://encolombia.com/wp-content/uploads/2020/05/Regi%C3%B3n-Caribe-en-Colombia-696x398.jpg'
                                                          : place.imageUrl,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 8,
                                                  bottom: 30,
                                                  child: Text(
                                                    place.name == CURRENT_LOCATION
                                                        ? tr('plan_map.current_location')
                                                        : place.name,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      fontFamily: 'SF Pro Bold',
                                                      fontSize: MediaQuery.of(context).size.width * 0.035,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                // HAZLO AQUI WUEY
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
                                                if (place.name == widget.source)
                                                  Positioned(
                                                    top: 10,
                                                    right: 5,
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10,
                                                            top: 5,
                                                            bottom: 5,
                                                          ),
                                                          decoration: BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius: BorderRadius.circular(15),
                                                          ),
                                                          child: Text(
                                                            tr('plan_map.source'),
                                                            maxLines: 1,
                                                            style: TextStyle(
                                                              fontFamily: 'SF Pro Bold',
                                                              fontSize: MediaQuery.of(context).size.width * 0.035,
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if (place.name != widget.source)
                                                  Positioned(
                                                    top: 10,
                                                    right: 5,
                                                    child: Container(
                                                      padding: const EdgeInsets.only(
                                                        left: 10,
                                                        right: 10,
                                                        top: 5,
                                                        bottom: 5,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: placesVisited.containsKey(place.name)
                                                            ? Colors.green
                                                            : Colors.grey,
                                                        borderRadius: BorderRadius.circular(15),
                                                      ),
                                                      child: Text(
                                                        placesVisited.containsKey(place.name)
                                                            ? tr('plan_map.visited')
                                                            : tr('plan_map.not_visited'),
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                          fontFamily: 'SF Pro Bold',
                                                          fontSize: MediaQuery.of(context).size.width * 0.035,
                                                          color: Colors.white,
                                                        ),
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
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
