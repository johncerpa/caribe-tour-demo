import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/map/widgets/map_events_list.dart';
import 'package:caribe_tour/presentation/pages/map/widgets/map_services_widget.dart';
import 'package:caribe_tour/presentation/shared_widgets/classic_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class ExploreButton extends StatefulWidget {
  const ExploreButton({
    Key key,
    @required this.location,
    @required this.screenWidth,
  }) : super(key: key);

  final LocationData location;
  final double screenWidth;

  @override
  _ExploreButtonState createState() => _ExploreButtonState();
}

class _ExploreButtonState extends State<ExploreButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (widget.screenWidth - 200) / 2,
      bottom: 100,
      child: OpenContainer(
        transitionDuration: const Duration(milliseconds: 500),
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        closedColor: kPrimaryColor,
        openColor: Colors.transparent,
        closedBuilder: (_, openContainer) {
          return ClassicButton(
            height: 50,
            onPressedFn: openContainer,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 15,
                ),
                const SizedBox(width: 5),
                Text(
                  tr('plan_map.explore'),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        },
        openBuilder: (_, closeContainer) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [kPrimaryDarkerColor, kPrimaryColor],
                  stops: [0.2, 0.8],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          const Icon(Icons.explore, color: Colors.white),
                          const SizedBox(width: 5),
                          Text(
                            tr("plan_map.explore"),
                            style: TextStyle(
                              fontFamily: 'SF Pro bold',
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width * 0.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: Colors.black.withOpacity(0.2)),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          tr("home.services_around"),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: "SF Pro Bold",
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    mapServicesWidget(context, widget.location),
                    Divider(color: Colors.black.withOpacity(0.2)),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        tr('home.events_around'),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "SF Pro Bold",
                          fontSize: MediaQuery.of(context).size.width * 0.06,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
