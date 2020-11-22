import 'package:caribe_tour/application/plans/areas/areas_bloc.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/new_plan/tourist_plan/widgets/new_plan_view.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:caribe_tour/injection.dart';

class NewPlanPage extends StatefulWidget {
  const NewPlanPage({Key key}) : super(key: key);

  @override
  _NewPlanPageState createState() => _NewPlanPageState();
}

class _NewPlanPageState extends State<NewPlanPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      backgroundColor: Colors.grey.withAlpha(18),
      appBar: AppBar(
        flexibleSpace: flexibleSpace,
        elevation: 2,
        brightness: Brightness.light,
        iconTheme: appBarIconTheme,
        backgroundColor: Colors.white,
        title: Text(
          tr('plans.new_plan'),
          style: getAppBarTextStyle(context),
        ),
      ),
      body: BlocProvider(
        create: (context) {
          return getIt<AreasBloc>()
            ..add(const AreasEvent.loadingDepartmentsAndCities());
        },
        child: BlocBuilder<AreasBloc, AreasState>(
          builder: (context, state) {
            return state.deptsAndCities.fold(
              () => const Center(
                child: SizedBox(
                  height: 130,
                  child: SizedBox(
                    height: 130,
                    width: 150,
                    child: FlareActor(
                      "assets/images/PalmProject.flr",
                      animation: "Untitled",
                      sizeFromArtboard: true,
                    ),
                  ),
                ),
              ),
              (deptsAndCities) => NewPlanView(deptsAndCities: deptsAndCities),
            );
          },
        ),
      ),
    );
  }
}
