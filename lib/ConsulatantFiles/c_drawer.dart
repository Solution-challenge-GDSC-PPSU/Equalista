import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Model_service/Globalservices/firebase_helper.dart';
import '../OnboardFiles/onboard._page.dart';

class C_drawer extends StatefulWidget {
  const C_drawer({super.key});

  @override
  State<C_drawer> createState() => _C_drawerState();
}

class _C_drawerState extends State<C_drawer> {
  static final GoogleSignIn googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text("Equalista"),
            ),
            ListTile(
              title: const Text("Home"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Profile"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Settings"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Logout"),
              onTap: () async {
                FirebaseHelper().signOutFromGoogle().then((value) {
                  Get.offAll(() => const Onboardpage());
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
