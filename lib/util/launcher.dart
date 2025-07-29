import 'package:url_launcher/url_launcher.dart';
import 'logger.dart';

class UrlLauncher {
  static Future<bool> url(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      // logger.d('launch');
      await launchUrl(Uri.parse(url));
      return true;
    } else {
      // throw 'Could not launch $url';
      // logger.d('cannot launch!');
      return false;
    }
  }
}