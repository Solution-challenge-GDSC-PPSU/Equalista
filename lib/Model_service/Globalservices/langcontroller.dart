import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Lang_controller extends GetxController {
  final List locale = [
    {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
    {'name': 'ಕನ್ನಡ', 'locale': const Locale('kn', 'IN')},
    {'name': 'हिंदी', 'locale': const Locale('hi', 'IN')},
    {'name': '中国人', 'locale': const Locale('cn', 'CN')},
    {'name': '한국인', 'locale': const Locale('kor', 'KOR')},
    {'name': 'française', 'locale': const Locale('fr', 'FR')},
    {'name': 'italiana', 'locale': const Locale('it', 'IT')},
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }
}
