import 'package:auto_route/auto_route_annotations.dart';
import 'package:caribe_tour/presentation/pages/cards/cards_page.dart';
import 'package:caribe_tour/presentation/pages/central_widget/central_widget.dart';
import 'package:caribe_tour/presentation/pages/central_widget/guide/guide_profile/guide_profile_page.dart';
import 'package:caribe_tour/presentation/pages/central_widget/plans/plans_detail/plan_details.dart';
import 'package:caribe_tour/presentation/pages/events/events_details/events_detail_page.dart';
import 'package:caribe_tour/presentation/pages/map/map_page.dart';
import 'package:caribe_tour/presentation/pages/map/plan_map.dart';
import 'package:caribe_tour/presentation/pages/new_plan/guide_plan/guide_plan.dart';
import 'package:caribe_tour/presentation/pages/new_plan/tourist_plan/new_plan_page.dart';
import 'package:caribe_tour/presentation/pages/new_plan/tourist_plan/select_destination_page.dart';
import 'package:caribe_tour/presentation/pages/new_plan/tourist_plan/select_source_page.dart';
import 'package:caribe_tour/presentation/pages/map/widgets/places_result_view.dart';

import 'package:caribe_tour/presentation/pages/onboarding/onboarding_page.dart';
import 'package:caribe_tour/presentation/pages/place/placesdetail/places_detail_page.dart';
import 'package:caribe_tour/presentation/pages/profile/profile_page.dart';
import 'package:caribe_tour/presentation/pages/register/register_page.dart';
import 'package:caribe_tour/presentation/pages/search_page/search_page.dart';
import 'package:caribe_tour/presentation/pages/sign_in/sign_in_page.dart';
import 'package:caribe_tour/presentation/pages/splash/splash_page.dart';
import 'package:caribe_tour/presentation/pages/chatbot/chatbot.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: OnboardingPage),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: RegisterPage),
    MaterialRoute(page: CentralWidget),
    MaterialRoute(page: ProfilePage),
    MaterialRoute(page: NewPlanPage),
    MaterialRoute(page: CardsPage),
    MaterialRoute(page: SelectSourcePage),
    MaterialRoute(page: SelectDestinationPage),
    MaterialRoute(page: MapPage),
    MaterialRoute(page: PlanMap),
    MaterialRoute(page: EventsDetail),
    MaterialRoute(page: PlaceDetail),
    MaterialRoute(page: PlanDetails),
    MaterialRoute(page: GuideProfilePage),
    MaterialRoute(page: SearchPage),
    MaterialRoute(page: GuidePlanPage),
    MaterialRoute(page: ChatBot),
    MaterialRoute(page: PlacesResult)
  ],
)
class $Router {}
