import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Lang_controller extends GetxController {
  final List locale = [
    {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
    {'name': 'ಕನ್ನಡ', 'locale': const Locale('kn', 'IN')},
    {'name': 'हिंदी', 'locale': const Locale('hi', 'IN')},
    {'name': 'chinese', 'locale': const Locale('cn', 'CN')},
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }
}
