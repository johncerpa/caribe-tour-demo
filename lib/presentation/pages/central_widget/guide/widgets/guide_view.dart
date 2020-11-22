import 'package:caribe_tour/domain/guide/guide.dart';
import 'package:caribe_tour/presentation/flutter_list/filter_list.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import '../../../../constants.dart';
import 'guide_card_widget.dart';

class GuideView extends StatefulWidget {
  final List<Guide> guide;
  const GuideView({Key key, this.guide});
  @override
  _GuideViewState createState() => _GuideViewState();
}

class _GuideViewState extends State<GuideView> {
  List<String> departmentList = [
    "Atlántico",
    "Bolívar",
    "Cesar",
    "Córdoba",
    "La Guajira",
    "Magdalena",
    "Sucre",
  ];

  String word;

  @override
  void initState() {
    super.initState();

    setState(() {
      word = "";
    });
  }

  List<String> selectedDept = [];

  Future<void> openFilterDialog() async {
    await FilterListDialog.display(
      context,
      allTextList: departmentList,
      height: 480,
      headlineText: tr('search_page.dep'),
      searchFieldHintText: tr('search_page.search'),
      selectedTextList: selectedDept,
      applyButonTextBackgroundColor: kSecondaryColor,
      allResetButonColor: kSecondaryColor,
      selectedTextBackgroundColor: kSecondaryColor,
      allText: tr('search_page.all'),
      resetText: tr('search_page.reset'),
      applyText: tr('search_page.apply'),
      hideSelectedTextCount: true,
      onApplyButtonClick: (List<String> list) {
        if (list != null) {
          setState(() {
            selectedDept = List.from(list);
          });
          Navigator.of(context, rootNavigator: true).pop();
        }
      },
    );
  }

  Stream<List<Guide>> guideSearch() async* {
    List<Guide> guides = [];
    if (widget.guide
        .where((element) => element.email.contains(word))
        .toList()
        .isNotEmpty) {
      guides = widget.guide
          .where((element) => element.email.contains(word))
          .toList();
    } else {
      if (widget.guide
          .where((element) =>
              (element.firstName + element.lastName).contains(word))
          .toList()
          .isNotEmpty) {
        guides = widget.guide
            .where((element) =>
                (element.firstName + element.lastName).contains(word))
            .toList();
      } else {
        if (widget.guide
            .where((element) => element.phone.contains(word))
            .toList()
            .isNotEmpty) {
          guides = widget.guide
              .where((element) => element.phone.contains(word))
              .toList();
        }
      }
    }
    print(guides);
    if (selectedDept.isNotEmpty) {
      guides = guides
          .where((element) => selectedDept.contains(element.department))
          .toList();
      print(guides);
    }
    yield guides;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Stack(
            children: [
              Container(
                height: 120,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [kPrimaryColor, kPrimaryDarkerColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 0.9],
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          tr('guide_page.find_a_guide'),
                          style: TextStyle(
                            fontFamily: 'SF Pro Bold',
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: 200,
                          child: Text(
                            tr('guide_page.find_a_guide_body'),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 120,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/images/guide.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 70,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
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
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      hintText: tr('guides.search_by_name'),
                      prefixIcon: Icon(
                        LineAwesomeIcons.user,
                        color: Colors.blueGrey[500],
                      ),
                      hintStyle:
                          TextStyle(fontSize: 15, color: Colors.blueGrey[300]),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.055,
                  child: OutlineButton(
                    onPressed: () async {
                      openFilterDialog();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          tr('guides.filter'),
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                          ),
                        ),
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
            ],
          ),
        ),
        Divider(color: Colors.grey.withOpacity(0.8)),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            tr('guide_page.guides'),
            style: const TextStyle(
              fontFamily: 'SF Pro Bold',
              fontSize: 28,
            ),
          ),
        ),
        Expanded(
            child: StreamBuilder(
          stream: guideSearch(),
          builder: (BuildContext context, AsyncSnapshot<List<Guide>> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.isEmpty) {
                return SingleChildScrollView(
                    child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          tr('guides.guides_not_found'),
                          style: TextStyle(color: Colors.grey),
                        )
                      ]),
                ));
              } else {
                return Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: ListView.separated(
                      padding: EdgeInsets.only(),
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        return GuideCard(guide: snapshot.data[index]);
                      },
                    ));
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
            /* child: */

            )
      ],
    );
  }
}
