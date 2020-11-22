// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'application/plans/areas/areas_bloc.dart';
import 'application/auth/auth_bloc.dart';
import 'application/plans/cards/cards_bloc.dart';
import 'application/home/carousel/carousel_bloc.dart';
import 'application/home/event/event_bloc.dart';
import 'infrastructure/event/event_repository.dart';
import 'infrastructure/auth/firebase_auth_facade.dart';
import 'infrastructure/core/firebase_injectable_module.dart';
import 'application/place_detail/gallery/gallery_bloc.dart';
import 'infrastructure/gallery/gallery_repository.dart';
import 'application/guide/guide_bloc.dart';
import 'application/guid_plan/guide_plan_bloc.dart';
import 'infrastructure/guide/guide.dart';
import 'domain/auth/interfaces/i_auth_facade.dart';
import 'domain/event/interfaces/i_event.repository.dart';
import 'domain/post/interfaces/i_gallery_repository.dart';
import 'domain/guide/interfaces/i_guides.repository.dart';
import 'domain/plans/interfaces/i_locations_repository.dart';
import 'domain/plans/interfaces/i_plans_repository.dart';
import 'domain/post/interfaces/i_reviews_repository.dart';
import 'domain/auth/interfaces/i_user_repository.dart';
import 'infrastructure/locations/locations_repository.dart';
import 'application/plans/map/map_bloc.dart';
import 'application/place_detail/place_search/place_photo_bloc/place_photo_bloc.dart';
import 'application/place_detail/place_search/place_search_bloc.dart';
import 'application/plan/plan_detail_bloc.dart';
import 'application/plan_detail/plan_details/plan_details_bloc.dart';
import 'application/plans/plan_map/plan_map_bloc.dart';
import 'application/plan_detail/plan_places_bloc.dart';
import 'application/plans/plans/plans_bloc.dart';
import 'infrastructure/plans/plans_repository.dart';
import 'application/home/popular_places/popular_places_bloc.dart';
import 'application/profile/profile_bloc.dart';
import 'application/auth/register_form/register_form_bloc.dart';
import 'application/place_detail/review_comment/review_bloc.dart';
import 'infrastructure/reviews/reviews_repository.dart';
import 'application/search/searchplaces_bloc.dart';
import 'application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'infrastructure/auth/user_repository.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<FirebaseAuth>(() => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<FirebaseFirestore>(() => firebaseInjectableModule.firestore);
  gh.lazySingleton<FirebaseStorage>(() => firebaseInjectableModule.storage);
  gh.lazySingleton<GoogleSignIn>(() => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<IAuthFacade>(
      () => FirebaseAuthFacade(get<FirebaseAuth>(), get<GoogleSignIn>()));
  gh.lazySingleton<IEventRepository>(
      () => EventRepository(get<FirebaseFirestore>()));
  gh.lazySingleton<IGalleryRepository>(() =>
      GalleryRepository(get<FirebaseFirestore>(), get<FirebaseStorage>()));
  gh.lazySingleton<IGuidesRepositry>(
      () => GuideRepository(get<FirebaseFirestore>(), get<FirebaseStorage>()));
  gh.lazySingleton<ILocationsRepository>(() =>
      LocationsRepository(get<FirebaseFirestore>(), get<FirebaseStorage>()));
  gh.lazySingleton<IPlansRepository>(
      () => PlansRepository(get<FirebaseFirestore>()));
  gh.lazySingleton<IReviewsRepository>(() =>
      ReviewsRepository(get<FirebaseFirestore>(), get<FirebaseStorage>()));
  gh.lazySingleton<IUserRepository>(() => UserRepository(
        get<FirebaseFirestore>(),
        get<FirebaseStorage>(),
        get<FirebaseAuth>(),
      ));
  gh.factory<MapBloc>(() => MapBloc(get<IPlansRepository>()));
  gh.factory<PlacePhotoBloc>(() => PlacePhotoBloc());
  gh.factory<PlaceSearchBloc>(() => PlaceSearchBloc());
  gh.factory<PlanDetailBloc>(() => PlanDetailBloc(get<IPlansRepository>()));
  gh.factory<PlanDetailsBloc>(() => PlanDetailsBloc(get<IPlansRepository>()));
  gh.factory<PlanMapBloc>(() => PlanMapBloc(get<IPlansRepository>()));
  gh.factory<PlanPlacesBloc>(() =>
      PlanPlacesBloc(get<ILocationsRepository>(), get<IPlansRepository>()));
  gh.factory<PlansBloc>(() => PlansBloc(get<IPlansRepository>()));
  gh.factory<PopularPlacesBloc>(
      () => PopularPlacesBloc(get<ILocationsRepository>()));
  gh.factory<ProfileBloc>(() => ProfileBloc(get<IUserRepository>()));
  gh.factory<RegisterFormBloc>(
      () => RegisterFormBloc(get<IAuthFacade>(), get<IUserRepository>()));
  gh.factory<ReviewBloc>(() => ReviewBloc(get<IReviewsRepository>()));
  gh.factory<SearchplacesBloc>(
      () => SearchplacesBloc(get<ILocationsRepository>()));
  gh.factory<SignInFormBloc>(() => SignInFormBloc(get<IAuthFacade>()));
  gh.factory<AreasBloc>(() => AreasBloc(get<ILocationsRepository>()));
  gh.factory<AuthBloc>(() => AuthBloc(get<IAuthFacade>()));
  gh.factory<CardsBloc>(() => CardsBloc(get<ILocationsRepository>()));
  gh.factory<CarouselBloc>(() => CarouselBloc(get<ILocationsRepository>()));
  gh.factory<EventBloc>(() => EventBloc(get<IEventRepository>()));
  gh.factory<GalleryBloc>(() => GalleryBloc(get<IGalleryRepository>()));
  gh.factory<GuideBloc>(() => GuideBloc(get<IGuidesRepositry>()));
  gh.factory<GuidePlanBloc>(
      () => GuidePlanBloc(get<IUserRepository>(), get<ILocationsRepository>()));
  return get;
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}
