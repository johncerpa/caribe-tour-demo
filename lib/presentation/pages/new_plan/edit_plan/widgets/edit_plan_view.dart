import 'package:auto_route/auto_route.dart';
import 'package:caribe_tour/domain/plans/place.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/flutter_list/filter_list.dart';
import 'package:caribe_tour/presentation/pages/cards/widgets/bottom_sheet_widget.dart';
import 'package:caribe_tour/presentation/pages/cards/widgets/information_widgets.dart';
import 'package:caribe_tour/presentation/pages/cards/widgets/tinder_card.dart';
import 'package:caribe_tour/presentation/pages/new_plan/tourist_plan/select_source_page.dart';

import 'package:caribe_tour/presentation/shared_widgets/classic_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:page_transition/page_transition.dart';

class EditPlanView extends StatefulWidget {
  final List<Place> places;
  final int daysAvailable;
  final String email, title, planid;
  final bool kidsFilter, disableFilter, byDepartament;
  final List<String> citdepart;
  final List<String> planPlaces;

  const EditPlanView(
      {Key key,
      @required this.places,
      this.daysAvailable,
      this.planPlaces,
      this.email,
      this.kidsFilter,
      this.disableFilter,
      this.byDepartament,
      this.title,
      this.citdepart,
      this.planid})
      : super(key: key);

  @override
  _EditPlanViewState createState() => _EditPlanViewState();
}

class _EditPlanViewState extends State<EditPlanView> {
  Map<String, Place> placesAddedByUser = {};
  Set<String> placesIgnoredByuser = {};

  bool isSearching = false;
  String searchTerm = "";
  Widget actionIconButton;
  Widget titleWidget;

  int timeLeft;

  @override
  void initState() {
    super.initState();
    setState(() {
      for (var i = 0; i < widget.places.length; i++) {
        if (widget.planPlaces.contains(widget.places[i].id)) {
          final place = widget.places[i];
          placesAddedByUser[place.name] = place;
        }
      }
    });
    timeLeft = widget.daysAvailable * 24;
  }

  List<String> typesList = [
    tr('cards.beach'),
    tr('cards.park'),
    tr('cards.recreational'),
    tr('cards.cultural'),
    tr('cards.museum'),
    tr('cards.historical'),
    tr('cards.bar'),
  ];

  List<String> selectedTypesList = [];

  List<String> schedulesList = [
    tr('cards.all_day'),
    tr('cards.day-time'),
    tr('cards.night-time'),
  ];

  List<String> selectedSchedulesList = [];

  Future<void> _selectFilterOption() async {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text(tr('cards.filters')),
          actions: <Widget>[
            CupertinoActionSheetAction(
              onPressed: () {
                openFilterByTypeDialog();
              },
              child: Text(
                tr('cards.filter_by_type'),
                style: const TextStyle(color: kSecondaryColor),
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                openFilterByScheduleDialog();
              },
              child: Text(
                tr('cards.filter_by_schedule'),
                style: const TextStyle(color: kSecondaryColor),
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {},
            child: Text(
              tr('cards.cancel'),
              style: const TextStyle(color: kSecondaryColor),
            ),
          ),
        );
      },
    );
  }

  Future<void> openFilterByTypeDialog() async {
    await FilterListDialog.display(
      context,
      allTextList: typesList,
      height: 480,
      headlineText: tr('cards.select_types'),
      searchFieldHintText: tr('cards.search'),
      selectedTextList: selectedTypesList,
      applyButonTextBackgroundColor: kSecondaryColor,
      allResetButonColor: kSecondaryColor,
      selectedTextBackgroundColor: kSecondaryColor,
      allText: tr('cards.all'),
      resetText: tr('cards.reset'),
      applyText: tr('cards.apply'),
      hideSelectedTextCount: true,
      onApplyButtonClick: (list) {
        if (list != null) {
          setState(() {
            selectedTypesList = List.from(list);
          });
          Navigator.of(context, rootNavigator: true).pop();
        }
      },
    );
  }

  Future<void> openFilterByScheduleDialog() async {
    await FilterListDialog.display(
      context,
      allTextList: schedulesList,
      height: 480,
      headlineText: tr('cards.select_schedules'),
      searchFieldHintText: tr('cards.search'),
      selectedTextList: selectedSchedulesList,
      applyButonTextBackgroundColor: kSecondaryColor,
      allResetButonColor: kSecondaryColor,
      selectedTextBackgroundColor: kSecondaryColor,
      allText: tr('cards.all'),
      resetText: tr('cards.reset'),
      applyText: tr('cards.apply'),
      hideSelectedTextCount: true,
      onApplyButtonClick: (list) {
        if (list != null) {
          setState(() {
            selectedSchedulesList = List.from(list);
          });
          Navigator.of(context, rootNavigator: true).pop();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 2,
        iconTheme: appBarIconTheme,
        titleSpacing: 0,
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-5, 0),
                end: const Offset(0, 0),
              ).animate(animation),
              child: child,
            );
          },
          child: titleWidget ??
              Text(
                tr('cards.places_selection'),
                style: getAppBarTextStyle(context),
              ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 5),
            child: GestureDetector(
              onTap: () {
                if (isSearching) {
                  setState(() {
                    isSearching = false;
                    searchTerm = "";
                    actionIconButton = const Icon(
                      Ionicons.ios_search,
                      key: ValueKey<int>(1),
                    );

                    titleWidget = Text(
                      tr('cards.places_selection'),
                      style: getAppBarTextStyle(context),
                    );
                  });
                } else {
                  setState(() {
                    isSearching = true;
                    actionIconButton = const Icon(
                      Icons.cancel,
                      key: ValueKey<int>(0),
                    );

                    titleWidget = TextField(
                      onChanged: (value) {
                        setState(() {
                          searchTerm = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: tr('cards.search_for_a_place'),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                    );
                  });
                }
              },
              child: AnimatedSwitcher(
                transitionBuilder: (child, animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                duration: const Duration(milliseconds: 500),
                child: actionIconButton ??
                    const Icon(
                      Ionicons.ios_search,
                      key: ValueKey<int>(1),
                    ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
        child: Stack(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Center(
                  child: Column(
                    children: [
                      const SwipeInformation(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      _buildCards(
                        context,
                        widget.places,
                        selectedTypesList,
                        selectedSchedulesList,
                        searchTerm,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: SizedBox(
                      width: 100,
                      child: OutlineButton(
                        onPressed: _selectFilterOption,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(tr('cards.filter')),
                            const SizedBox(width: 5),
                            const Icon(
                              FlutterIcons.settings_oct,
                              size: 20,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Center(
                  child: ContinueButtonWidget(
                      kidsFilter: widget.kidsFilter,
                      disableFilter: widget.disableFilter,
                      byDepartament: widget.byDepartament,
                      citdepart: widget.citdepart,
                      placesAddedByUser: placesAddedByUser,
                      email: widget.email,
                      editing: true,
                      title: widget.title,
                      planid: widget.planid),
                ),
              ],
            ),
            BottomSheetWidget(
              placesAddedByUser: placesAddedByUser,
              placesIgnoredByUser: placesIgnoredByuser,
            ),
          ],
        ),
      ),
    );
  }

  void updateState(List<Place> listToUpdate, int index) {
    setState(() {
      final newPlace = listToUpdate[index];
      placesAddedByUser[newPlace.name] = newPlace;
    });
  }

  Widget _buildCards(
    BuildContext context,
    List<Place> places,
    List<String> selectedTypesList,
    List<String> selectedSchedulesList,
    String searchTerm,
  ) {
    return FutureBuilder(
      future: _getPlacesFiltered(
        places,
        selectedTypesList,
        selectedSchedulesList,
        searchTerm,
      ),
      builder: (context, AsyncSnapshot<List<Place>> snapshot) {
        if (snapshot.hasData) {
          return _cardsWidget(snapshot.data);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget _cardsWidget(List<Place> placesNotAdded) {
    if (placesNotAdded.isEmpty) {
      return const NoMorePlacesAvailableWidget();
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: TinderSwapCard(
        totalNum: placesNotAdded.length,
        minWidth: MediaQuery.of(context).size.width * 0.85,
        maxWidth: MediaQuery.of(context).size.width * 0.95,
        minHeight: MediaQuery.of(context).size.height * 0.45,
        maxHeight: MediaQuery.of(context).size.height * 0.55,
        swipeEdge: 4,
        cardBuilder: (context, index) {
          if (index < placesNotAdded.length) {
            return TinderCard(place: placesNotAdded[index]);
          } else {
            return const NoMorePlacesAvailableWidget();
          }
        },
        allowVerticalMovement: false,
        swipeUpdateCallback: (
          DragUpdateDetails details,
          Alignment align,
        ) {},
        swipeCompleteCallback: (
          CardSwipeOrientation orientation,
          int index,
        ) {
          if (orientation == CardSwipeOrientation.RIGHT) {
            switch (placesNotAdded[index].type['english']) {
              case 'Park':
                {
                  timeLeft -= 3;
                }
                break;
              case 'Beach':
                {
                  timeLeft -= 5;
                }
                break;
              case 'Recreational':
                {
                  timeLeft -= 2;
                }
                break;
              case 'Cultural':
                {
                  timeLeft -= 2;
                }
                break;
              case 'Historical':
                {
                  timeLeft -= 3;
                }
                break;
              case 'Museum':
                {
                  timeLeft -= 2;
                }
                break;
              case 'Bar':
                {
                  timeLeft -= 4;
                }
                break;
            }

            if (timeLeft >= 0) {
              setState(() {
                final newPlace = placesNotAdded[index];
                placesAddedByUser[newPlace.name] = newPlace;
              });

              FlushbarHelper.createSuccess(
                message: tr('cards.place_has_been_added'),
                duration: const Duration(seconds: 1),
              ).show(context);
            } else {
              FlushbarHelper.createInformation(
                message: tr('cards.stay_time_is_not_enough'),
              ).show(context);
            }
          } else if (orientation == CardSwipeOrientation.LEFT) {
            setState(() {
              placesIgnoredByuser.add(placesNotAdded[index].name);
            });
          }
        },
      ),
    );
  }

  Future<List<Place>> _getPlacesFiltered(
    List<Place> places,
    List<String> selectedTypesList,
    List<String> selectedSchedulesList,
    String searchTerm,
  ) async {
    final language = context.locale.languageCode.toLowerCase() == 'es'
        ? 'spanish'
        : 'english';

    final List<Place> filteredPlaces = [];

    if (searchTerm.isNotEmpty) {
      for (final place in places) {
        if (place.name.toLowerCase().contains(searchTerm.toLowerCase())) {
          filteredPlaces.add(place);
        }
      }
      return filteredPlaces;
    }

    for (final place in places) {
      final bool isNotAdded = !placesAddedByUser.containsKey(place.name);
      final bool isNotIgnored = !placesIgnoredByuser.contains(place.name);

      if (isNotAdded && isNotIgnored) {
        final bool isTypeInFilter =
            selectedTypesList.contains(place.type[language]) ||
                selectedTypesList.isEmpty;

        final bool isScheduleInFilter =
            selectedSchedulesList.contains(place.schedule[language]) ||
                selectedSchedulesList.isEmpty;

        final bool isSelectedTypesFullOrEmpty =
            selectedTypesList.length == typesList.length ||
                selectedTypesList.isEmpty;

        final bool isSelectedSchedulesFullOrEmpty =
            selectedSchedulesList.length == schedulesList.length ||
                selectedSchedulesList.isEmpty;

        if (isTypeInFilter && isScheduleInFilter) {
          filteredPlaces.add(place);
        } else if (isSelectedSchedulesFullOrEmpty &&
            isSelectedTypesFullOrEmpty) {
          filteredPlaces.add(place);
        }
      }
    }

    return filteredPlaces;
  }
}

class ContinueButtonWidget extends StatelessWidget {
  final String email, title, planid;
  final bool kidsFilter, disableFilter, byDepartament, editing;
  final List<String> citdepart;
  const ContinueButtonWidget(
      {Key key,
      @required this.placesAddedByUser,
      @required this.editing,
      this.email,
      @required this.kidsFilter,
      this.disableFilter,
      this.byDepartament,
      this.title,
      this.citdepart,
      this.planid})
      : super(key: key);

  final Map<String, Place> placesAddedByUser;

  @override
  Widget build(BuildContext context) {
    return ClassicButton(
      colors: const [kSecondaryColor, kSecondaryDarkerColor],
      onPressedFn: () {
        if (placesAddedByUser.isNotEmpty) {
          Navigator.push(
            context,
            PageTransition(
              child: SelectSourcePage(
                  email: email,
                  placesMap: placesAddedByUser,
                  kidsFilter: kidsFilter,
                  disableFilter: disableFilter,
                  byDepartment: byDepartament,
                  citdepart: citdepart,
                  editing: true,
                  title: title,
                  planid: planid),
              type: PageTransitionType.rightToLeft,
            ),
          );
        } else {
          FlushbarHelper.createError(
            message: tr('cards.you_must_select_some_places'),
          ).show(context);
        }
      },
      child: Text(
        tr('cards.continue'),
        style: TextStyle(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.width * 0.04,
        ),
      ),
    );
  }
}
