import 'dart:io';
import 'package:caribe_tour/application/place_detail/gallery/gallery_bloc.dart';
import 'package:caribe_tour/domain/post/gallery.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:provider/provider.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather/weather.dart';
import 'place_carousel_slider.dart';

class InformationSection extends StatelessWidget {
  final String desc, namePlace, coll;
  final bool canPost;
  final double lat, lng;

  const InformationSection({
    @required this.desc,
    @required this.namePlace,
    @required this.canPost,
    @required this.lat,
    @required this.lng,
    @required this.coll,
  });

  Future<Weather> _getWeather(BuildContext context) async {
    if (lat != -999999999999 && lng != -999999999999) {
      final wf = WeatherFactory(
        "f855f2d77b9acdae095a537a62530380",
        language: context.locale.languageCode == 'es' ? Language.SPANISH : Language.ENGLISH,
      );

      final weather = await wf.currentWeatherByLocation(lat, lng);

      return weather;
    }

    return null;
  }

  Future<List<Weather>> _getForecast(BuildContext context) async {
    if (lat != -999999999999 && lng != -999999999999) {
      final wf = WeatherFactory(
        "f855f2d77b9acdae095a537a62530380",
        language: context.locale.languageCode == 'es' ? Language.SPANISH : Language.ENGLISH,
      );

      final forecast = await wf.fiveDayForecastByLocation(lat, lng);

      return forecast;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryBloc, GalleryState>(
      builder: (context, state) {
        final isPlaceView = lat != -999999999999 && lng != -999999999999;

        return Stack(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(),
              children: [
                Text(
                  tr('places_detail.description'),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                  ),
                ),
                Text(
                  desc,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                  ),
                ),
                const Divider(),

                // Weather widgets
                Visibility(
                  visible: isPlaceView,
                  child: Text(
                    tr('plan_map.weather_title'),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                    ),
                  ),
                ),
                Visibility(
                  visible: isPlaceView,
                  child: const SizedBox(height: 10),
                ),
                Visibility(
                  visible: isPlaceView,
                  child: FutureBuilder(
                    future: _getWeather(context),
                    builder: (context, AsyncSnapshot<Weather> snapshot) {
                      if (snapshot.hasData) {
                        final weather = snapshot.data;
                        final DateFormat formatterHour = DateFormat('h:mm aa');

                        return Column(
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
                                                  tr('plan_map.weather'),
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
                                                'assets/images/sunrise.png',
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
                                                  tr('plan_map.sunrise'),
                                                  style: TextStyle(
                                                    fontFamily: boldFontFamily,
                                                    color: Colors.white,
                                                    fontSize: MediaQuery.of(context).size.width * 0.035,
                                                  ),
                                                ),
                                                Text(
                                                  formatterHour.format(weather.sunrise),
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
                                                'assets/images/sunset.png',
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
                                                  tr('plan_map.sunset'),
                                                  style: TextStyle(
                                                    fontFamily: boldFontFamily,
                                                    color: Colors.white,
                                                    fontSize: MediaQuery.of(context).size.width * 0.035,
                                                  ),
                                                ),
                                                Text(
                                                  formatterHour.format(weather.sunset),
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
                        );
                      } else {
                        return const Center(child: SpinKitWanderingCubes(color: kSecondaryColor));
                      }
                    },
                  ),
                ),
                Visibility(
                  visible: isPlaceView,
                  child: const SizedBox(height: 20),
                ),
                Visibility(
                  visible: isPlaceView,
                  child: const Divider(),
                ),
                // Weather forecast widgets
                Visibility(
                  visible: isPlaceView,
                  child: Text(
                    tr('plan_map.forecast_title'),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                    ),
                  ),
                ),
                Visibility(
                  visible: isPlaceView,
                  child: const SizedBox(height: 10),
                ),
                Visibility(
                  visible: isPlaceView,
                  child: FutureBuilder(
                    future: _getForecast(context),
                    builder: (context, AsyncSnapshot<List<Weather>> snapshot) {
                      if (snapshot.hasData) {
                        final forecast = snapshot.data;
                        final DateFormat formatter = DateFormat('EEE, h:mm aa');

                        return SizedBox(
                          width: double.infinity,
                          height: 120,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: forecast.length,
                            itemBuilder: (context, index) {
                              final weather = forecast[index];

                              return Container(
                                padding: const EdgeInsets.all(10),
                                height: 120,
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
                        );
                      } else {
                        return const Center(child: SpinKitWanderingCubes(color: kSecondaryColor));
                      }
                    },
                  ),
                ),
                Visibility(
                  visible: isPlaceView,
                  child: const Divider(),
                ),
                Visibility(
                  visible: isPlaceView,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        launch(
                          "https://www.google.com/maps/@?api=1&map_action=pano&viewpoint=$lat,$lng",
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 10,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              LineAwesomeIcons.street_view,
                              color: Colors.yellow,
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              'Street view',
                              style: TextStyle(
                                fontFamily: boldFontFamily,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isPlaceView,
                  child: const Divider(),
                ),
                Visibility(
                  visible: isPlaceView,
                  child: const SizedBox(height: 20),
                ),
                Text(
                  tr('places_detail.gallery'),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                  ),
                ),
                const SizedBox(height: 20),
                state.gallery.fold(
                  () => const Center(child: CircularProgressIndicator()),
                  (a) => StreamProvider<List<Gallery>>.value(
                    value: state.galleryStream,
                    initialData: a,
                    builder: (context, child) {
                      final gallery = Provider.of<List<Gallery>>(context);
                      gallery.sort((a, b) => b.time.compareTo(a.time));

                      return PlaceCarouselSlider(photos: gallery);
                    },
                  ),
                ),
                const SizedBox(height: 5)
              ],
            ),
            if (canPost)
              Positioned(
                bottom: 24,
                right: 5,
                child: SizedBox(
                  width: 50,
                  height: 250,
                  child: UnicornDialer(
                    backgroundColor: Colors.transparent,
                    parentButtonBackground: kPrimaryColor,
                    parentButton: const Icon(
                      Icons.add_to_photos,
                      color: Colors.white,
                    ),
                    childButtons: [
                      UnicornButton(
                        hasLabel: true,
                        labelText: "Tomar foto",
                        currentButton: FloatingActionButton(
                          heroTag: "Camara",
                          backgroundColor: kPrimaryColor,
                          mini: true,
                          onPressed: () async {
                            final picker = ImagePicker();
                            final pickedImage = await picker.getImage(
                              source: ImageSource.camera,
                              imageQuality: 30,
                            );
                            const sizeLimit = 15728640;
                            final imageSize = File(pickedImage.path).lengthSync();

                            if (pickedImage != null) {
                              if (imageSize <= sizeLimit) {
                                context
                                    .bloc<GalleryBloc>()
                                    .add(GalleryEvent.save(namePlace, File(pickedImage.path), coll));
                              } else {
                                FlushbarHelper.createError(message: 'Max size is 15 MBs').show(context);
                              }
                            }
                          },
                          child: const Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      UnicornButton(
                        hasLabel: true,
                        labelText: "Galeria",
                        currentButton: FloatingActionButton(
                          heroTag: "Galeria",
                          backgroundColor: kPrimaryColor,
                          mini: true,
                          onPressed: () async {
                            final picker = ImagePicker();
                            final pickedImage = await picker.getImage(
                              source: ImageSource.gallery,
                              imageQuality: 30,
                            );
                            final imageSize = File(pickedImage.path).lengthSync();
                            const sizeLimit = 15728640;
                            if (pickedImage != null) {
                              if (imageSize <= sizeLimit) {
                                context
                                    .bloc<GalleryBloc>()
                                    .add(GalleryEvent.save(namePlace, File(pickedImage.path), coll));
                              } else {
                                FlushbarHelper.createError(message: 'Max size is 15 MBs').show(context);
                              }
                            }
                          },
                          child: const Icon(
                            Icons.collections,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
