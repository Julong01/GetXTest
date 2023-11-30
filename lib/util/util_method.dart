import 'package:flutter/material.dart';
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

  static Color gradeColor(String grade) {
    switch (grade) {
      case "에스더":
        return const Color(0xff00ffff);
      case "고대":
        return const Color(0xfff0f8ff);
      case "유물":
        return const Color(0xffff4500);
      case "전설":
        return const Color(0xffffa500);
      case "영웅":
        return const Color(0xff9400d3);
      case "희귀":
        return const Color(0xff1e90ff);
      case "고급":
        return const Color(0xff7fff00);
      case "":
        return Colors.white;
      default:
        return const Color(0xffa9a9a9);
    }
  }

  static Color qualityColor(int quality) {
    if (quality == 100) {
      return const Color(0xffffd700);
    } else if (quality < 100 && quality >= 90) {
      return const Color(0xff9400d3);
    } else if (quality < 90 && quality >= 70) {
      return const Color(0xff1e90ff);
    } else if (quality < 70 && quality >= 30) {
      return const Color(0xff7fff00);
    } else if (quality < 30 && quality >= 10) {
      return Colors.yellow;
    } else if (quality < 10 && quality >= 1) {
      return Colors.red;
    } else if (quality < 0) {
      return Colors.white;
    } else {
      return const Color(0xffa9a9a9);
    }
  }
}
