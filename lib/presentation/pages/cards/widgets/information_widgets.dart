import 'package:caribe_tour/presentation/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NoMorePlacesAvailableWidget extends StatelessWidget {
  const NoMorePlacesAvailableWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Center(
        child: Text(
          tr('cards.no_more_places_available'),
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.05,
            color: Colors.grey.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}

class SwipeInformation extends StatelessWidget {
  const SwipeInformation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.keyboard_arrow_left,
          color: kSecondaryColor,
        ),
        Text(
          tr('cards.swipe_left_to_pass'),
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.04,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '|',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          tr('cards.swipe_right_to_add'),
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.04,
          ),
        ),
        const Icon(
          Icons.keyboard_arrow_right,
          color: kSecondaryColor,
        ),
      ],
    );
  }
}
