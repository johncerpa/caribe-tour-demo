import 'dart:io';

import 'package:caribe_tour/application/plans/plans/plans_bloc.dart';
import 'package:caribe_tour/domain/auth/local_domain_user.dart';
import 'package:caribe_tour/domain/plans/plan.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/central_widget/plans/plan_list/widgets/plan_view.dart';
import 'package:caribe_tour/presentation/pages/central_widget/widgets/central_drawer.dart';
import 'package:caribe_tour/presentation/pages/new_plan/new_plan_introduction.dart';
import 'package:caribe_tour/presentation/pages/new_plan/tourist_plan/new_plan_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:caribe_tour/presentation/shared_widgets/classic_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:caribe_tour/infrastructure/core/firestore_helpers.dart';

class PlanPage extends StatelessWidget {
  final LocalDomainUser user;
  const PlanPage({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withAlpha(18),
      drawer: AppDrawer(user: user),
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 2,
        backgroundColor: Colors.white,
        flexibleSpace: flexibleSpace,
        iconTheme: appBarIconTheme,
        title: Text(
          tr('plans.my_plans'),
          style: getAppBarTextStyle(context),
        ),
      ),
      floatingActionButton: floatingAddPlanButton(context),
      body: BlocBuilder<PlansBloc, PlansState>(
        builder: (context, state) {
          return state.initialplans.fold(
            () => const Center(child: CircularProgressIndicator()),
            (a) => StreamProvider<List<Plan>>.value(
              value: state.plansStream,
              initialData: a,
              builder: (context, child) {
                final plans = Provider.of<List<Plan>>(context);

                return PlanView(
                  userPlans: plans,
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget floatingAddPlanButton(BuildContext context) {
    return ClassicButton(
      width: 130,
      height: 50,
      onPressedFn: () {
        Navigator.push(
          context,
          PageTransition(
            child: const NewPlanInstruction(),
            type: PageTransitionType.rightToLeft,
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.add,
            color: Colors.white,
            size: 18,
          ),
          const SizedBox(width: 5),
          Text(
            tr('plans.create_route'),
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class Hope {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<List<Plan>> planUser(LocalDomainUser user) {
    List<Plan> plans = [];
    var userDoc = _firestore.collection("users").doc(user.id.getOrCrash()).collection("plans");

    final algo =
        userDoc.snapshots().map((event) => event.docs.map((e) => Plan.fromJson(e.data()).copyWith(id: e.id)).toList());

    algo.map((event) => plans = event);

    return algo;
  }

  List<Plan> initial(LocalDomainUser user) {
    List<Plan> plans = [];
    var snapshot = _firestore
        .collection("users")
        .doc(user.id.getOrCrash())
        .collection("plans")
        .get()
        .then((value) => value.docs.map((doc) => plans.add(Plan.fromJson(doc.data()).copyWith(id: doc.id))));

    return plans;
  }
}
