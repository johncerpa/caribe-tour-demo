import 'package:caribe_tour/presentation/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final int selectedIndex;

  const AppBarWidget({Key key, this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 1:
        {
          return AppBar(
            elevation: 2,
            iconTheme: appBarIconTheme,
            backgroundColor: Colors.white,
            title: Text(
              tr('plans.my_plans'),
              style: getAppBarTextStyle(context),
            ),
          );
        }
        break;

      case 2:
        {
          return AppBar(
            elevation: 2,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: kSecondaryColor),
            title: Text(
              tr('plans.guides'),
              style: getAppBarTextStyle(context),
            ),
          );
        }
        break;

      default:
        {
          {
            return AppBar(
              elevation: 0,
              title: const Text(
                'Caribe Tour',
                style: TextStyle(fontFamily: 'SF Pro Bold'),
              ),
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.black),
              backgroundColor: Colors.transparent,
            );
          }
        }
    }
  }
}
