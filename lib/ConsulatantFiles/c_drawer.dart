import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../OnboardFiles/onboard._page.dart';

class C_drawer extends StatefulWidget {
  const C_drawer({super.key});

  @override
  State<C_drawer> createState() => _C_drawerState();
}

class _C_drawerState extends State<C_drawer> {
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
                await FirebaseAuth.instance.signOut();
                
                Get.offAll(() => const Onboardpage());
              },
            ),
          ],
        ),
      ),
    );
  }
}