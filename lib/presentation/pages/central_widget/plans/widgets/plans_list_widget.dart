import 'package:caribe_tour/domain/plans/plan.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/central_widget/plans/plans_detail/plan_details.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:page_transition/page_transition.dart';

class PlansListWidget extends StatelessWidget {
  final List<Plan> userPlans;

  const PlansListWidget({Key key, this.userPlans}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: userPlans.length,
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                child: PlanDetails(plan: userPlans[index]),
                type: PageTransitionType.rightToLeft,
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: kSecondaryColor.withOpacity(0.8),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: const Offset(1, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [kSecondaryColor, kSecondaryDarkerColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 0.9],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: SizedBox(
                          height: 90,
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Image.asset(
                                  'assets/images/smartphone.png',
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                              const SizedBox(width: 40),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    userPlans[index].name,
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Bold',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.045,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: kSecondaryDarkerColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100),
                            ),
                            gradient: LinearGradient(
                              colors: [kSecondaryColor, kSecondaryDarkerColor],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.0, 1],
                            ),
                          ),
                          height: 120,
                          width: 120,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Row(
                          children: [
                            Text(
                              tr('plans.active'),
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Colors.white,
                              ),
                            ),
                            if (userPlans[index].active)
                              Icon(
                                LineAwesomeIcons.check_circle_o,
                                color: Colors.green[300],
                              ),
                            if (!userPlans[index].active)
                              const Icon(
                                LineAwesomeIcons.power_off,
                                color: Colors.white,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class NoPlansWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 40),
            child: Align(
              child: Image.asset(
                'assets/images/language.png',
                width: 250,
              ),
            ),
          ),
          Text(
            tr('plans.no_plans_made_yet'),
            style: TextStyle(
              color: Colors.grey,
              fontSize: MediaQuery.of(context).size.width * 0.05,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            tr('plans.press_to_make_a_plan'),
            style: TextStyle(
              color: Colors.grey,
              fontSize: MediaQuery.of(context).size.width * 0.05,
            ),
          ),
        ],
      ),
    );
  }
}
