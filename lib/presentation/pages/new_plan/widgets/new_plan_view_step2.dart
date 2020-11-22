import 'dart:ui';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/cards/cards_introduction.dart';
import 'package:caribe_tour/presentation/shared_widgets/classic_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class NewPlanStep2 extends StatefulWidget {
  final List<String> citiesToVisit;
  final List<String> departmentsToVisit;
  final bool byDepartments;
  final int daysAvailable;
  final String emailA;

  const NewPlanStep2({
    Key key,
    this.emailA,
    this.citiesToVisit,
    this.departmentsToVisit,
    this.byDepartments,
    this.daysAvailable,
  }) : super(key: key);

  @override
  _NewPlanStep2State createState() => _NewPlanStep2State();
}

class _NewPlanStep2State extends State<NewPlanStep2> {
  bool _kidsQuestionAnswer;
  bool _disabilitiesQuestionAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withAlpha(18),
      appBar: AppBar(
        flexibleSpace: flexibleSpace,
        elevation: 2,
        brightness: Brightness.light,
        iconTheme: appBarIconTheme,
        backgroundColor: Colors.white,
        title: Text(
          tr('plans.new_plan'),
          style: getAppBarTextStyle(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          padding: const EdgeInsets.all(5),
          physics: const BouncingScrollPhysics(),
          children: [
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
                    boxShadow: [
                      BoxShadow(
                        color: kSecondaryColor.withOpacity(0.4),
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
                              child: Text(
                                tr('plans.kids_question'),
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.040,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            _kidsQuestionOptions(),
                          ],
                        ),
                      ),
                    ],
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
                    color: kSecondaryColor.withOpacity(0.6),
                    spreadRadius: 2,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  padding: const EdgeInsets.all(0),
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
                                tr('plans.disabilities_question'),
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            _disabilitiesQuestionOptions(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: ClassicButton(
                onPressedFn: () {
                  sendToCardsPage();
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

  void sendToCardsPage() {
    if (_kidsQuestionAnswer == null || _disabilitiesQuestionAnswer == null) {
      FlushbarHelper.createError(
        message: tr('plans.answer_the_questions_first'),
      ).show(context);
      return;
    }

    Navigator.push(
      context,
      PageTransition(
        child: CardsIntroduction(
            cities: widget.citiesToVisit,
            departments: widget.departmentsToVisit,
            byDepartments: widget.byDepartments,
            forKidsFilter: _kidsQuestionAnswer,
            disabilitiesFilter: _disabilitiesQuestionAnswer,
            daysAvailable: widget.daysAvailable,
            email: widget.emailA),
        type: PageTransitionType.rightToLeft,
      ),
    );
  }

  Widget _kidsQuestionOptions() {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(),
          title: Text(
            tr('plans.yes'),
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.040,
              color: Colors.white,
            ),
          ),
          leading: Radio(
            activeColor: Colors.white,
            value: true,
            groupValue: _kidsQuestionAnswer,
            onChanged: (bool value) {
              setState(() {
                _kidsQuestionAnswer = value;
              });
            },
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(),
          title: Text(
            tr('plans.no'),
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.040,
              color: Colors.white,
            ),
          ),
          leading: Radio(
            activeColor: Colors.white,
            value: false,
            groupValue: _kidsQuestionAnswer,
            onChanged: (bool value) {
              setState(() {
                _kidsQuestionAnswer = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _disabilitiesQuestionOptions() {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(),
          title: Text(
            tr('plans.yes'),
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.040,
              color: Colors.white,
            ),
          ),
          leading: Radio(
            activeColor: Colors.white,
            value: true,
            groupValue: _disabilitiesQuestionAnswer,
            onChanged: (bool value) {
              setState(() {
                _disabilitiesQuestionAnswer = value;
              });
            },
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(),
          title: Text(
            tr('plans.no'),
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.040,
              color: Colors.white,
            ),
          ),
          leading: Radio(
            activeColor: Colors.white,
            value: false,
            groupValue: _disabilitiesQuestionAnswer,
            onChanged: (bool value) {
              setState(() {
                _disabilitiesQuestionAnswer = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
