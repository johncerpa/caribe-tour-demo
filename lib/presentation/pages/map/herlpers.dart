import 'dart:math';

double calculateDistance(
  double lat1,
  double long1,
  double lat2,
  double long2,
) {
  const R = 6371e3;

  final double omg1 = lat1 * pi / 180;
  final double omg2 = lat2 * pi / 180;

  final double deltaomg = (lat2 - lat1) * pi / 180;
  final double deltalambda = (long2 - long1) * pi / 180;

  final double a = sin(deltaomg / 2) * sin(deltaomg / 2) +
      cos(omg1) * cos(omg2) * sin(deltalambda / 2) * sin(deltalambda / 2);

  final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  return R * c;
}
