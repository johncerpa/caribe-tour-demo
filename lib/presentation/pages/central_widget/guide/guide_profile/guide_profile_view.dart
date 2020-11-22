import 'package:caribe_tour/domain/guide/guide.dart';
import 'package:caribe_tour/domain/post/review.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/central_widget/guide/guide_profile/widgets/floatin_button_guide.dart';
import 'package:caribe_tour/presentation/shared_widgets/review_comment.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GuideProfileView extends StatelessWidget {
  final Guide guide;
  final List<Review> reviews;
  const GuideProfileView({Key key, this.guide, this.reviews});

  @override
  Widget build(BuildContext context) {
    final int sum = reviews.isNotEmpty ? suma() : 0;
    final double prom = reviews.isNotEmpty ? sum / reviews.length : 0.0;

    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingButtonGuide(email: guide.email),
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/profile_screen.jpg"),
                              fit: BoxFit.fill)),
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    FractionallySizedBox(
                      heightFactor: 0.9,
                      widthFactor: 1,
                      child: SizedBox(
                        child: Center(
                          child: FractionallySizedBox(
                            heightFactor: 0.4,
                            widthFactor: 1,
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          NetworkImage(guide.profileImageUrl),
                                      fit: BoxFit.fill,
                                    ),
                                    border: Border.all(
                                        width: 3, color: Colors.white),
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  '${guide.firstName} ${guide.lastName}',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.60,
                width: double.infinity,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: FractionallySizedBox(
                        heightFactor: 0.95,
                        widthFactor: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 6,
                                spreadRadius: 3,
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.only(
                                  left: 9,
                                  top: 80,
                                ),
                                child: Text(
                                  tr("guide_profile.reviews"),
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.08,
                                    fontFamily: 'SF Pro Bold',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.all(0),
                                  itemCount: reviews.length,
                                  itemBuilder: (context, index) {
                                    return ReviewComment(
                                      review: reviews[index],
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: FractionallySizedBox(
                        heightFactor: 0.15,
                        widthFactor: 0.8,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 3, // changes position of shadow
                              )
                            ],
                            color: Colors.white,
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 8.0,
                                            ),
                                            child: Text(
                                              tr('guide_profile.rating'),
                                              style: titulo(context),
                                            ),
                                          ),
                                          Text(
                                            prom.toStringAsFixed(1),
                                            style: subtitulo(context),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width: 50,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 8.0,
                                            ),
                                            child: Text(
                                              tr('guide_profile.phone'),
                                              style: titulo(context),
                                            ),
                                          ),
                                          Text(
                                            guide.phone,
                                            style: subtitulo(context),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 8.0,
                                            ),
                                            child: Text(
                                              tr('guide_profile.gender'),
                                              style: titulo(context),
                                            ),
                                          ),
                                          Text(
                                            guide.gender == 'Male'
                                                ? tr('profile.male')
                                                : tr('profile.female'),
                                            style: subtitulo(context),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextStyle titulo(BuildContext context) {
    return TextStyle(
      fontSize: MediaQuery.of(context).size.width * 0.05,
      color: kPrimaryColor,
      fontWeight: FontWeight.bold,
    );
  }

  int suma() {
    int sum = 0;
    for (var i = 0; i < 5; i++) {
      sum = sum +
          reviews.where((element) => element.rating == i + 1).toList().length *
              (i + 1);
    }

    return sum;
  }

  TextStyle subtitulo(BuildContext context) {
    return const TextStyle(
      fontSize: 13,
      color: Colors.black,
    );
  }
}
