// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../../domain/auth/local_domain_user.dart';
import '../../domain/event/event.dart';
import '../../domain/guide/guide.dart';
import '../../domain/plans/place.dart';
import '../../domain/plans/plan.dart';
import '../pages/cards/cards_page.dart';
import '../pages/central_widget/central_widget.dart';
import '../pages/central_widget/guide/guide_profile/guide_profile_page.dart';
import '../pages/central_widget/plans/plans_detail/plan_details.dart';
import '../pages/chatbot/chatbot.dart';
import '../pages/events/events_details/events_detail_page.dart';
import '../pages/map/map_page.dart';
import '../pages/map/plan_map.dart';
import '../pages/map/widgets/places_result_view.dart';
import '../pages/new_plan/guide_plan/guide_plan.dart';
import '../pages/new_plan/tourist_plan/new_plan_page.dart';
import '../pages/new_plan/tourist_plan/select_destination_page.dart';
import '../pages/new_plan/tourist_plan/select_source_page.dart';
import '../pages/onboarding/onboarding_page.dart';
import '../pages/place/placesdetail/places_detail_page.dart';
import '../pages/profile/profile_page.dart';
import '../pages/register/register_page.dart';
import '../pages/search_page/search_page.dart';
import '../pages/sign_in/sign_in_page.dart';
import '../pages/splash/splash_page.dart';

class Routes {
  static const String splashPage = '/';
  static const String onboardingPage = '/onboarding-page';
  static const String signInPage = '/sign-in-page';
  static const String registerPage = '/register-page';
  static const String centralWidget = '/central-widget';
  static const String profilePage = '/profile-page';
  static const String newPlanPage = '/new-plan-page';
  static const String cardsPage = '/cards-page';
  static const String selectSourcePage = '/select-source-page';
  static const String selectDestinationPage = '/select-destination-page';
  static const String mapPage = '/map-page';
  static const String planMap = '/plan-map';
  static const String eventsDetail = '/events-detail';
  static const String placeDetail = '/place-detail';
  static const String planDetails = '/plan-details';
  static const String guideProfilePage = '/guide-profile-page';
  static const String searchPage = '/search-page';
  static const String guidePlanPage = '/guide-plan-page';
  static const String chatBot = '/chat-bot';
  static const String placesResult = '/places-result';
  static const all = <String>{
    splashPage,
    onboardingPage,
    signInPage,
    registerPage,
    centralWidget,
    profilePage,
    newPlanPage,
    cardsPage,
    selectSourcePage,
    selectDestinationPage,
    mapPage,
    planMap,
    eventsDetail,
    placeDetail,
    planDetails,
    guideProfilePage,
    searchPage,
    guidePlanPage,
    chatBot,
    placesResult,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashPage, page: SplashPage),
    RouteDef(Routes.onboardingPage, page: OnboardingPage),
    RouteDef(Routes.signInPage, page: SignInPage),
    RouteDef(Routes.registerPage, page: RegisterPage),
    RouteDef(Routes.centralWidget, page: CentralWidget),
    RouteDef(Routes.profilePage, page: ProfilePage),
    RouteDef(Routes.newPlanPage, page: NewPlanPage),
    RouteDef(Routes.cardsPage, page: CardsPage),
    RouteDef(Routes.selectSourcePage, page: SelectSourcePage),
    RouteDef(Routes.selectDestinationPage, page: SelectDestinationPage),
    RouteDef(Routes.mapPage, page: MapPage),
    RouteDef(Routes.planMap, page: PlanMap),
    RouteDef(Routes.eventsDetail, page: EventsDetail),
    RouteDef(Routes.placeDetail, page: PlaceDetail),
    RouteDef(Routes.planDetails, page: PlanDetails),
    RouteDef(Routes.guideProfilePage, page: GuideProfilePage),
    RouteDef(Routes.searchPage, page: SearchPage),
    RouteDef(Routes.guidePlanPage, page: GuidePlanPage),
    RouteDef(Routes.chatBot, page: ChatBot),
    RouteDef(Routes.placesResult, page: PlacesResult),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashPage(),
        settings: data,
      );
    },
    OnboardingPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OnboardingPage(),
        settings: data,
      );
    },
    SignInPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignInPage(),
        settings: data,
      );
    },
    RegisterPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterPage(),
        settings: data,
      );
    },
    CentralWidget: (data) {
      final args = data.getArgs<CentralWidgetArguments>(
        orElse: () => CentralWidgetArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CentralWidget(
          key: args.key,
          index: args.index,
        ),
        settings: data,
      );
    },
    ProfilePage: (data) {
      final args = data.getArgs<ProfilePageArguments>(
        orElse: () => ProfilePageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfilePage(
          key: args.key,
          user: args.user,
        ),
        settings: data,
      );
    },
    NewPlanPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const NewPlanPage(),
        settings: data,
      );
    },
    CardsPage: (data) {
      final args = data.getArgs<CardsPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => CardsPage(
          key: args.key,
          byDepartments: args.byDepartments,
          departments: args.departments,
          cities: args.cities,
          forKidsFilter: args.forKidsFilter,
          disabilitiesFilter: args.disabilitiesFilter,
          daysAvailable: args.daysAvailable,
          email: args.email,
        ),
        settings: data,
      );
    },
    SelectSourcePage: (data) {
      final args = data.getArgs<SelectSourcePageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => SelectSourcePage(
          key: args.key,
          placesMap: args.placesMap,
          email: args.email,
          byDepartment: args.byDepartment,
          citdepart: args.citdepart,
          disableFilter: args.disableFilter,
          editing: args.editing,
          title: args.title,
          planid: args.planid,
          kidsFilter: args.kidsFilter,
        ),
        settings: data,
      );
    },
    SelectDestinationPage: (data) {
      final args = data.getArgs<SelectDestinationPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => SelectDestinationPage(
          key: args.key,
          title: args.title,
          placesMap: args.placesMap,
          sourcePlace: args.sourcePlace,
          byDepartment: args.byDepartment,
          citdepart: args.citdepart,
          disableFilter: args.disableFilter,
          kidsFilter: args.kidsFilter,
          email: args.email,
          planid: args.planid,
          currentLocationData: args.currentLocationData,
          editing: args.editing,
        ),
        settings: data,
      );
    },
    MapPage: (data) {
      final args = data.getArgs<MapPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => MapPage(
          key: args.key,
          planid: args.planid,
          places: args.places,
          source: args.source,
          destination: args.destination,
          email: args.email,
          byDepartment: args.byDepartment,
          citdepart: args.citdepart,
          disableFilter: args.disableFilter,
          kidsFilter: args.kidsFilter,
          editing: args.editing,
          title: args.title,
        ),
        settings: data,
      );
    },
    PlanMap: (data) {
      final args = data.getArgs<PlanMapArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => PlanMap(
          key: args.key,
          places: args.places,
          source: args.source,
          destination: args.destination,
          planId: args.planId,
        ),
        settings: data,
      );
    },
    EventsDetail: (data) {
      final args = data.getArgs<EventsDetailArguments>(
        orElse: () => EventsDetailArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => EventsDetail(
          key: args.key,
          event: args.event,
        ),
        settings: data,
      );
    },
    PlaceDetail: (data) {
      final args = data.getArgs<PlaceDetailArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => PlaceDetail(
          key: args.key,
          place: args.place,
          canPost: args.canPost,
        ),
        settings: data,
      );
    },
    PlanDetails: (data) {
      final args = data.getArgs<PlanDetailsArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => PlanDetails(plan: args.plan),
        settings: data,
      );
    },
    GuideProfilePage: (data) {
      final args = data.getArgs<GuideProfilePageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => GuideProfilePage(
          key: args.key,
          guide: args.guide,
        ),
        settings: data,
      );
    },
    SearchPage: (data) {
      final args = data.getArgs<SearchPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => SearchPage(
          key: args.key,
          word: args.word,
        ),
        settings: data,
      );
    },
    GuidePlanPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => GuidePlanPage(),
        settings: data,
      );
    },
    ChatBot: (data) {
      final args = data.getArgs<ChatBotArguments>(
        orElse: () => ChatBotArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChatBot(
          key: args.key,
          title: args.title,
        ),
        settings: data,
      );
    },
    PlacesResult: (data) {
      final args = data.getArgs<PlacesResultArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => PlacesResult(
          key: args.key,
          placeType: args.placeType,
          location: args.location,
          language: args.language,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushSplashPage() => push<dynamic>(Routes.splashPage);

  Future<dynamic> pushOnboardingPage() => push<dynamic>(Routes.onboardingPage);

  Future<dynamic> pushSignInPage() => push<dynamic>(Routes.signInPage);

  Future<dynamic> pushRegisterPage() => push<dynamic>(Routes.registerPage);

  Future<dynamic> pushCentralWidget({
    Key key,
    int index,
  }) =>
      push<dynamic>(
        Routes.centralWidget,
        arguments: CentralWidgetArguments(key: key, index: index),
      );

  Future<dynamic> pushProfilePage({
    Key key,
    LocalDomainUser user,
  }) =>
      push<dynamic>(
        Routes.profilePage,
        arguments: ProfilePageArguments(key: key, user: user),
      );

  Future<dynamic> pushNewPlanPage() => push<dynamic>(Routes.newPlanPage);

  Future<dynamic> pushCardsPage({
    Key key,
    @required bool byDepartments,
    @required List<String> departments,
    List<String> cities,
    @required bool forKidsFilter,
    @required bool disabilitiesFilter,
    @required int daysAvailable,
    String email,
  }) =>
      push<dynamic>(
        Routes.cardsPage,
        arguments: CardsPageArguments(
            key: key,
            byDepartments: byDepartments,
            departments: departments,
            cities: cities,
            forKidsFilter: forKidsFilter,
            disabilitiesFilter: disabilitiesFilter,
            daysAvailable: daysAvailable,
            email: email),
      );

  Future<dynamic> pushSelectSourcePage({
    Key key,
    @required Map<String, Place> placesMap,
    String email,
    bool byDepartment,
    List<String> citdepart,
    bool disableFilter,
    @required bool editing,
    @required String title,
    String planid,
    bool kidsFilter,
  }) =>
      push<dynamic>(
        Routes.selectSourcePage,
        arguments: SelectSourcePageArguments(
            key: key,
            placesMap: placesMap,
            email: email,
            byDepartment: byDepartment,
            citdepart: citdepart,
            disableFilter: disableFilter,
            editing: editing,
            title: title,
            planid: planid,
            kidsFilter: kidsFilter),
      );

  Future<dynamic> pushSelectDestinationPage({
    Key key,
    String title,
    @required Map<String, Place> placesMap,
    @required String sourcePlace,
    bool byDepartment,
    List<String> citdepart,
    bool disableFilter,
    bool kidsFilter,
    String email,
    String planid,
    LocationData currentLocationData,
    bool editing,
  }) =>
      push<dynamic>(
        Routes.selectDestinationPage,
        arguments: SelectDestinationPageArguments(
            key: key,
            title: title,
            placesMap: placesMap,
            sourcePlace: sourcePlace,
            byDepartment: byDepartment,
            citdepart: citdepart,
            disableFilter: disableFilter,
            kidsFilter: kidsFilter,
            email: email,
            planid: planid,
            currentLocationData: currentLocationData,
            editing: editing),
      );

  Future<dynamic> pushMapPage({
    Key key,
    String planid,
    @required Map<String, Place> places,
    @required String source,
    @required String destination,
    String email,
    bool byDepartment,
    List<String> citdepart,
    bool disableFilter,
    bool kidsFilter,
    bool editing,
    String title,
  }) =>
      push<dynamic>(
        Routes.mapPage,
        arguments: MapPageArguments(
            key: key,
            planid: planid,
            places: places,
            source: source,
            destination: destination,
            email: email,
            byDepartment: byDepartment,
            citdepart: citdepart,
            disableFilter: disableFilter,
            kidsFilter: kidsFilter,
            editing: editing,
            title: title),
      );

  Future<dynamic> pushPlanMap({
    Key key,
    @required Map<String, Place> places,
    @required String source,
    @required String destination,
    @required String planId,
  }) =>
      push<dynamic>(
        Routes.planMap,
        arguments: PlanMapArguments(
            key: key,
            places: places,
            source: source,
            destination: destination,
            planId: planId),
      );

  Future<dynamic> pushEventsDetail({
    Key key,
    Event event,
  }) =>
      push<dynamic>(
        Routes.eventsDetail,
        arguments: EventsDetailArguments(key: key, event: event),
      );

  Future<dynamic> pushPlaceDetail({
    Key key,
    @required Place place,
    @required bool canPost,
  }) =>
      push<dynamic>(
        Routes.placeDetail,
        arguments:
            PlaceDetailArguments(key: key, place: place, canPost: canPost),
      );

  Future<dynamic> pushPlanDetails({
    @required Plan plan,
  }) =>
      push<dynamic>(
        Routes.planDetails,
        arguments: PlanDetailsArguments(plan: plan),
      );

  Future<dynamic> pushGuideProfilePage({
    Key key,
    @required Guide guide,
  }) =>
      push<dynamic>(
        Routes.guideProfilePage,
        arguments: GuideProfilePageArguments(key: key, guide: guide),
      );

  Future<dynamic> pushSearchPage({
    Key key,
    @required String word,
  }) =>
      push<dynamic>(
        Routes.searchPage,
        arguments: SearchPageArguments(key: key, word: word),
      );

  Future<dynamic> pushGuidePlanPage() => push<dynamic>(Routes.guidePlanPage);

  Future<dynamic> pushChatBot({
    Key key,
    String title,
  }) =>
      push<dynamic>(
        Routes.chatBot,
        arguments: ChatBotArguments(key: key, title: title),
      );

  Future<dynamic> pushPlacesResult({
    Key key,
    @required String placeType,
    @required LocationData location,
    @required String language,
  }) =>
      push<dynamic>(
        Routes.placesResult,
        arguments: PlacesResultArguments(
            key: key,
            placeType: placeType,
            location: location,
            language: language),
      );
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// CentralWidget arguments holder class
class CentralWidgetArguments {
  final Key key;
  final int index;
  CentralWidgetArguments({this.key, this.index});
}

/// ProfilePage arguments holder class
class ProfilePageArguments {
  final Key key;
  final LocalDomainUser user;
  ProfilePageArguments({this.key, this.user});
}

/// CardsPage arguments holder class
class CardsPageArguments {
  final Key key;
  final bool byDepartments;
  final List<String> departments;
  final List<String> cities;
  final bool forKidsFilter;
  final bool disabilitiesFilter;
  final int daysAvailable;
  final String email;
  CardsPageArguments(
      {this.key,
      @required this.byDepartments,
      @required this.departments,
      this.cities,
      @required this.forKidsFilter,
      @required this.disabilitiesFilter,
      @required this.daysAvailable,
      this.email});
}

/// SelectSourcePage arguments holder class
class SelectSourcePageArguments {
  final Key key;
  final Map<String, Place> placesMap;
  final String email;
  final bool byDepartment;
  final List<String> citdepart;
  final bool disableFilter;
  final bool editing;
  final String title;
  final String planid;
  final bool kidsFilter;
  SelectSourcePageArguments(
      {this.key,
      @required this.placesMap,
      this.email,
      this.byDepartment,
      this.citdepart,
      this.disableFilter,
      @required this.editing,
      @required this.title,
      this.planid,
      this.kidsFilter});
}

/// SelectDestinationPage arguments holder class
class SelectDestinationPageArguments {
  final Key key;
  final String title;
  final Map<String, Place> placesMap;
  final String sourcePlace;
  final bool byDepartment;
  final List<String> citdepart;
  final bool disableFilter;
  final bool kidsFilter;
  final String email;
  final String planid;
  final LocationData currentLocationData;
  final bool editing;
  SelectDestinationPageArguments(
      {this.key,
      this.title,
      @required this.placesMap,
      @required this.sourcePlace,
      this.byDepartment,
      this.citdepart,
      this.disableFilter,
      this.kidsFilter,
      this.email,
      this.planid,
      this.currentLocationData,
      this.editing});
}

/// MapPage arguments holder class
class MapPageArguments {
  final Key key;
  final String planid;
  final Map<String, Place> places;
  final String source;
  final String destination;
  final String email;
  final bool byDepartment;
  final List<String> citdepart;
  final bool disableFilter;
  final bool kidsFilter;
  final bool editing;
  final String title;
  MapPageArguments(
      {this.key,
      this.planid,
      @required this.places,
      @required this.source,
      @required this.destination,
      this.email,
      this.byDepartment,
      this.citdepart,
      this.disableFilter,
      this.kidsFilter,
      this.editing,
      this.title});
}

/// PlanMap arguments holder class
class PlanMapArguments {
  final Key key;
  final Map<String, Place> places;
  final String source;
  final String destination;
  final String planId;
  PlanMapArguments(
      {this.key,
      @required this.places,
      @required this.source,
      @required this.destination,
      @required this.planId});
}

/// EventsDetail arguments holder class
class EventsDetailArguments {
  final Key key;
  final Event event;
  EventsDetailArguments({this.key, this.event});
}

/// PlaceDetail arguments holder class
class PlaceDetailArguments {
  final Key key;
  final Place place;
  final bool canPost;
  PlaceDetailArguments(
      {this.key, @required this.place, @required this.canPost});
}

/// PlanDetails arguments holder class
class PlanDetailsArguments {
  final Plan plan;
  PlanDetailsArguments({@required this.plan});
}

/// GuideProfilePage arguments holder class
class GuideProfilePageArguments {
  final Key key;
  final Guide guide;
  GuideProfilePageArguments({this.key, @required this.guide});
}

/// SearchPage arguments holder class
class SearchPageArguments {
  final Key key;
  final String word;
  SearchPageArguments({this.key, @required this.word});
}

/// ChatBot arguments holder class
class ChatBotArguments {
  final Key key;
  final String title;
  ChatBotArguments({this.key, this.title});
}

/// PlacesResult arguments holder class
class PlacesResultArguments {
  final Key key;
  final String placeType;
  final LocationData location;
  final String language;
  PlacesResultArguments(
      {this.key,
      @required this.placeType,
      @required this.location,
      @required this.language});
}
