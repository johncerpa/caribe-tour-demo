import 'dart:ui';
import 'package:caribe_tour/domain/auth/local_domain_user.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/central_widget/home/widgets/carousel_slider_widget.dart';
import 'package:caribe_tour/presentation/pages/central_widget/home/widgets/events_list_widget.dart';
import 'package:caribe_tour/presentation/pages/central_widget/home/widgets/popular_sites_widget.dart';
import 'package:caribe_tour/presentation/pages/central_widget/home/widgets/search_bar_widget.dart';
import 'package:caribe_tour/presentation/pages/central_widget/home/widgets/services_widget.dart';
import 'package:caribe_tour/presentation/pages/central_widget/home/widgets/shared.dart';
import 'package:caribe_tour/presentation/pages/central_widget/widgets/central_drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatelessWidget {
  final LocalDomainUser user;

  const HomeView({this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.grey.withAlpha(18),
        drawer: AppDrawer(user: user),
        appBar: AppBar(
          flexibleSpace: flexibleSpace,
          brightness: Brightness.dark,
          backgroundColor: Colors.white,
          iconTheme: appBarIconTheme,
          centerTitle: true,
          elevation: 1,
          title: Container(
            margin: const EdgeInsets.only(left: 50),
            child: Row(
              children: [
                Align(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 25,
                    height: 25,
                  ),
                ),
                const SizedBox(width: 10),
                RichText(
                  text: TextSpan(style: getAppBarTextStyle(context), children: [
                    const TextSpan(
                      text: 'Caribe',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const TextSpan(
                      text: 'Tour',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 25),
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                '${tr('home.welcome')}, ${user.firstName.getOrCrash()}.',
                style: const TextStyle(fontFamily: 'SF Pro Bold', fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 30),
              child: Text(
                tr('home.where_are_you_going'),
                style: const TextStyle(
                  fontFamily: 'SF Pro Bold',
                  fontSize: 30,
                ),
              ),
            ),
            searchBar(context),
            const SizedBox(height: 10),
            Divider(color: Colors.grey.withOpacity(0.8)),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                tr('home.popular_places'),
                textAlign: TextAlign.left,
                style: titlesStyle(context),
              ),
            ),
            popularSitesWidget(context),
            Divider(color: Colors.grey.withOpacity(0.8)),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(
                  tr("home.services_around"),
                  textAlign: TextAlign.left,
                  style: titlesStyle(context),
                ),
              ),
            ),
            servicesWidget(context),
            Divider(color: Colors.grey.withOpacity(0.8)),
            Container(
              margin: const EdgeInsets.only(left: 10, bottom: 20),
              child: Text(
                tr('home.gallery'),
                textAlign: TextAlign.left,
                style: titlesStyle(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Center(
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        blurRadius: 2,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: carouselSlider(context),
                  ),
                ),
              ),
            ),
            Divider(color: Colors.grey.withOpacity(0.8)),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                tr('home.events_around'),
                textAlign: TextAlign.left,
                style: titlesStyle(context),
              ),
            ),
            eventsList(context),
          ],
        ),
      ),
    );
  }
}
