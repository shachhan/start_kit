import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<bool> url(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
      return true;
    } else {
      // throw 'Could not launch $url';
      return false;
    }
  }
}