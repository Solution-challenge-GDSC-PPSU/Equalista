import 'package:equalista/SignupFiles/role_selectpage.dart';
import 'package:equalista/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Role_Selectpage(),
    );
  }
}
