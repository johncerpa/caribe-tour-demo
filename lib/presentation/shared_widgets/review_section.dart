import 'package:caribe_tour/application/place_detail/review_comment/review_bloc.dart';
import 'package:caribe_tour/domain/post/review.dart';

import 'package:caribe_tour/presentation/shared_widgets/review_comment.dart';
import 'package:caribe_tour/presentation/shared_widgets/review_counts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants.dart';

class ReviewSection extends StatelessWidget {
  final String placeName;
  final bool canPost;
  final String coll;

  const ReviewSection({
    Key key,
    @required this.placeName,
    @required this.canPost,
    @required this.coll,
  });
  /*
            */

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewBloc, ReviewState>(
      builder: (tcontext, state) {
        return state.review.fold(
            () => Center(
                  child: CircularProgressIndicator(),
                ),
            (a) => StreamProvider<List<Review>>.value(
                value: state.reviewsStream,
                initialData: a,
                builder: (context, child) {
                  var reviewList = Provider.of<List<Review>>(context);
                  reviewList.sort((a, b) => b.dat.compareTo(a.dat));
                  return Stack(children: [
                    ListView.builder(
                      padding: const EdgeInsets.all(0),
                      physics: const BouncingScrollPhysics(),
                      itemCount: reviewList.length + 2,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          final List<int> cont = reviewList.isEmpty
                              ? [0, 0, 0, 0, 0]
                              : [
                                  reviewList
                                      .where((c) => c.rating == 5)
                                      .toList()
                                      .length,
                                  reviewList
                                      .where((c) => c.rating == 4)
                                      .toList()
                                      .length,
                                  reviewList
                                      .where((c) => c.rating == 3)
                                      .toList()
                                      .length,
                                  reviewList
                                      .where((c) => c.rating == 2)
                                      .toList()
                                      .length,
                                  reviewList
                                      .where((c) => c.rating == 1)
                                      .toList()
                                      .length
                                ];
                          return ReviewCounts(reviews: reviewList, cont: cont);
                        } else if (index == 1) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                '${reviewList.length.toString()} ${tr('places_detail.reviews')}',
                                style: TextStyle(
                                    color: Color(0xFF4E89AE),
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        } else {
                          return ReviewComment(review: reviewList[index - 2]);
                        }
                      },
                    ),
                    if (canPost)
                      Positioned(
                          bottom: 15,
                          right: 0,
                          child: FloatingActionButton(
                              child: const Icon(
                                Icons.add_comment,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                double rate = 0.0;
                                final TextEditingController controller =
                                    TextEditingController();
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(tr('places_detail.review')),
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: SizedBox(
                                              height: 200,
                                              width: 250,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    tr('places_detail.rate_the_place'),
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  RatingBar(
                                                    initialRating: 0,
                                                    minRating: rate,
                                                    allowHalfRating: false,
                                                    itemCount: 5,
                                                    itemPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4.0),
                                                    itemBuilder: (context, _) =>
                                                        Icon(
                                                      Icons.star,
                                                      color: Color(0xFFED6663),
                                                    ),
                                                    onRatingUpdate: (rating) {
                                                      rate = rating;
                                                    },
                                                  ),
                                                  Divider(),
                                                  TextField(
                                                    maxLines: 3,
                                                    decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderSide:
                                                              new BorderSide(
                                                                  color: Colors
                                                                      .grey)),
                                                      hintText: tr(
                                                          'places_detail.write_your_comment'),
                                                    ),
                                                    controller: controller,
                                                  )
                                                ],
                                              )),
                                        ),
                                        actions: [
                                          MaterialButton(
                                              child: Text(
                                                  tr('places_detail.close')),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              }),
                                          MaterialButton(
                                            child: Text(
                                                tr('places_detail.submit')),
                                            onPressed: () {
                                              if (rate > 0.0) {
                                                if (controller
                                                    .text.isNotEmpty) {
                                                  tcontext
                                                      .bloc<ReviewBloc>()
                                                      .add(ReviewEvent.save(
                                                          placeName,
                                                          controller.text,
                                                          rate,
                                                          coll,
                                                          "name"));
                                                  controller.text = "";

                                                  Navigator.of(context).pop();
                                                } else {
                                                  FlushbarHelper.createError(
                                                    message: tr(
                                                        'places_detail.comment_must_not_be_empty'),
                                                  ).show(context);
                                                }
                                              } else {
                                                FlushbarHelper.createError(
                                                  message: tr(
                                                      'places_detail.rate_the_place_first'),
                                                ).show(context);
                                              }
                                            },
                                          )
                                        ],
                                      );
                                    });
                              })),
                  ]);
                }));
      },
    );
  }
}
