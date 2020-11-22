import 'package:auto_route/auto_route.dart';
import 'package:caribe_tour/application/auth/auth_bloc.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/injection.dart';
import 'package:caribe_tour/presentation/routes/router.gr.dart' as main_router;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested());
        })
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Caribe Tour',
        home: ExtendedNavigator(router: main_router.Router()),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: fontFamily,
          primaryColor: kPrimaryColor,
          accentColor: kSecondaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
