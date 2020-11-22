import 'package:auto_route/auto_route.dart';
import 'package:caribe_tour/application/auth/auth_bloc.dart';
import 'package:caribe_tour/presentation/routes/router.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) async {
            final prefs = await SharedPreferences.getInstance();
            final selectedLanguage = prefs.getString('SELECTED_LANGUAGE');

            switch (selectedLanguage) {
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
          authenticated: (_) {
            ExtendedNavigator.of(context).replace(Routes.centralWidget);
          },
          unauthenticated: (_) async {
            final prefs = await SharedPreferences.getInstance();
            const key = 'HAS_BEEN_OPENED';

            if (!prefs.containsKey(key)) {
              prefs.setBool(key, true);
              ExtendedNavigator.of(context).replace(Routes.onboardingPage);
            } else {
              ExtendedNavigator.of(context).replace(Routes.signInPage);
            }
          },
        );
      },
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [kPrimaryColor, kPrimaryDarkerColor],
            ),
          ),
          child: const Center(
            child: SizedBox(
              height: 130,
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 200,
                  width: 150,
                  child: FlareActor(
                    "assets/images/PalmProject.flr",
                    animation: "Untitled",
                    sizeFromArtboard: true,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
