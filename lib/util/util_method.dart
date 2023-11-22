import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Util {
  static Future<void> launchUrlLostArc(String url) async {
    await launchUrl(Uri.parse(url));
  }

  static String dateString(DateTime time) {
    final DateFormat formatDate = DateFormat("yy.MM.dd");
    return formatDate.format(time);
  }
}
