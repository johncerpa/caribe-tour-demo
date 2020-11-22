import 'package:flutter/material.dart';

Widget eventsCarouselItem(BuildContext context, String link) {
    return Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: NetworkImage(link), fit: BoxFit.cover)));
  }