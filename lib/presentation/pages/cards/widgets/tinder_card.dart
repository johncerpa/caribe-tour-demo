import 'package:caribe_tour/domain/plans/place.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/place/placesdetail/places_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:transparent_image/transparent_image.dart';

class TinderCard extends StatelessWidget {
  final Place place;

  const TinderCard({
    Key key,
    @required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: PlaceDetail(
              place: place,
              canPost: false,
            ),
            type: PageTransitionType.rightToLeft,
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        elevation: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: [
            FadeInImage(
              fit: BoxFit.cover,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(place.imageUrl),
              height: MediaQuery.of(context).size.height,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 40, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    place.name,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontFamily: "SF Pro Bold",
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Ionicons.ios_navigate, color: Colors.white),
                      const SizedBox(width: 5),
                      Text(
                        '${place.city}, ${place.department}',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  RatingBar(
                    itemSize: 30,
                    ignoreGestures: true,
                    initialRating: place.rating,
                    minRating: 1,
                    allowHalfRating: true,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: kSecondaryDarkerColor,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
