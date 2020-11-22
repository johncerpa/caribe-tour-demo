import 'package:caribe_tour/presentation/constants.dart';
import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const InformationCard({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Icon(icon, color: kPrimaryColor, size: 28),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kSecondaryColor,
                    ),
                  ),
                  Text(subtitle),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
