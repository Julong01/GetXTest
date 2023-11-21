import 'package:url_launcher/url_launcher.dart';

class Util {
  static Future<void> launchUrlLostArc(String url) async {
    await launchUrl(Uri.parse(url));
  }
}
