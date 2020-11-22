import 'package:caribe_tour/application/auth/auth_bloc.dart';
import 'package:caribe_tour/domain/auth/local_domain_user.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/new_plan/guide_plan/guide_plan.dart';
import 'package:caribe_tour/presentation/pages/profile/profile_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:caribe_tour/presentation/pages/chatbot/chatbot.dart';
import 'package:page_transition/page_transition.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class AppDrawer extends StatelessWidget {
  final LocalDomainUser user;
  const AppDrawer({this.user});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Row(
                  children: [
                    const Icon(
                      LineAwesomeIcons.user,
                      color: kPrimaryColor,
                      size: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        tr('home.sidebar_profile'),
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.040,
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: ProfilePage(
                        user: user,
                      ),
                      type: PageTransitionType.rightToLeft,
                    ),
                  );
                },
              ),
              Visibility(
                visible: user.isGuide,
                child: ListTile(
                  title: Row(
                    children: [
                      const Icon(
                        LineAwesomeIcons.map,
                        color: kPrimaryColor,
                        size: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Plan para turista",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.040,
                          ),
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: GuidePlanPage(),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  },
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    const Icon(
                      LineAwesomeIcons.comment_o,
                      color: kPrimaryColor,
                      size: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Chatbot",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.040,
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: ChatBot(),
                      type: PageTransitionType.rightToLeft,
                    ),
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    const Icon(
                      Icons.exit_to_app,
                      color: kPrimaryColor,
                      size: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        tr('home.sidebar_sign_out'),
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.040,
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  context.bloc<AuthBloc>().add(const AuthEvent.signedOut());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
