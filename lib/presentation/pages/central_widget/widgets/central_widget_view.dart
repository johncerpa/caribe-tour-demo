import 'package:caribe_tour/domain/auth/local_domain_user.dart';
import 'package:caribe_tour/presentation/pages/central_widget/guide/guide_page.dart';
import 'package:caribe_tour/presentation/pages/central_widget/home/home_page.dart';
import 'package:caribe_tour/presentation/pages/central_widget/plans/plan_list/plans_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import '../../../constants.dart';

class CentralWidgetView extends StatefulWidget {
  @override
  _CentralWidgetViewState createState() => _CentralWidgetViewState();
  final LocalDomainUser user;
  final int index;
  const CentralWidgetView({
    @required this.user,
    this.index,
  });
}

class _CentralWidgetViewState extends State<CentralWidgetView> {
  List<Widget> _children = [];
  int _selectedIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.index ?? 0;
    pageController = PageController(initialPage: _selectedIndex);

    setState(() {
      _children = [
        HomePage(user: widget.user),
        PlanPage(user: widget.user),
        GuidePage(user: widget.user)
      ];
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      body: PageView(
        physics: const BouncingScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
        children: _children,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 1,
              color: Colors.grey.withOpacity(0.5),
            )
          ],
        ),
        child: BottomNavigationBar(
          onTap: _onItemTapped,
          elevation: 1,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 14,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(LineAwesomeIcons.home),
              title: Text(
                tr('home.navbar_home'),
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            BottomNavigationBarItem(
              icon: const Icon(LineAwesomeIcons.map_o),
              title: Text(
                tr('home.navbar_plans'),
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            BottomNavigationBarItem(
              icon: const Icon(LineAwesomeIcons.group),
              title: Text(
                tr('home.navbar_guides'),
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: kPrimaryColor,
          selectedItemColor: kSecondaryColor,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    });
  }
}
