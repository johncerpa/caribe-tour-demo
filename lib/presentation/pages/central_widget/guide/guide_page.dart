import 'package:caribe_tour/application/guide/guide_bloc.dart';
import 'package:caribe_tour/domain/auth/local_domain_user.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/central_widget/guide/widgets/guide_view.dart';
import 'package:caribe_tour/presentation/pages/central_widget/widgets/central_drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuidePage extends StatelessWidget {
  final LocalDomainUser user;
  const GuidePage({this.user});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey.withAlpha(18),
      drawer: AppDrawer(user: user),
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 2,
        backgroundColor: Colors.white,
        iconTheme: appBarIconTheme,
        title: Text(
          tr('plans.guides'),
          style: getAppBarTextStyle(context),
        ),
        flexibleSpace: flexibleSpace,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 5,
          left: 12,
          right: 12,
        ),
        child: BlocBuilder<GuideBloc, GuideState>(
          builder: (context, state) {
            return state.guides.fold(
              () => const Center(child: CircularProgressIndicator()),
              (guides) => GuideView(guide: guides),
            );
          },
        ),
      ),
    );
  }
}
