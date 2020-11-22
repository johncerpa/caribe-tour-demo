import 'package:caribe_tour/application/search/searchplaces_bloc.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/search_page/widgets/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../injection.dart';

class SearchPage extends StatefulWidget {
  final String word;

  const SearchPage({
    Key key,
    @required this.word,
  });
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Place> places;

  String word;

  @override
  Widget build(BuildContext context) {
    ;
    // TODO: implement build
    return BlocProvider(
      create: (context) {
        return getIt<SearchplacesBloc>()..add(SearchplacesEvent.searchPlace());
      },
      child: BlocConsumer<SearchplacesBloc, SearchplacesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return state.places.fold(
            () => Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [kPrimaryColor, kPrimaryColor],
                ),
              ),
              child: const Center(
                child: SpinKitFadingCube(color: Colors.white),
              ),
            ),
            (a) => state.depandCities.fold(
              () => Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [kPrimaryColor, kPrimaryColor],
                  ),
                ),
                child: const Center(
                  child: SpinKitFadingCube(color: Colors.white),
                ),
              ),
              (c) => SearchView(
                depandCit: c,
                place: a,
                word: widget.word,
              ),
            ),
          );
        },
      ),
    );
  }
}
