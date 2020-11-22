import 'package:caribe_tour/application/place_detail/review_comment/review_bloc.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FloatingButtonGuide extends StatelessWidget {
  final String email;
  const FloatingButtonGuide({this.email});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewBloc, ReviewState>(
      builder: (tcontext, state) {
        return FloatingActionButton(
          backgroundColor: kSecondaryColor,
          onPressed: () {
            double rate = 0.0;
            final TextEditingController controller = TextEditingController();
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(tr('guide_profile.review')),
                  content: SizedBox(
                    height: 250,
                    width: 250,
                    child: Column(
                      children: [
                        Text(
                          tr('guide_profile.rate_your_guide'),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RatingBar(
                          minRating: rate,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Color(0xFFED6663),
                          ),
                          onRatingUpdate: (rating) {
                            rate = rating;
                          },
                        ),
                        const Divider(),
                        TextField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            hintText: tr('guide_profile.write_your_comment'),
                          ),
                          controller: controller,
                        )
                      ],
                    ),
                  ),
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(tr('guide_profile.close')),
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (rate > 0.0) {
                          if (controller.text.isNotEmpty) {
                            tcontext.bloc<ReviewBloc>().add(ReviewEvent.save(
                                email,
                                controller.text,
                                rate,
                                "users",
                                "email"));
                            controller.text = "";

                            Navigator.of(context).pop();
                          } else {
                            FlushbarHelper.createError(
                              message:
                                  tr('guide_profile.comment_must_not_be_empty'),
                            ).show(context);
                          }
                        } else {
                          FlushbarHelper.createError(
                            message: tr('guide_profile.rate_the_guide_first'),
                          ).show(context);
                        }
                      },
                      child: Text(tr('guide_profile.submit')),
                    )
                  ],
                );
              },
            );
          },
          child: const Icon(
            FlutterIcons.comment_faw5,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
