import 'package:flutter/widgets.dart';

class ColorsApp {
  static ColorsApp? _instance;
  // Avoid self instance
  ColorsApp._();
  static ColorsApp get i =>
    _instance ??= ColorsApp._();

  Color get primary => const Color(0xFF791435);
  Color get secondary => const Color(0xFFFDCE50);
  Color get yellow => const Color(0xFFFDCE50);
  Color get grey => const Color(0xFFCCCCCC);
  Color get greyDark => const Color(0xFF999999);
}

extension ColorsAppExtension on BuildContext {
  ColorsApp get colorsApp => ColorsApp.i;
}