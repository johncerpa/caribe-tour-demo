import 'package:auto_route/auto_route.dart';
import 'package:caribe_tour/application/home/event/event_bloc.dart';
import 'package:caribe_tour/domain/event/event.dart';
import 'package:caribe_tour/presentation/pages/events/events_details/events_detail_page.dart';
import 'package:caribe_tour/presentation/routes/router.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_set/animator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

Widget eventsList(BuildContext context) {
  return BlocConsumer<EventBloc, EventState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return state.events.fold(
          () => Center(
                child: CircularProgressIndicator(),
              ),
          (a) => Container(
                height: 150,
                margin: const EdgeInsets.all(5),
                child: ListView.builder(
                  itemCount: a.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return eventItem(context, a[index]);
                  },
                ),
              ));
    },
  );
}

Widget eventItem(BuildContext context, Event event) {
  final df = DateFormat('dd-MMMM', context.locale.languageCode);
  return Container(
    width: 200,
    margin: const EdgeInsets.all(5),
    decoration: eventDecoration(),
    child: Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    child: EventsDetail(
                      event: event,
                    ),
                    type: PageTransitionType.bottomToTop));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(event.imgUrl),
                fit: BoxFit.fill,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 3, // changes position of shadow
                  offset: const Offset(2, 3),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              ),
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            width: 200,
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  df.format(event.evtDate),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.030,
                  ),
                ),
                Text(
                  event.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.030,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

BoxDecoration eventDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
  );
}
