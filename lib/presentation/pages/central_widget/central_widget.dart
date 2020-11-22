import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:caribe_tour/application/auth/auth_bloc.dart';
import 'package:caribe_tour/application/guide/guide_bloc.dart';
import 'package:caribe_tour/application/home/carousel/carousel_bloc.dart';
import 'package:caribe_tour/application/home/event/event_bloc.dart';
import 'package:caribe_tour/application/home/popular_places/popular_places_bloc.dart';
import 'package:caribe_tour/application/plans/areas/areas_bloc.dart';
import 'package:caribe_tour/application/plans/plans/plans_bloc.dart';
import 'package:caribe_tour/application/profile/profile_bloc.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/central_widget/widgets/central_widget_view.dart';
import 'package:caribe_tour/presentation/routes/router.gr.dart';
import 'package:caribe_tour/presentation/shared_widgets/loading_resources.dart';

import '../../../injection.dart';

class CentralWidget extends StatefulWidget {
  final int index;
  const CentralWidget({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  _CentralWidgetState createState() => _CentralWidgetState();
}

class _CentralWidgetState extends State<CentralWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>(),
        ),
        BlocProvider(create: (context) {
          return getIt<PlansBloc>()..add(PlansEvent.streamPlanss());
        }),
        BlocProvider(
          create: (context) => getIt<PopularPlacesBloc>()
            ..add(const PopularPlacesEvent.popularPlaces()),
        ),
        BlocProvider(
            create: (context) => getIt<ProfileBloc>()
              ..add(const ProfileEvent.loadingUserInformation())),
        BlocProvider(
          create: (context) =>
              getIt<EventBloc>()..add(const EventEvent.getEvent()),
        ),
        BlocProvider(
          create: (context) {
            return getIt<CarouselBloc>()
              ..add(const CarouselEvent.randomPlaces());
          },
        ),
        BlocProvider(
          create: (context) {
            return getIt<AreasBloc>()
              ..add(const AreasEvent.loadingDepartmentsAndCities());
          },
        ),
        BlocProvider(
          create: (context) {
            return getIt<GuideBloc>()..add(const GuideEvent.getGuides());
          },
        )
      ],
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.map(
            initial: (_) {},
            authenticated: (_) {},
            unauthenticated: (_) {
              ExtendedNavigator.of(context).replace(Routes.signInPage);
            },
          );
        },
        builder: (context, state) => BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return state.localDomainUser.fold(
              () => const LoadingResources(
                color1: kPrimaryColor,
                color2: kPrimaryDarkerColor,
              ),
              (a) => CentralWidgetView(
                user: a,
                index: widget.index,
              ),
            );
          },
        ),
      ),
    );
  }
}
