import 'package:caribe_tour/presentation/pages/events/events_details/widgets/review_comment.dart';
import 'package:flutter/material.dart';

Widget reviewList(BuildContext context) {
  return ListView(
    children: [
      Align(
          alignment: Alignment.centerLeft,
          child: Container(
              margin: EdgeInsets.only(left: 5),
              child: Text(
                "10 reviews",
                style: TextStyle(
                    color: Color(0xFF4E89AE),
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ))),
      reviewComment(context,
          "Lrem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tempus nisl pharetra placerat auctor. Integer sagittis vestibulum nulla id euismod. Ut et eleifend neque. Aliquam erat volutpat. Proin eget nibh dignissim velit elementum tincidunt. Integer et magna nec turpis ultricies luctus vitae aliquam massa. Ut porta purus ac lectus dictum tincidunt nec sit amet dolor. Proin eu augue in lectus varius facilisis. Suspendisse fringilla ultrices venenatis."),
      reviewComment(context,
          "Lrem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tempus nisl pharetra placerat auctor. Integer sagittis vestibulum nulla id euismod. Ut et eleifend neque. Aliquam erat volutpat. Proin eget nibh dignissim velit elementum tincidunt. Integer et magna n"),
      reviewComment(context, "1")
    ],
  );
}
