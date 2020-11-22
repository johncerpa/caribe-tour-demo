import 'package:caribe_tour/application/place_detail/review_comment/review_bloc.dart';
import 'package:caribe_tour/domain/guide/guide.dart';
import 'package:caribe_tour/domain/post/review.dart';
import 'package:caribe_tour/injection.dart';
import 'package:caribe_tour/presentation/pages/central_widget/guide/guide_profile/guide_profile_view.dart';
import 'package:caribe_tour/presentation/shared_widgets/loading_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../constants.dart';

class GuideProfilePage extends StatelessWidget {
  final Guide guide;
  const GuideProfilePage({Key key, @required this.guide});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ReviewBloc>()
        ..add(ReviewEvent.getReviews(guide.email, "users", "email")),
      child: BlocBuilder<ReviewBloc, ReviewState>(
        builder: (context, state) {
          return state.review.fold(
              () => Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [kSecondaryColor, kSecondaryDarkerColor],
                      ),
                    ),
                    child: const LoadingResources(
                      color1: kSecondaryColor,
                      color2: kSecondaryDarkerColor,
                    ),
                  ),
              (a) => StreamProvider<List<Review>>.value(
                    value: state.reviewsStream,
                    initialData: a,
                    builder: (context, child) {
                      var reviews = Provider.of<List<Review>>(context);
                      return GuideProfileView(reviews: reviews, guide: guide);
                    },
                  ) //,
              );
        },
      ),
    );
  }
}
