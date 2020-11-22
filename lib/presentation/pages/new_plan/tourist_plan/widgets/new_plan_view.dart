import 'dart:ui';
import 'package:caribe_tour/domain/plans/dept_and_cities.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/new_plan/tourist_plan/widgets/cities_depts_list.dart';
import 'package:caribe_tour/presentation/pages/new_plan/widgets/new_plan_view_step2.dart';
import 'package:caribe_tour/presentation/shared_widgets/classic_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:transparent_image/transparent_image.dart';

class NewPlanView extends StatefulWidget {
  final List<DeptAndCities> deptsAndCities;

  const NewPlanView({Key key, this.deptsAndCities}) : super(key: key);

  @override
  _NewPlanViewState createState() => _NewPlanViewState();
}

class _NewPlanViewState extends State<NewPlanView> {
  List<DeptAndCities> _deptsAndCities;

  String _departmentSelected;
  String _citySelected;
  int _deptSelectedIndex = 0;

  List<String> departmentsToVisit = [];
  List<String> citiesToVisit = [];

  bool moreDepartments = false;

  GlobalKey<AnimatedListState> departmentsKey;
  GlobalKey<AnimatedListState> citiesKey;

  final daysController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _deptsAndCities = widget.deptsAndCities;
    _departmentSelected = _deptsAndCities[0].departmentName;
    _citySelected = _deptsAndCities[0].cities[0];

    departmentsKey = GlobalKey<AnimatedListState>();
    citiesKey = GlobalKey<AnimatedListState>();
  }

  @override
  void dispose() {
    super.dispose();
    daysController.dispose();
  }

  void clearDepartmentsList() {
    setState(() {
      departmentsKey = GlobalKey<AnimatedListState>();
      departmentsToVisit.clear();
    });
  }

  void clearCitiesList() {
    setState(() {
      citiesKey = GlobalKey<AnimatedListState>();
      citiesToVisit.clear();
    });
  }

  void showDepartmentsView() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              FadeInImage(
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.4,
                placeholder: MemoryImage(kTransparentImage),
                image: const AssetImage(
                  'assets/images/departments.png',
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Departamentos',
                  style: TextStyle(
                    fontFamily: 'SF Pro Bold',
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _deptsAndCities.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final departmentName = _deptsAndCities[index].departmentName;
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();

                        int indexFound = 0;
                        for (int i = 0; i < _deptsAndCities.length; i++) {
                          if (_deptsAndCities[i].departmentName == departmentName) {
                            indexFound = i;
                          }
                        }

                        setState(() {
                          _departmentSelected = departmentName;
                          _deptSelectedIndex = indexFound;
                          _citySelected = _deptsAndCities[indexFound].cities[0];

                          clearCitiesList();

                          if (moreDepartments) {
                            if (!departmentsToVisit.contains(_departmentSelected)) {
                              departmentsKey.currentState.insertItem(
                                departmentsToVisit.length,
                                duration: const Duration(milliseconds: 500),
                              );

                              departmentsToVisit.add(_departmentSelected);
                            }
                          }
                        });
                      },
                      child: Container(
                        color: Colors.white,
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            departmentName,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showCitiesView() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              FadeInImage(
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.3,
                placeholder: MemoryImage(kTransparentImage),
                image: const AssetImage(
                  'assets/images/buildings.png',
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ciudades',
                  style: TextStyle(
                    fontFamily: 'SF Pro Bold',
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _deptsAndCities[_deptSelectedIndex].cities.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final cityName = _deptsAndCities[_deptSelectedIndex].cities[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();

                        setState(() {
                          _citySelected = cityName;

                          if (!citiesToVisit.contains(_citySelected)) {
                            citiesKey.currentState.insertItem(
                              citiesToVisit.length,
                              duration: const Duration(milliseconds: 500),
                            );

                            citiesToVisit.add(_citySelected);

                            if (!citiesToVisit.contains(_citySelected)) {
                              citiesKey.currentState.insertItem(
                                citiesToVisit.length,
                                duration: const Duration(milliseconds: 500),
                              );

                              citiesToVisit.add(_citySelected);
                            }
                          }
                        });
                      },
                      child: Container(
                        color: Colors.white,
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            cityName,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          padding: const EdgeInsets.all(5),
          physics: const BouncingScrollPhysics(),
          children: [
            GestureDetector(
              onTap: () {
                showDepartmentsView();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: kSecondaryColor,
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(1, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    padding: const EdgeInsets.only(),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: const LinearGradient(
                        colors: [kSecondaryColor, kSecondaryDarkerColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 0.9],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: kSecondaryDarkerColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                              ),
                              gradient: LinearGradient(
                                colors: [kSecondaryColor, kSecondaryDarkerColor],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.0, 1],
                              ),
                            ),
                            height: 120,
                            width: 120,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  moreDepartments ? tr('plans.select_departments') : tr('plans.select_department'),
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width * 0.040,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Visibility(
                                visible: !moreDepartments,
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 15,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.0),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 0.80,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            _departmentSelected,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context).size.width * 0.038,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CheckboxListTile(
                                contentPadding: const EdgeInsets.only(),
                                title: Text(
                                  tr('plans.more_than_one_department'),
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width * 0.040,
                                    color: Colors.white,
                                  ),
                                ),
                                value: moreDepartments,
                                onChanged: (value) {
                                  setState(() {
                                    moreDepartments = value;

                                    if (value == false) {
                                      clearDepartmentsList();
                                    } else {
                                      clearCitiesList();
                                    }
                                  });
                                },
                              ),
                              DepartmentsToVisit(
                                moreDepartments: moreDepartments,
                                departmentsToVisit: departmentsToVisit,
                                departmentsKey: departmentsKey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !moreDepartments,
              child: const SizedBox(height: 25),
            ),
            Visibility(
              visible: !moreDepartments,
              child: GestureDetector(
                onTap: () {
                  showCitiesView();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      const BoxShadow(
                        color: kSecondaryColor,
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: Offset(1, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: kPrimaryColor.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 2,
                          ),
                        ],
                        gradient: const LinearGradient(
                          colors: [kSecondaryColor, kSecondaryDarkerColor],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0, 0.9],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: kSecondaryDarkerColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(100),
                                ),
                                gradient: LinearGradient(
                                  colors: [kSecondaryColor, kSecondaryDarkerColor],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0.0, 1],
                                ),
                              ),
                              height: 120,
                              width: 120,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Visibility(
                                    visible: !moreDepartments,
                                    child: Text(
                                      tr('plans.select_city'),
                                      style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.width * 0.040,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                CitiesToVisit(
                                  moreDepartments: moreDepartments,
                                  citiesToVisit: citiesToVisit,
                                  citiesKey: citiesKey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  const BoxShadow(
                    color: kSecondaryColor,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(1, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: const LinearGradient(
                      colors: [kSecondaryColor, kSecondaryDarkerColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 0.9],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: kSecondaryDarkerColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100),
                            ),
                            gradient: LinearGradient(
                              colors: [kSecondaryColor, kSecondaryDarkerColor],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.0, 1],
                            ),
                          ),
                          height: 120,
                          width: 120,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                tr('plans.how_many_days'),
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * 0.040,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey[50],
                                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                                      ),
                                      child: TextField(
                                        keyboardType: const TextInputType.numberWithOptions(),
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.blueGrey[500],
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.all(10),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            borderSide: const BorderSide(color: Colors.white),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            borderSide: const BorderSide(color: Colors.white),
                                          ),
                                          hintText: 'Ej. 1',
                                          prefixIcon: Icon(
                                            Ionicons.ios_calendar,
                                            color: Colors.blueGrey[500],
                                          ),
                                          hintStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.blueGrey[300],
                                          ),
                                        ),
                                        controller: daysController,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      tr('plans.days'),
                                      style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.width * 0.045,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: ClassicButton(
                onPressedFn: () {
                  sendToStep2();
                },
                child: Text(
                  tr('plans.continue'),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendToStep2() {
    if (moreDepartments && departmentsToVisit.isEmpty) {
      FlushbarHelper.createError(
        message: tr('plans.you_must_select_a_department'),
      ).show(context);
      return;
    }

    if (!moreDepartments && citiesToVisit.isEmpty) {
      FlushbarHelper.createError(
        message: tr('plans.you_must_select_a_city'),
      ).show(context);
      return;
    }

    if (daysController.text.isEmpty) {
      FlushbarHelper.createError(
        message: tr('plans.days_cannot_be_empty'),
      ).show(context);
      return;
    }

    if (!moreDepartments) {
      departmentsToVisit = [_departmentSelected];
    }

    Navigator.push(
      context,
      PageTransition(
        child: NewPlanStep2(
          citiesToVisit: citiesToVisit,
          departmentsToVisit: departmentsToVisit,
          byDepartments: moreDepartments,
          daysAvailable: int.parse(daysController.text),
        ),
        type: PageTransitionType.rightToLeft,
      ),
    );
  }
}
