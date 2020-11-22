import 'package:caribe_tour/application/place_detail/gallery/gallery_bloc.dart';
import 'package:caribe_tour/application/place_detail/review_comment/review_bloc.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/shared_widgets/information_section.dart';
import 'package:caribe_tour/presentation/shared_widgets/review_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:caribe_tour/domain/event/event.dart';
import '../../../../injection.dart';

class EventsDetail extends StatefulWidget {
  final Event event;
  const EventsDetail({Key key, this.event});
  @override
  _EventsDetailState createState() => _EventsDetailState();
}

class _EventsDetailState extends State<EventsDetail>
    with TickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    final df = DateFormat('dd-MMMM', context.locale.languageCode);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => getIt<GalleryBloc>()
              ..add(GalleryEvent.getGallery(widget.event.name, "events"))),
        BlocProvider(create: (context) {
          return getIt<ReviewBloc>()
            ..add(ReviewEvent.getReviews(widget.event.name, "events", 'name'));
        })
      ],
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              children: [
                FadeInImage(
                  fit: BoxFit.cover,
                  height: 350,
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(widget.event.imgUrl),
                ),
                Container(
                  height: 350,
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
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 24,
                            ),
                            const SizedBox(width: 24),
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
                              widget.event.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.06,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.white70,
                                  size: 25,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "${widget.event.city}, ${widget.event.department}. ${df.format(widget.event.evtDate)}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
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
              event: widget.event,
            ),
          ],
        ),
      ),
    );
  }
}

class SegmentedControl extends StatefulWidget {
  final Event event;

  const SegmentedControl({
    Key key,
    @required this.event,
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
        desc: widget.event.description[
            context.locale.languageCode.toLowerCase() == 'es'
                ? "spanish"
                : "english"],
        namePlace: widget.event.name,
        canPost: true,
        lat: -999999999999,
        lng: -999999999999,
        coll: 'events',
      ),
      1: ReviewSection(
        placeName: widget.event.name,
        canPost: true,
        coll: 'events',
      ),
    };

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            width: double.infinity,
            child: CupertinoSlidingSegmentedControl(
              children: {
                0: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.info,
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
                      Icons.rate_review,
                      color: kSecondaryColor,
                    ),
                    const SizedBox(width: 10),
                    Text(tr('places_detail.reviews'))
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
    );
  }
}
