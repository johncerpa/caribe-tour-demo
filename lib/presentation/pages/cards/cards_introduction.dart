import 'package:caribe_tour/presentation/pages/cards/cards_page.dart';
import 'package:caribe_tour/presentation/shared_widgets/classic_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

import '../../constants.dart';

class CardsIntroduction extends StatelessWidget {
  final List<String> departments;
  final List<String> cities;
  final bool byDepartments;
  final bool forKidsFilter;
  final bool disabilitiesFilter;
  final int daysAvailable;
  final String email;

  const CardsIntroduction(
      {Key key,
      @required this.departments,
      @required this.cities,
      @required this.byDepartments,
      @required this.forKidsFilter,
      @required this.disabilitiesFilter,
      @required this.daysAvailable,
      this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleSpacing: 0,
        brightness: Brightness.light,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                /* Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Align(
                    child: Image.asset(
                      'assets/images/welcome.png',
                      width: 300,
                    ),
                  ),
                ), */
                const SizedBox(
                  height: 300,
                  width: 300,
                  child: Align(
                    child: SizedBox(
                      height: 300,
                      width: 300,
                      child: FlareActor(
                        "assets/images/harita1.flr",
                        animation: "Untitled",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    tr('cards.select_places'),
                    style: TextStyle(
                      fontFamily: 'SF Pro Bold',
                      fontSize: 26,
                      color: kSecondaryColor,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    tr('cards.instruction'),
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                ClassicButton(
                  child: Text(
                    '¡Empezar!',
                    style: const TextStyle(color: Colors.white),
                  ),
                  onPressedFn: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: CardsPage(
                          cities: cities,
                          departments: departments,
                          byDepartments: byDepartments,
                          forKidsFilter: forKidsFilter,
                          disabilitiesFilter: disabilitiesFilter,
                          daysAvailable: daysAvailable,
                          email: email,
                        ),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
