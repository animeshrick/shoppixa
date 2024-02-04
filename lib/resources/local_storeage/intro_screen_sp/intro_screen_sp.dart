import 'package:shared_preferences/shared_preferences.dart';

class IntroScreenSp {

  final introScreen = 'introScreen';

  Future<void> init() async {
    await SharedPreferences.getInstance();
  }

  Future<void> clearIntroScreenSp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(introScreen);
  }

  void saveIntroScreen(bool introScreenData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(introScreen, introScreenData);
  }

  Future<bool?> getIntroScreen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? _introScreenData = prefs.getBool(introScreen);
    return _introScreenData;
  }
}