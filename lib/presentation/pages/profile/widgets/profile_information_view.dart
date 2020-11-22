import 'package:caribe_tour/domain/auth/local_domain_user.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:transparent_image/transparent_image.dart';
import 'information_card_widget.dart';

class ProfileInformation extends StatelessWidget {
  final LocalDomainUser domainUser;

  ImageProvider<dynamic> _buildImage(String profileImageUrl) {
    if (profileImageUrl != null) {
      return NetworkImage(profileImageUrl);
    } else {
      return const AssetImage(
        'assets/images/profile_placeholder.jpeg',
      );
    }
  }

  const ProfileInformation({
    Key key,
    @required this.domainUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    final formatter = DateFormat('yyyy-MM-dd');
    final formattedDate = formatter.format(domainUser.birthday);

    return Column(
      children: [
        Stack(
          children: [
            Container(
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/profile_screen.jpg"),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: [
                    Container(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 3, color: Colors.white),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: const Offset(2, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: FadeInImage(
                                fit: BoxFit.cover,
                                placeholder: MemoryImage(kTransparentImage),
                                image: _buildImage(
                                  domainUser.profileImageUrl?.toString(),
                                ),
                                height: 225,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          '${domainUser.firstName.getOrCrash()} ${domainUser.lastName.getOrCrash()}',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ],
        ),
        Expanded(
          child: Stack(
            children: [
              Container(color: kPrimaryColor),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 6,
                      spreadRadius: 3,
                    )
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 25.0, left: 15, right: 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          bottom: 10,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            tr('profile.information'),
                            style: TextStyle(
                              fontFamily: 'SF Pro Bold',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.065,
                            ),
                          ),
                        ),
                      ),
                      InformationCard(
                        icon: LineAwesomeIcons.envelope_o,
                        title: tr('profile.email'),
                        subtitle: domainUser.email.getOrCrash(),
                      ),
                      const SizedBox(height: 20),
                      InformationCard(
                        icon: LineAwesomeIcons.user,
                        title: tr('profile.gender'),
                        subtitle: domainUser.gender.getOrCrash() == 'Male'
                            ? tr('profile.male')
                            : tr('profile.female'),
                      ),
                      const SizedBox(height: 20),
                      InformationCard(
                        icon: LineAwesomeIcons.calendar_o,
                        title: tr('profile.birthday'),
                        subtitle: formattedDate,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
