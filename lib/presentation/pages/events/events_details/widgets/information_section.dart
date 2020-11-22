import 'package:flutter/cupertino.dart';

import 'events_carousel_slider.dart';

Widget informationSection(BuildContext context) {
  return ListView(
    children: [
      Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tempus nisl pharetra placerat auctor. Integer sagittis vestibulum nulla id euismod. Ut et eleifend neque. Aliquam erat volutpat. Proin eget nibh dignissim velit elementum tincidunt. Integer et magna nec turpis ultricies luctus vitae aliquam massa. Ut porta purus ac lectus dictum tincidunt nec sit amet dolor. Proin eu augue in lectus varius facilisis. Suspendisse fringilla ultrices venenatis. Cras facilisis nisi in urna tempus, eu suscipit tortor consectetur. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean nec dui metus. Etiam vitae dui neque.",
      ),
      const SizedBox(height: 5),
      Text(
        "Galeria",
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: Color(0xFF4E89AE),
        ),
      ),
      const SizedBox(height: 15),
      eventsCarouselSlider(context),
      const SizedBox(height: 5)
    ],
  );
}
