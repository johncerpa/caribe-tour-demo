import 'package:caribe_tour/domain/plans/dept_and_cities.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/flutter_list/filter_list.dart';
import 'package:caribe_tour/presentation/pages/search_page/widgets/place_search.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';

class SearchView extends StatefulWidget {
  final List<Place> place;
  final String word;
  final List<DeptAndCities> depandCit;

  const SearchView({
    Key key,
    @required this.place,
    @required this.word,
    @required this.depandCit,
  });

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchView> {
  List<Place> places;

  final TextEditingController _searchTextController = TextEditingController();
  String word;

  List<String> city = [];
  List<String> department = [];

  List<String> types = [
    tr('cards.beach'),
    tr('cards.park'),
    tr('cards.recreational'),
    tr('cards.cultural'),
    tr('cards.museum'),
    tr('cards.historical'),
    tr('cards.bar'),
  ];

  List<String> schedule = [
    tr('cards.all_day'),
    tr('cards.day-time'),
    tr('cards.night-time'),
  ];

  List<String> selectedTypesList = [];
  List<String> selecteddeptList = [];
  List<String> selectedcitiesList = [];
  List<String> selectedschedulesList = [];

  @override
  void initState() {
    // TODO: implement initState

    setState(() {
      _searchTextController.text = widget.word;
      final List<String> aux = [];

      for (final dep in widget.depandCit) {
        if (dep.departmentName != null) {
          aux.add(dep.departmentName);
        }

        for (final cit in dep.cities) {
          city.add(cit);
        }
      }

      department = aux;
      word = widget.word;
    });
    super.initState();
  }

  List<String> selectedList(int opt) {
    switch (opt) {
      case 1:
        return selectedcitiesList;
      case 2:
        return selecteddeptList;
        break;
      case 3:
        return selectedTypesList;
      case 4:
        return selectedschedulesList;
    }
    return null;
  }

  Future<void> openFilterDialog(
      String headline, int opt1, List<String> listt) async {
    await FilterListDialog.display(
      context,
      allTextList: listt,
      height: 480,
      headlineText: headline,
      searchFieldHintText: tr('search_page.search'),
      selectedTextList: selectedList(opt1),
      applyButonTextBackgroundColor: kSecondaryColor,
      allResetButonColor: kSecondaryColor,
      selectedTextBackgroundColor: kSecondaryColor,
      allText: tr('search_page.all'),
      resetText: tr('search_page.reset'),
      applyText: tr('search_page.apply'),
      hideSelectedTextCount: true,
      onApplyButtonClick: (list) {
        if (list != null) {
          setState(() {
            switch (opt1) {
              case 1:
                selectedcitiesList = List.from(list);

                break;
              case 2:
                selecteddeptList = List.from(list);

                break;
              case 3:
                selectedTypesList = List.from(list);

                break;
              case 4:
                selectedschedulesList = List.from(list);

                break;
              default:
            }
          });
          Navigator.of(context, rootNavigator: true).pop();
        }
      },
    );
  }

  Stream<List<Place>> filterPlaces(String word, String lang) async* {
    List<Place> filteredPlace = [];
    if (widget.place
        .where((element) =>
            element.name.toLowerCase().contains(word.toLowerCase()))
        .toList()
        .isNotEmpty) {
      filteredPlace = widget.place
          .where((element) =>
              element.name.toLowerCase().contains(word.toLowerCase()))
          .toList();
    }
    if (selectedcitiesList.isNotEmpty) {
      filteredPlace = filteredPlace
          .where((element) => selectedcitiesList.contains(element.city))
          .toList();
    }
    if (selectedTypesList.isNotEmpty) {
      filteredPlace = filteredPlace
          .where((element) => selectedTypesList.contains(element.type[lang]))
          .toList();
    }
    if (selectedschedulesList.isNotEmpty) {
      filteredPlace = filteredPlace
          .where((element) =>
              selectedschedulesList.contains(element.schedule[lang]))
          .toList();
    }
    if (selecteddeptList.isNotEmpty) {
      filteredPlace = filteredPlace
          .where(
              (element) => selectedschedulesList.contains(element.department))
          .toList();
    }
    yield filteredPlace;
  }

  @override
  Widget build(BuildContext context) {
    final language = context.locale.languageCode.toLowerCase() == 'es'
        ? 'spanish'
        : 'english';
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        floatingActionButton: BoomMenu(
          foregroundColor: Colors.white,
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          scrollVisible: true,
          overlayColor: Colors.black,
          overlayOpacity: 0.7,
          children: [
            MenuItem(
              child: Icon(Icons.location_city, color: Colors.white),
              title: tr('search_page.filter_by'),
              titleColor: Colors.white,
              subtitle: tr('search_page.city'),
              subTitleColor: Colors.white,
              backgroundColor: kSecondaryDarkerColor,
              onTap: () async {
                openFilterDialog(tr('search_page.city'), 1, city);
              },
            ),
            MenuItem(
              child: Icon(Icons.location_city, color: Colors.white),
              title: tr('search_page.filter_by'),
              titleColor: Colors.white,
              subtitle: tr('search_page.dep'),
              subTitleColor: Colors.white,
              backgroundColor: kSecondaryColor,
              onTap: () async {
                openFilterDialog(tr('search_page.dep'), 2, department);
              },
            ),
            MenuItem(
              child: Icon(Icons.schedule, color: Colors.white),
              title: tr('search_page.filter_by'),
              titleColor: Colors.white,
              subtitle: tr('search_page.schedule'),
              subTitleColor: Colors.white,
              backgroundColor: kPrimaryDarkerColor,
              onTap: () async {
                openFilterDialog(tr('search_page.schedule'), 3, schedule);
              },
            ),
            MenuItem(
              child: Icon(Icons.filter_list, color: Colors.white),
              title: tr('search_page.filter_by'),
              titleColor: Colors.white,
              subtitle: tr('search_page.type'),
              subTitleColor: Colors.white,
              backgroundColor: kPrimaryColor,
              onTap: () async {
                openFilterDialog(tr('search_page.type'), 4, types);
              },
            )
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: appBarIconTheme,
          flexibleSpace: flexibleSpace,
          title: Text(
            tr('search_page.title'),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    word = value;
                  });
                },
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
                  hintText: 'Ej. Parque Tayrona',
                  suffixIcon:
                      GestureDetector(onTap: () {}, child: Icon(Icons.search)),
                  prefixIcon:
                      Icon(Icons.location_on, color: Colors.blueGrey[500]),
                  hintStyle:
                      TextStyle(fontSize: 15, color: Colors.blueGrey[300]),
                ),
                controller: _searchTextController,
              ),
            ),
          ),
          StreamBuilder(
              stream: filterPlaces(word, language),
              builder: (context, AsyncSnapshot<List<Place>> snpashot) {
                if (snpashot.hasData) {
                  if (snpashot.data.isEmpty) {
                    return Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 300,
                              width: 250,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/images/directions.png"))),
                            ),
                            Text(
                              "Oops parece que no pudimos ningun lugar",
                              style: TextStyle(color: Colors.grey),
                            )
                          ]),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snpashot.data.length,
                        itemBuilder: (context, index) {
                          return PlaceSearch(
                            place: snpashot.data[index],
                            lang: language,
                          );
                        },
                      ),
                    );
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
        ]));
  }
}
