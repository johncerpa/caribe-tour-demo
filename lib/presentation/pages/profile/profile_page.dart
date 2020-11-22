import 'package:caribe_tour/domain/auth/local_domain_user.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/pages/profile/widgets/profile_information_view.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final LocalDomainUser user;
  const ProfilePage({Key key, this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey.withAlpha(18),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ProfileInformation(domainUser: user),
    );
  }
}
