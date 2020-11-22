import 'package:caribe_tour/domain/plans/plan.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/central_widget/plans/widgets/plans_list_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlanView extends StatelessWidget {
  final List<Plan> userPlans;

  const PlanView({Key key, this.userPlans}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    if (userPlans.isNotEmpty) {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Stack(
                children: [
                  Container(
                    height: 120,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [kPrimaryColor, kPrimaryDarkerColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 0.9],
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              tr('routes_page.create_a_route'),
                              style: TextStyle(
                                fontFamily: 'SF Pro Bold',
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.06,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: 200,
                              child: Text(
                                tr('routes_page.create_a_route_body'),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      height: 140,
                      width: 150,
                      child: FlareActor(
                        "assets/images/maps.flr",
                        animation: "anim",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                tr('routes_page.your_routes'),
                style: TextStyle(
                  fontFamily: 'SF Pro Bold',
                  fontSize: 28,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: PlansListWidget(userPlans: userPlans),
            ),
          ],
        ),
      );
    } else {
      return Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Expanded(child: NoPlansWidget())
        ],
      );
    }
  }
}
