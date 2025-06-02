import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static init() async {
    await Hive.initFlutter();
    // register hive adapters
    await openBox();
  }

  static openBox() async {
    // Open Hive boxes
  }
}
