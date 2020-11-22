import 'package:auto_route/auto_route.dart';
import 'package:caribe_tour/domain/guide/guide.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:caribe_tour/presentation/routes/router.gr.dart';

class GuideCard extends StatelessWidget {
  final Guide guide;

  const GuideCard({Key key, @required this.guide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 2),
        child: ExpansionTileCard(
          initialElevation: 3,
          elevation: 3,
          baseColor: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          title: SizedBox(
            height: 80,
            child: Row(
              children: [
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(guide.profileImageUrl),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(width: 3, color: kSecondaryColor),
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${guide.firstName} ${guide.lastName}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        color: kSecondaryColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      guide.phone,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.035,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          children: [
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              buttonHeight: 52.0,
              buttonMinWidth: 90.0,
              children: <Widget>[
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  onPressed: () {
                    ExtendedNavigator.of(context)
                        .pushGuideProfilePage(guide: guide);
                  },
                  child: Column(
                    children: <Widget>[
                      const Icon(
                        LineAwesomeIcons.user,
                        color: kPrimaryColor,
                        size: 22,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Text(
                        tr('guide_profile.profile'),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  onPressed: () {
                    try {
                      takeUserToWhatsApp(guide.phone);
                    } catch (e) {
                      FlushbarHelper.createError(
                        message: e.toString(),
                      ).show(context);
                    }
                  },
                  child: Column(
                    children: <Widget>[
                      const Icon(
                        LineAwesomeIcons.comments_o,
                        color: kPrimaryColor,
                        size: 22,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Text(
                        tr('guide_profile.message'),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  onPressed: () {
                    try {
                      callTheUser(guide.phone);
                    } catch (e) {
                      FlushbarHelper.createError(
                        message: e.toString(),
                      ).show(context);
                    }
                  },
                  child: Column(
                    children: <Widget>[
                      const Icon(
                        LineAwesomeIcons.phone,
                        color: kPrimaryColor,
                        size: 22,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Text(
                        tr('guide_profile.contact'),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

Future<void> callTheUser(String phone) async {
  final String url = "tel://$phone";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw Exception('Could not open this URL');
  }
}

Future<void> takeUserToWhatsApp(String colombianPhone) async {
  final String url = "https://wa.me/57$colombianPhone";

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw Exception('Could not open this URL');
  }
}
