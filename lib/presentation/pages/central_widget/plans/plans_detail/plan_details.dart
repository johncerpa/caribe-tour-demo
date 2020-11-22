import 'package:caribe_tour/application/plan_detail/plan_details/plan_details_bloc.dart';
import 'package:caribe_tour/application/plan_detail/plan_places_bloc.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:caribe_tour/domain/plans/plan.dart';
import 'package:caribe_tour/presentation/pages/central_widget/plans/plans_detail/widgets/places_list.dart';
import 'package:caribe_tour/presentation/pages/map/plan_map.dart';
import 'package:caribe_tour/presentation/shared_widgets/classic_button.dart';
import 'package:caribe_tour/presentation/shared_widgets/loading_resources.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../../injection.dart';
import '../../../../constants.dart';
import '../../central_widget.dart';

class PlanDetails extends StatefulWidget {
  final Plan plan;

  const PlanDetails({@required this.plan});

  @override
  _PlanDetailsState createState() => _PlanDetailsState();
}

class _PlanDetailsState extends State<PlanDetails> {
  bool active, accepted;
  @override
  void initState() {
    super.initState();

    setState(() {
      active = widget.plan.active;
      accepted = widget.plan.accepted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PlanPlacesBloc>(
          create: (context) {
            return getIt<PlanPlacesBloc>()
              ..add(PlanPlacesEvent.planPlaces(
                widget.plan.places,
                widget.plan.latitude ?? 0,
                widget.plan.longitude ?? 0,
              ));
          },
        ),
        BlocProvider<PlanDetailsBloc>(
          create: (context) {
            return getIt<PlanDetailsBloc>()
              ..add(
                PlanDetailsEvent.getPlacesVisited(widget.plan.id),
              );
          },
        ),
      ],
      child: BlocBuilder<PlanPlacesBloc, PlanPlacesState>(
        builder: (context1, state) {
          return state.places.fold(
            () => const LoadingResources(
              color1: kPrimaryColor,
              color2: kPrimaryDarkerColor,
            ),
            (places) => Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                actions: <Widget>[
                  PopupMenuButton<String>(
                    color: Colors.white,
                    onSelected: (String value) {
                      if (value.contains(tr('plan_details.accept'))) {
                        context1.bloc<PlanPlacesBloc>().add(
                            PlanPlacesEvent.acceptPlan(widget.plan.id, true));

                        FlushbarHelper.createSuccess(
                          message: "Se ha aceptado la ruta exitosamente",
                        ).show(context);

                        setState(() {
                          accepted = true;
                          active = true;
                        });
                      }
                      if (value.contains(tr('plan_details.decline'))) {
                        context1.bloc<PlanPlacesBloc>().add(
                            PlanPlacesEvent.acceptPlan(widget.plan.id, false));

                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              titlePadding: EdgeInsets.all(0.0),
                              contentPadding:
                                  EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0),
                              title: Container(
                                height: 170,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: (Radius.circular(4.0)),
                                        topRight: (Radius.circular(4.0))),
                                    color: Colors.grey),
                                width: double.infinity,
                                child: Center(
                                    child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/Info-I-Logo.png"),
                                        fit: BoxFit.fill),
                                    shape: BoxShape.circle,
                                  ),
                                )),
                              ),
                              content: Container(
                                height: 170,
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                            child: Text(
                                          tr('plan_details.declined'),
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        Text(
                                          tr('plan_details.decline_message'),
                                          style: TextStyle(color: Colors.grey),
                                          textAlign: TextAlign.left,
                                        )
                                      ],
                                    )),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        padding: EdgeInsets.only(bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              child: FlatButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                color: Color(0xFF00549d),
                                                textColor: Colors.white,
                                                onPressed: () {
                                                  Navigator.pushAndRemoveUntil(
                                                      context,
                                                      PageTransition(
                                                        child:
                                                            const CentralWidget(
                                                                index: 1),
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        type: PageTransitionType
                                                            .leftToRight,
                                                      ),
                                                      (route) => false);
                                                },
                                                child:
                                                    Text(tr('plan_map.start')),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      if (value.contains(tr('plan_details.delete'))) {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              titlePadding: EdgeInsets.all(0.0),
                              contentPadding: EdgeInsets.fromLTRB(
                                24.0,
                                20.0,
                                24.0,
                                0,
                              ),
                              title: Container(
                                height: 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: const Radius.circular(4.0),
                                    topRight: const Radius.circular(4.0),
                                  ),
                                  color: Colors.grey,
                                ),
                                width: double.infinity,
                                child: Center(
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/Info-I-Logo.png",
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                              content: Container(
                                height: 170,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                              child: Text(
                                            tr("plan_details.deleted"),
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          Text(
                                            tr("plan_details.delete_message"),
                                            style:
                                                TextStyle(color: Colors.grey),
                                            textAlign: TextAlign.left,
                                          )
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              child: FlatButton(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  color: Color(0xFF00549d),
                                                  textColor: Colors.white,
                                                  onPressed: () {
                                                    int count = 0;

                                                    Navigator
                                                        .pushAndRemoveUntil(
                                                            context,
                                                            PageTransition(
                                                              child:
                                                                  const CentralWidget(
                                                                      index: 1),
                                                              duration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          500),
                                                              type: PageTransitionType
                                                                  .leftToRight,
                                                            ),
                                                            (route) => false);
                                                  },
                                                  child: Text(
                                                      tr('plan_map.start'))),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return (!active
                              ? {
                                  tr('plan_details.accept'),
                                  tr('plan_details.decline')
                                }
                              : {tr('plan_details.delete')})
                          .map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Row(children: [
                            Icon(
                              !active
                                  ? choice.contains(tr('plan_details.accept'))
                                      ? Icons.done
                                      : Icons.block
                                  : Icons.delete,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              choice,
                              style: TextStyle(color: Colors.black),
                            )
                          ]),
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
              body: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/detail_plan.jpg"),
                                fit: BoxFit.fill)),
                        height: 300,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Container(
                              height: 300,
                              width: double.infinity,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 40),
                                child: Text(
                                  widget.plan.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.08,
                                    fontFamily: 'SF Pro Bold',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 50),
                            child: Image.asset(
                              'assets/images/directions.png',
                              width: 220,
                              height: 220,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 12, top: 20),
                    child: Row(
                      children: [
                        Text(
                          tr('plan_details.source'),
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.plan.source,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 12,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Row(
                      children: [
                        Text(
                          tr('plan_details.destination'),
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            widget.plan.destination,
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.045,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          child: BlocBuilder<PlanDetailsBloc, PlanDetailsState>(
                            builder: (context, state) {
                              return state.placesVisited.fold(
                                () => const Center(
                                  child: SizedBox(
                                    height: 130,
                                    child: SizedBox(
                                      height: 130,
                                      width: 150,
                                      child: FlareActor(
                                        "assets/images/PalmProject.flr",
                                        animation: "Untitled",
                                        sizeFromArtboard: true,
                                      ),
                                    ),
                                  ),
                                ),
                                (placesVisited) => PlacesList(
                                  places: places,
                                  plan: widget.plan,
                                  accepted: accepted,
                                  placesVisited: placesVisited,
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          right: 15,
                          child: ClassicButton(
                            width: 130,
                            height: 50,
                            onPressedFn: () {
                              final Map<String, Place> placesMap = {};

                              for (final place in places) {
                                placesMap[place.name] = place;
                              }

                              Navigator.push(
                                context,
                                PageTransition(
                                  child: PlanMap(
                                    places: placesMap,
                                    source: widget.plan.source,
                                    destination: widget.plan.destination,
                                    planId: widget.plan.id,
                                  ),
                                  type: PageTransitionType.rightToLeft,
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  LineAwesomeIcons.map_o,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  tr('plans.open_map'),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
