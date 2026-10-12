import 'package:shared_preferences/shared_preferences.dart';

abstract class InitApp {
  static late SharedPreferences sharedPreferences;
  static late bool showOnboarding;

  static Future<void> initApp() async {
    sharedPreferences = await SharedPreferences.getInstance();
    showOnboarding = sharedPreferences.getBool('showOnboarding') ?? true;
  }
}
