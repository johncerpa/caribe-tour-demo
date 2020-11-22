import 'package:caribe_tour/application/place_detail/gallery/gallery_bloc.dart';
import 'package:caribe_tour/application/place_detail/review_comment/review_bloc.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/place/placesdetail/widgets/advices_section.dart';

import 'package:caribe_tour/presentation/shared_widgets/information_section.dart';
import 'package:caribe_tour/presentation/shared_widgets/review_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../../../injection.dart';

class PlaceDetail extends StatefulWidget {
  final Place place;
  final bool canPost;

  const PlaceDetail({
    Key key,
    @required this.place,
    @required this.canPost,
  });

  @override
  _PlaceDetailState createState() => _PlaceDetailState();
}

class _PlaceDetailState extends State<PlaceDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.white));

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => getIt<GalleryBloc>()..add(GalleryEvent.getGallery(widget.place.name, "places"))),
        BlocProvider(create: (context) {
          return getIt<ReviewBloc>()..add(ReviewEvent.getReviews(widget.place.name, "places", 'name'));
        })
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          brightness: Brightness.dark,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: ListView(
          padding: const EdgeInsets.all(0),
          physics: const BouncingScrollPhysics(),
          children: [
            Stack(
              children: [
                FadeInImage(
                  fit: BoxFit.cover,
                  height: 390,
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(widget.place.imageUrl),
                ),
                Container(
                  height: 390,
                  color: Colors.black12,
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 5,
                        ),
                        child: Row(
                          children: const [
                            Spacer(),
                            Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(width: 20),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.place.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: MediaQuery.of(context).size.width * 0.06,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Icon(
                                  Ionicons.ios_navigate,
                                  color: Colors.white70,
                                  size: 25,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "${widget.place.city}, ${widget.place.department}",
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Bold',
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w600,
                                    fontSize: MediaQuery.of(context).size.width * 0.04,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                    ],
                  ),
                ),
              ],
            ),
            SegmentedControl(
              place: widget.place,
              canPost: widget.canPost,
            ),
          ],
        ),
      ),
    );
  }
}

class SegmentedControl extends StatefulWidget {
  final Place place;
  final bool canPost;

  const SegmentedControl({
    Key key,
    @required this.place,
    @required this.canPost,
  }) : super(key: key);

  @override
  _SegmentedControlState createState() => _SegmentedControlState();
}

class _SegmentedControlState extends State<SegmentedControl> {
  int currentSegment = 0;

  void onValueChanged(int newValue) {
    setState(() {
      currentSegment = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final children = <int, Widget>{
      0: InformationSection(
        desc: widget.place.description[context.locale.languageCode.toLowerCase() == 'es' ? "spanish" : "english"],
        namePlace: widget.place.name,
        canPost: widget.canPost,
        coll: 'places',
        lat: widget.place.latitude,
        lng: widget.place.longitude,
      ),
      1: ReviewSection(
        placeName: widget.place.name,
        canPost: widget.canPost,
        coll: 'places',
      ),
      2: AdvicesSection(tips: widget.place.tips),
    };

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: CupertinoSlidingSegmentedControl(
                children: {
                  0: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        LineAwesomeIcons.info_circle,
                        color: kSecondaryColor,
                      ),
                      const SizedBox(width: 10),
                      Text(tr('places_detail.information'))
                    ],
                  ),
                  1: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        LineAwesomeIcons.comments_o,
                        color: kSecondaryColor,
                      ),
                      const SizedBox(width: 10),
                      Text(tr('places_detail.reviews'))
                    ],
                  ),
                  2: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        LineAwesomeIcons.question_circle,
                        color: kSecondaryColor,
                      ),
                      const SizedBox(width: 10),
                      const Text('Tips')
                    ],
                  ),
                },
                onValueChanged: onValueChanged,
                groupValue: currentSegment,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: children[currentSegment],
            ),
          ],
        ),
      ),
    );
  }
}
