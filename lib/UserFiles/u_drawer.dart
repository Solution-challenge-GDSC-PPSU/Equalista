import 'package:equalista/Model_service/Globalservices/firebase_helper.dart';
import 'package:equalista/OnboardFiles/onboard._page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class U_drawer extends StatefulWidget {
  const U_drawer({super.key});

  @override
  State<U_drawer> createState() => _U_drawerState();
}

class _U_drawerState extends State<U_drawer> {
  static final GoogleSignIn googleSignIn = GoogleSignIn();
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffced4da),
      child: Container(
        // color: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  CircleAvatar(
                    maxRadius: 40,
                    child: Image.network(user!.photoURL!),
                  ),
                  Text(user!.email!),
                  Text(user!.displayName!.toUpperCase())
                ],
              ),
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
