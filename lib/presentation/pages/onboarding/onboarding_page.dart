import 'package:auto_route/auto_route.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/routes/router.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Future<void> _onIntroEnd(BuildContext context) async {
    if (_selectedLanguage != null) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('SELECTED_LANGUAGE', _selectedLanguage);

      ExtendedNavigator.of(context).replace(Routes.signInPage);
    } else {
      FlushbarHelper.createError(message: 'Por favor, selecciona un lenguaje.')
          .show(context);
    }
  }

  String _selectedLanguage;

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset(
        'assets/images/$assetName.png',
        width: 350,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: tr('onboarding.select_language_title'),
          body: tr('onboarding.select_language_body'),
          image: _buildImage('language'),
          footer: ButtonTheme(
            height: 50,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              color: kPrimaryColor,
              onPressed: () {
                showMaterialScrollPicker(
                  context: context,
                  title: tr('onboarding.select_language_title'),
                  selectedItem: _selectedLanguage,
                  onChanged: (value) {
                    _selectedLanguage = value;

                    switch (value) {
                      case 'Español':
                        {
                          context.locale = const Locale('es');
                        }
                        break;
                      default:
                        {
                          context.locale = const Locale('en');
                        }
                    }
                  },
                  items: [
                    'English',
                    'Español',
                  ],
                );
              },
              child: Text(
                tr('onboarding.select_language_title'),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: tr('onboarding.welcome_title'),
          body: tr('onboarding.welcome_body'),
          image: _buildImage('welcome'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: tr("onboarding.plan_title"),
          body: tr("onboarding.plan_body"),
          image: _buildImage('plans'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: tr("onboarding.enjoy_title"),
          body: tr("onboarding.enjoy_body"),
          image: _buildImage('travel'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: tr("onboarding.location_title"),
          body: tr("onboarding.location_body"),
          image: _buildImage('location'),
          decoration: pageDecoration,
          footer: RaisedButton(
            onPressed: () async {
              final location = Location();
              await location.requestPermission();
            },
            child: Text(tr('onboarding.allow')),
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      done: Text(
        tr('onboarding.continue'),
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip:
          _selectedLanguage != null ? Text(tr('onboarding.skip')) : Container(),
      next: _selectedLanguage != null ? const Icon(Icons.arrow_forward) : null,
      dotsDecorator: const DotsDecorator(
        size: Size(10, 10),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      ),
    );
  }
}
