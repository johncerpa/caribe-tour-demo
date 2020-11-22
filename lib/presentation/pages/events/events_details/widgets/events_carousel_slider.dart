import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'events_carousel_item.dart';

Widget eventsCarouselSlider(BuildContext context) {
  return CarouselSlider(
    items: [
      eventsCarouselItem(context,
          "https://s1.eestatic.com/2020/08/03/invertia/empresas/distribucion/Aliexpress-Alcohol-Comercio_electronico-Distribucion_510209579_156966588_1706x960.jpg"),
      eventsCarouselItem(
          context, "https://c.stocksy.com/a/ZoJ700/z9/1744467.jpg")
    ],
    options: CarouselOptions(
      autoPlay: true,
      enlargeCenterPage: true,
      aspectRatio: 2.0,
    ),
  );
}
