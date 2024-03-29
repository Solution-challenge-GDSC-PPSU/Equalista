import 'package:equalista/OnboardFiles/onboard._page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'ConsulatantFiles/c_navbar.dart';
import 'Model_service/Globalservices/locale_data.dart';
import 'UserFiles/u_navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      translations: LocaleString(),
      locale: const Locale('en', 'US'),
      theme: ThemeData(useMaterial3: true, primaryColor: Colors.lightBlue),
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null
          ? const Onboardpage()
          : const C_navbar(),
    );
  }
}
