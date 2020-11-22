import 'package:caribe_tour/application/plans/cards/cards_bloc.dart';
import 'package:caribe_tour/injection.dart';
import 'package:caribe_tour/presentation/pages/cards/cards_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsPage extends StatefulWidget {
  final List<String> departments;
  final List<String> cities;
  final bool byDepartments;
  final bool forKidsFilter;
  final bool disabilitiesFilter;
  final int daysAvailable;
  final String email;

  const CardsPage({
    Key key,
    @required this.byDepartments,
    @required this.departments,
    this.cities,
    @required this.forKidsFilter,
    @required this.disabilitiesFilter,
    @required this.daysAvailable,
    this.email,
  }) : super(key: key);

  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        if (widget.byDepartments) {
          return getIt<CardsBloc>()
            ..add(
              CardsEvent.loadingPlacesByDepartments(
                departments: widget.departments,
                kidsFilter: widget.forKidsFilter,
                disabilitiesFilter: widget.disabilitiesFilter,
              ),
            );
        } else {
          return getIt<CardsBloc>()
            ..add(
              CardsEvent.loadingPlacesByDepartmentAndCities(
                department: widget.departments[0],
                cities: widget.cities,
                kidsFilter: widget.forKidsFilter,
                disabilitiesFilter: widget.disabilitiesFilter,
              ),
            );
        }
      },
      child: BlocBuilder<CardsBloc, CardsState>(
        builder: (context, state) {
          return state.places.fold(
            () => const Center(child: CircularProgressIndicator()),
            (a) => CardsView(
                places: state.places.getOrElse(() => []),
                daysAvailable: widget.daysAvailable,
                email: widget.email,
                kidsFilter: widget.forKidsFilter,
                disableFilter: widget.disabilitiesFilter,
                byDepartament: widget.byDepartments,
                citdepart:
                    widget.cities.isEmpty ? widget.departments : widget.cities),
          );
        },
      ),
    );
  }
}
