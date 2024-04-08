import 'package:flutter/widgets.dart';

class ColorUtils {
  static Color lighterColor(Color color, double factor) {
    assert(factor >= 0 && factor <= 1);
    return Color.fromRGBO(
      (color.red + ((255 - color.red) * factor)).round(),
      (color.green + ((255 - color.green) * factor)).round(),
      (color.blue + ((255 - color.blue) * factor)).round(),
      1,
    );
  }
}
