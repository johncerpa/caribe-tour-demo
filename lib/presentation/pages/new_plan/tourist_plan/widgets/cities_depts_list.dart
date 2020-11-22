import 'package:caribe_tour/presentation/constants.dart';
import 'package:flutter/material.dart';

class DepartmentsToVisit extends StatelessWidget {
  const DepartmentsToVisit({
    Key key,
    @required this.moreDepartments,
    @required this.departmentsToVisit,
    @required this.departmentsKey,
  }) : super(key: key);

  final bool moreDepartments;
  final List<String> departmentsToVisit;
  final GlobalKey<AnimatedListState> departmentsKey;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: moreDepartments,
      child: SizedBox(
        height: departmentsToVisit.isEmpty ? 0 : 50,
        child: AnimatedList(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          key: departmentsKey,
          scrollDirection: Axis.horizontal,
          initialItemCount: departmentsToVisit.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index, animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-5, 0),
                end: const Offset(0, 0),
              ).animate(animation),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                        colors: [
                          kPrimaryColor,
                          kPrimaryDarkerColor,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 1],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: kPrimaryColor,
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(1, 2),
                        )
                      ],
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_city,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            departmentsToVisit[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width * 0.030,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CitiesToVisit extends StatelessWidget {
  const CitiesToVisit({
    Key key,
    @required this.moreDepartments,
    @required this.citiesToVisit,
    @required this.citiesKey,
  }) : super(key: key);

  final bool moreDepartments;
  final List<String> citiesToVisit;
  final GlobalKey<AnimatedListState> citiesKey;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !moreDepartments,
      child: SizedBox(
        height: citiesToVisit.isEmpty ? 0 : 50,
        child: AnimatedList(
          key: citiesKey,
          scrollDirection: Axis.horizontal,
          initialItemCount: citiesToVisit.length,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index, animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-5, 0),
                end: const Offset(0, 0),
              ).animate(animation),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          kPrimaryColor,
                          kPrimaryDarkerColor,
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.5, 0.0),
                        stops: [0.0, 1.0],
                      ),
                      //color: const Color.fromARGB(255, 64, 168, 196),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: kPrimaryColor,
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(1, 2),
                        )
                      ],
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_city,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            citiesToVisit[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width * 0.030,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
