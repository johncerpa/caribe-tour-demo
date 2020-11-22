import 'package:caribe_tour/presentation/pages/events/events_details/widgets/review_counts.dart';
import 'package:caribe_tour/presentation/pages/events/events_details/widgets/review_list.dart';
import 'package:flutter/material.dart';

Widget reviewSection(BuildContext context) {
  return Column(
    children: [
      reviewCounts(context),
      Expanded(child: reviewList(context)),
    ],
  );
}
