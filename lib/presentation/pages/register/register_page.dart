import 'package:caribe_tour/application/auth/register_form/register_form_bloc.dart';
import 'package:caribe_tour/injection.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/register/widgets/register_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
            title: Row(
              children: [
                Text(
                  tr('register.register_to'),
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(width: 5),
                const Text(
                  'Caribe Tour.',
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            bottom: TabBar(
                unselectedLabelColor: kPrimaryColor,
                labelColor: kSecondaryColor,
                tabs: [
                  Tab(text: tr('register.guide')),
                  Tab(text: tr('register.tourist')),
                ]),
          ),
          body: BlocProvider(
            create: (context) => getIt<RegisterFormBloc>(),
            child: TabBarView(children: [
              RegisterForm(isGuide: false),
              RegisterForm(isGuide: true)
            ]),
          ),
        ));
  }
}
