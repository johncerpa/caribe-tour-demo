import 'package:caribe_tour/domain/auth/local_domain_user.dart';
import 'package:caribe_tour/domain/plans/dept_and_cities.dart';
import 'package:caribe_tour/presentation/pages/new_plan/tourist_plan/widgets/cities_depts_list.dart';
import 'package:caribe_tour/presentation/pages/new_plan/widgets/new_plan_view_step2.dart';
import 'package:caribe_tour/presentation/shared_widgets/classic_button.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../constants.dart';

class GuideView extends StatefulWidget {
  final List<LocalDomainUser> tourist;
  final List<DeptAndCities> depandCit;

  const GuideView({Key key, this.tourist, this.depandCit});

  _GuideViewState createState() => _GuideViewState();
}

class _GuideViewState extends State<GuideView> {
  final TextEditingController _searchTextController = TextEditingController();
  List<DeptAndCities> _deptsAndCities;

  String _departmentSelected;
  String _citySelected;
  int _deptSelectedIndex = 0;

  List<String> departmentsToVisit = [];
  List<String> citiesToVisit = [];
  bool moreDepartments = false;
  bool _kidsQuestionAnswer;
  bool _disabilitiesQuestionAnswer;
  final daysController = TextEditingController();

  GlobalKey<AnimatedListState> departmentsKey;
  GlobalKey<AnimatedListState> citiesKey;
  @override
  void initState() {
    super.initState();
    _deptsAndCities = widget.depandCit;
    _departmentSelected = _deptsAndCities[0].departmentName;
    _citySelected = _deptsAndCities[0].cities[0];

    departmentsKey = GlobalKey<AnimatedListState>();
    citiesKey = GlobalKey<AnimatedListState>();
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

  @override
  void dispose() {
    super.dispose();
    daysController.dispose();
    _searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          iconTheme: appBarIconTheme,
          flexibleSpace: flexibleSpace,
          title: Text(
            tr('plans.new_plan'),
            style: getAppBarTextStyle(context),
          ),
        ),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(children: [
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Correo del turista",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 15),
                color: Colors.blueGrey[50],
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _searchTextController,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.blueGrey[500],
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.blueGrey[400],
                      contentPadding: const EdgeInsets.all(10),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      hintText: "Correo",
                      prefixIcon: Icon(
                        Icons.people,
                        color: Colors.blueGrey[600],
                        size: 15,
                      ),
                    ),
                  ),
                  itemBuilder: (BuildContext context, LocalDomainUser itemData) {
                    return Container(
                        child: ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill, image: NetworkImage(itemData.profileImageUrl.toString()))),
                      ),
                      title: Text('${itemData.firstName.getOrCrash()} ${itemData.lastName.getOrCrash()}'),
                      subtitle: Text(itemData.email.getOrCrash()),
                    ));
                  },
                  onSuggestionSelected: (LocalDomainUser suggestion) {
                    _searchTextController.text = suggestion.email.getOrCrash();
                  },
                  suggestionsCallback: (String pattern) async {
                    return await getSuggestions(pattern);
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
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
                                  tr('plans.select_department'),
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width * 0.040,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.5,
                                    padding: const EdgeInsets.symmetric(horizontal: 18),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 0.80,
                                      ),
                                    ),
                                    child: DropdownButton(
                                      isExpanded: true,
                                      underline: const SizedBox(),
                                      dropdownColor: kPrimaryColor,
                                      icon: const Icon(
                                        LineAwesomeIcons.map_marker,
                                        color: Colors.white,
                                      ),
                                      value: _departmentSelected,
                                      items: _deptsAndCities
                                          .map(
                                            (deptAndCities) => DropdownMenuItem(
                                              value: deptAndCities.departmentName,
                                              child: Text(
                                                deptAndCities.departmentName,
                                                style: TextStyle(
                                                  fontSize: MediaQuery.of(context).size.width * 0.035,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (String value) {
                                        int indexFound = 0;
                                        for (int i = 0; i < _deptsAndCities.length; i++) {
                                          if (_deptsAndCities[i].departmentName == value) {
                                            indexFound = i;
                                          }
                                        }

                                        setState(() {
                                          _departmentSelected = value;
                                          _deptSelectedIndex = indexFound;
                                          _citySelected = _deptsAndCities[indexFound].cities[0];

                                          clearCitiesList();
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Visibility(
                                    visible: moreDepartments,
                                    child: ClassicButton(
                                      width: MediaQuery.of(context).size.width * 0.25,
                                      height: 50,
                                      onPressedFn: () {
                                        setState(() {
                                          if (!departmentsToVisit.contains(_departmentSelected)) {
                                            departmentsKey.currentState.insertItem(
                                              departmentsToVisit.length,
                                              duration: const Duration(milliseconds: 500),
                                            );

                                            departmentsToVisit.add(_departmentSelected);
                                          }
                                        });
                                      },
                                      child: Text(
                                        tr('plans.select'),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context).size.width * 0.030,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
              const SizedBox(height: 25),
              Visibility(
                visible: !moreDepartments,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
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
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.5,
                                        padding: const EdgeInsets.symmetric(horizontal: 15),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15.0),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 0.80,
                                          ),
                                        ),
                                        child: DropdownButton(
                                          underline: const SizedBox(),
                                          isExpanded: true,
                                          icon: const Icon(
                                            LineAwesomeIcons.building,
                                            color: Colors.white,
                                          ),
                                          dropdownColor: kPrimaryColor,
                                          value: _citySelected,
                                          items: _deptsAndCities[_deptSelectedIndex]
                                              .cities
                                              .map(
                                                (city) => DropdownMenuItem(
                                                  value: city,
                                                  child: Text(
                                                    city,
                                                    style: TextStyle(
                                                      fontSize: MediaQuery.of(context).size.width * 0.035,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                          onChanged: (String value) {
                                            setState(() {
                                              _citySelected = value;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      ClassicButton(
                                        width: MediaQuery.of(context).size.width * 0.25,
                                        onPressedFn: () {
                                          setState(() {
                                            if (!citiesToVisit.contains(_citySelected)) {
                                              citiesKey.currentState.insertItem(
                                                citiesToVisit.length,
                                                duration: const Duration(milliseconds: 500),
                                              );

                                              citiesToVisit.add(_citySelected);
                                            }
                                          });
                                        },
                                        child: Text(
                                          tr('plans.select'),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context).size.width * 0.030,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
              const SizedBox(height: 25),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
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
                                    fontSize: MediaQuery.of(context).size.width * 0.045,
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
              )
            ])));
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
    if (_searchTextController.text.isEmpty) {
      FlushbarHelper.createError(
        message: ("You must type an email"),
      ).show(context);
      return;
    }
    if (widget.tourist
        .where((element) => element.email.getOrCrash().contains(_searchTextController.text))
        .toList()
        .isEmpty) {
      FlushbarHelper.createError(
        message: ("This email does not exist"),
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
          emailA: _searchTextController.text,
        ),
        type: PageTransitionType.rightToLeft,
      ),
    );
  }

  List<LocalDomainUser> getSuggestions(String query) {
    List<LocalDomainUser> filteredList = [];
    if (query.isNotEmpty) {
      final aux = widget.tourist.where((element) => element.email.getOrCrash().contains(query)).toList();
      if (aux.isNotEmpty) {
        filteredList = aux;
      }
    }
    return filteredList;
  }
}
