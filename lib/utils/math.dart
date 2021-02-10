import 'dart:math';

double dobuleToPlaces(double val, int places) {
  double mod = pow(10.0, places);
  return ((val * mod).round().toDouble() / mod);
}
