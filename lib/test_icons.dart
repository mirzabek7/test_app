// Place fonts/test.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: test
//      fonts:
//       - asset: fonts/test.ttf
import 'package:flutter/widgets.dart';

class Test {
  Test._();

  static const String _fontFamily = 'test';

  static const IconData calendar = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData cancel = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData stats = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData diary = IconData(0xe903, fontFamily: _fontFamily);
}
