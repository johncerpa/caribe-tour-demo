import 'package:caribe_tour/presentation/pages/new_plan/tourist_plan/new_plan_page.dart';
import 'package:caribe_tour/presentation/shared_widgets/classic_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

import '../../constants.dart';

class NewPlanInstruction extends StatelessWidget {
  const NewPlanInstruction({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      'assets/images/plans.png',
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
                        "assets/images/search.flr",
                        animation: "Untitled",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    tr('plans.create_route'),
                    style: const TextStyle(
                      fontFamily: 'SF Pro Bold',
                      fontSize: 26,
                      color: kSecondaryColor,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    tr('plans.select_departments_cities'),
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                ClassicButton(
                  onPressedFn: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: const NewPlanPage(),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  },
                  child: Text(
                    tr('plans.start'),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
