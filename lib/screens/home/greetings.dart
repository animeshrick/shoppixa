import 'package:shoppixa/utils/constants/app_english_text.dart';

class Greetings {
  String generateGreeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour < 12) {
      return AppEnglishText().morning;
    } else if (hour < 17) {
      return AppEnglishText().afternoon;
    } else {
      return AppEnglishText().evening;
    }
  }
}
