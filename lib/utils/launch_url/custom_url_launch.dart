import 'package:shoppixa/utils/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomUrlLaunch {
  static Future<void> launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(url);
    } else {
      AppLog.e('Could not launch $url');
      throw 'Could not launch $url';
    }
  }
}
