import 'package:auto_route/auto_route.dart';
import 'package:caribe_tour/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';

Widget mapEventsList(BuildContext context) {
  return Container(
    height: 150,
    margin: const EdgeInsets.all(5),
    child: ListView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      children: [eventItem(context), eventItem(context), eventItem(context)],
    ),
  );
}

Widget eventItem(BuildContext context) {
  return Container(
    width: 200,
    margin: const EdgeInsets.all(5),
    decoration: eventDecoration(),
    child: Stack(
      children: [
        GestureDetector(
          onTap: () {
            ExtendedNavigator.of(context).push(Routes.eventsDetail);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage("assets/images/imagen1.jpeg"),
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
                  "12 de octubre",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.030,
                  ),
                ),
                Text(
                  "Fiesta en la casa de jhon",
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
