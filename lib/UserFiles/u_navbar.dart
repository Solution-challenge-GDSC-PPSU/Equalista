import 'package:equalista/UserFiles/u_homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class U_navbar extends StatefulWidget {
  const U_navbar({super.key});

  @override
  State<U_navbar> createState() => _U_navbarState();
}

class _U_navbarState extends State<U_navbar> {
  List pages = [
    const U_homepage(),
    const U_homepage(),
  ];
  int currindex = 0;
  void ontap(int index) {
    setState(() {
      currindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currindex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: ontap,
          currentIndex: currindex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}