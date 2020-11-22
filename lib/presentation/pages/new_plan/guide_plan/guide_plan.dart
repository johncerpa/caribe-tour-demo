import 'package:caribe_tour/application/guid_plan/guide_plan_bloc.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/new_plan/guide_plan/widget/guide_view.dart';
import 'package:caribe_tour/presentation/shared_widgets/loading_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';

class GuidePlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) =>
          getIt<GuidePlanBloc>()..add(GuidePlanEvent.getTouristandPlaces()),
      child: BlocConsumer<GuidePlanBloc, GuidePlanState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return state.tourist.fold(
              () => LoadingResources(
                  color1: kPrimaryColor, color2: kPrimaryDarkerColor),
              (a) => state.depanCities.fold(
                  () => LoadingResources(
                      color1: kPrimaryColor, color2: kPrimaryDarkerColor),
                  (b) => GuideView(
                        tourist: a,
                        depandCit: b,
                      )));
        },
      ),
    );
  }
}
