import 'package:caribe_tour/domain/post/gallery.dart';
import 'package:caribe_tour/presentation/shared_widgets/gallery_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PlaceCarouselSlider extends StatelessWidget {
  final List<Gallery> photos;

  const PlaceCarouselSlider({@required this.photos});
  @override
  Widget build(BuildContext context) {
    if (photos.isEmpty) {
      return Column(
        children: [
          Text(
            tr('places_detail.no_images'),
            style: TextStyle(
              color: Colors.grey,
              fontSize: MediaQuery.of(context).size.width * 0.05,
            ),
          ),
          Align(
            child: Image.asset(
              'assets/images/travel.png',
              width: 200,
              height: 200,
            ),
          ),
        ],
      );
    }

    return CarouselSlider(
      items: photos
          .map((photo) => placeCarouselItem(context, photo.imUrl, photo.author))
          .toList(),
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
      ),
    );
  }

  Widget placeCarouselItem(BuildContext context, String link, String author) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: Stack(
        children: [
          GestureDetector(
              onTap: () {
                final algo = photos
                    .where((element) => element.imUrl.contains(link))
                    .toList();
                var photo = photos.indexOf(algo[0]);
                var aux = photos.sublist(photo, photos.length);
                if (aux.length < photos.length) {
                  var aux2 = photos.sublist(0, photo);
                  aux = aux + aux2;
                }

                Navigator.push(
                  context,
                  PageTransition(
                    child: GalleryView(
                      images: aux,
                    ),
                    type: PageTransitionType.scale,
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(link),
                    fit: BoxFit.fill,
                  ),
                ),
              )),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.only(right: 10),
              height: 50,
              width: double.infinity,
              color: Colors.black.withOpacity(0.5),
              child: Text(
                '${tr('places_detail.uploaded_by')}: $author',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
