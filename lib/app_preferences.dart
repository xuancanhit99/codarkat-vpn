import 'package:hive_flutter/hive_flutter.dart';

class AppPreferences {
  static late Box boxOfData;
  static Future<void> initHive() async {
    await Hive.initFlutter();
    boxOfData = await Hive.openBox('data');
  }

  // Saving user data chosen theme
  static bool get isDarkMode => boxOfData.get('isDarkMode', defaultValue: false);
  static set isDarkMode(bool value) => boxOfData.put('isDarkMode', value);
}