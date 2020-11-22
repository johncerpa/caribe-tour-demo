import 'package:caribe_tour/application/plans/cards/cards_bloc.dart';
import 'package:caribe_tour/domain/plans/plan.dart';
import 'package:caribe_tour/presentation/pages/new_plan/edit_plan/widgets/edit_plan_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';

class EditPlan extends StatelessWidget {
  final Plan plan;
  const EditPlan({Key key, @required this.plan});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) {
        if (plan.byDepartment) {
          return getIt<CardsBloc>()
            ..add(
              CardsEvent.loadingPlacesByDepartments(
                departments: plan.citdepart,
                kidsFilter: plan.kidsFilter,
                disabilitiesFilter: plan.disableFilter,
              ),
            );
        } else {
          return getIt<CardsBloc>()
            ..add(
              CardsEvent.loadingbyCities(
                cities: plan.citdepart,
                kidsFilter: plan.kidsFilter,
                disabilitiesFilter: plan.disableFilter,
              ),
            );
        }
      },
      child: BlocConsumer<CardsBloc, CardsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return state.places.fold(
              () => Center(
                    child: CircularProgressIndicator(),
                  ),
              (places) => EditPlanView(
                    places: places,
                    planPlaces: plan.places,
                    kidsFilter: plan.kidsFilter,
                    disableFilter: plan.disableFilter,
                    email: plan.touristE,
                    byDepartament: plan.byDepartment,
                    daysAvailable: 10,
                    citdepart: plan.citdepart,
                    title: plan.name,
                    planid: plan.id,
                  ));
        },
      ),
    );
  }
}
