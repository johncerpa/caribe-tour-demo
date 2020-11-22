import 'dart:collection';
import 'package:auto_route/auto_route.dart';
import 'package:caribe_tour/application/place_detail/place_search/place_photo_bloc/place_photo_bloc.dart';
import 'package:caribe_tour/injection.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/map/camera_settings.dart';
import 'package:caribe_tour/presentation/shared_widgets/loading_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_directions_api/google_directions_api.dart'
    as google_directions_api;
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_place/google_place.dart';

class SimpleMapSourceDest extends StatefulWidget {
  const SimpleMapSourceDest({
    Key key,
    @required this.sourceLat,
    @required this.sourceLng,
    @required this.destLat,
    @required this.destLng,
    @required this.sourceName,
    @required this.destinationName,
    @required this.place,
    @required this.placeType,
  }) : super(key: key);

  final String sourceName, destinationName;

  final double sourceLat, sourceLng;
  final double destLat, destLng;

  final SearchResult place;
  final String placeType;

  @override
  _SimpleMapSourceDestState createState() => _SimpleMapSourceDestState();
}

class _SimpleMapSourceDestState extends State<SimpleMapSourceDest> {
  LatLng sourceLocation, destLocation;

  final directionsService = google_directions_api.DirectionsService();
  google_directions_api.DirectionsRequest request;

  GoogleMapController _mapController;
  // TODO: Remove key
  String googleApiKey = "AIzaSyAJUXvRdFHB2-HdTY1QoRm6_JFr60jwB4Y";

  // Icons
  BitmapDescriptor sourceIcon, intermediateIcon, destinationIcon;

  // Polyline objects
  PolylinePoints polylinePoints = PolylinePoints();
  final Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [];

  final Set<Marker> _markers = HashSet<Marker>();
  Marker sourceMarker, destinationMarker;

  @override
  void initState() {
    super.initState();

    sourceLocation = LatLng(widget.sourceLat, widget.sourceLng);
    destLocation = LatLng(widget.destLat, widget.destLng);

    google_directions_api.DirectionsService.init(googleApiKey);

    PolylinePoints(); // Dont think this should be done?
    setIcons();

    request = google_directions_api.DirectionsRequest(
      origin: "${sourceLocation.latitude},${sourceLocation.longitude}",
      destination: "${destLocation.latitude},${destLocation.longitude}",
      travelMode: google_directions_api.TravelMode.driving,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _mapController.dispose();
  }

  Future<void> setIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/sombrero.png',
    );

    destinationIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/sombrero.png',
    );
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _mapController = controller;

    setMapPins();

    setPolylines();

    _setMapStyle();

    await Future.delayed(const Duration(milliseconds: 100));

    _mapController.showMarkerInfoWindow(destinationMarker.markerId);
  }

  void setMapPins() {
    setState(() {
      sourceMarker = Marker(
        markerId: MarkerId('sourcePin'),
        position: sourceLocation,
        icon: sourceIcon,
        infoWindow: InfoWindow(
          title: widget.sourceName,
        ),
      );

      destinationMarker = Marker(
        markerId: MarkerId('destPin'),
        position: destLocation,
        icon: destinationIcon,
        infoWindow: InfoWindow(
          title: widget.destinationName,
        ),
      );

      _markers.addAll([sourceMarker, destinationMarker]);
    });
  }

  Future<void> setPolylines() async {
    directionsService.route(request, (response, status) {
      if (status == google_directions_api.DirectionsStatus.ok) {
        final List<google_directions_api.GeoCoord> result =
            response.routes.first.overviewPath;

        if (result.isNotEmpty) {
          // loop through all PointLatLng points and convert them
          // to a list of LatLng, required by the Polyline
          for (final google_directions_api.GeoCoord point in result) {
            polylineCoordinates.add(LatLng(point.latitude, point.longitude));
          }

          setState(() {
            // create a Polyline instance
            // with an id, an RGB color and the list of LatLng pairs
            final Polyline polyline = Polyline(
              polylineId: PolylineId('poly'),
              color: kSecondaryColor,
              points: polylineCoordinates,
              width: 6,
            );

            // add the constructed polyline as a set of points
            // to the polyline set, which will eventually
            // end up showing up on the map
            _polylines.add(polyline);
          });
        }
      }
    });
  }

  Future<void> _setMapStyle() async {
    final style = await DefaultAssetBundle.of(context).loadString(
      'assets/darkMode.json',
    );

    _mapController.setMapStyle(style);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<PlacePhotoBloc>()
          ..add(
            PlacePhotoEvent.loadingPlaceInfo(
              widget.place.photos[0].photoReference ?? '',
              widget.place.placeId,
            ),
          ),
        child: BlocBuilder<PlacePhotoBloc, PlacePhotoState>(
          builder: (context, state) {
            return state.result.fold(
              () => const LoadingResources(
                color1: kSecondaryColor,
                color2: kSecondaryDarkerColor,
              ),
              (result) => Stack(
                children: <Widget>[
                  GoogleMap(
                    polylines: _polylines,
                    onMapCreated: _onMapCreated,
                    markers: _markers,
                    initialCameraPosition: CameraPosition(
                      target: sourceLocation,
                      zoom: cameraZoom,
                      tilt: cameraTilt,
                      bearing: cameraBearing,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 10,
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.9,
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
                          if (result.photo != null)
                            Expanded(
                              child: Container(
                                height: 110,
                                width: 110,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: MemoryImage(result.photo),
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
                          if (result.photo == null)
                            Expanded(
                              child: Container(
                                height: 110,
                                width: 110,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/${widget.placeType}.png'),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.place.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      color: kSecondaryColor,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    result.address,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      color: kSecondaryColor,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
