import 'package:equalista/ConsulatantFiles/c_homepage.dart';
import 'package:equalista/ConsulatantFiles/groupmembers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class C_navbar extends StatefulWidget {
  const C_navbar({super.key});

  @override
  State<C_navbar> createState() => _C_navbarState();
}
const backgroundColor = Colors.black;
const botBackgroundColor = Colors.black;


class _C_navbarState extends State<C_navbar> {
   List pages = [
    const C_homepage(),
    Groupmember(),
    const C_homepage(),
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
            BottomNavigationBarItem(icon: Icon(Icons.group), label: "Group"),
            BottomNavigationBarItem(
                icon: Icon(Icons.wechat_outlined), label: "Chat Bot"),
          ]),
    );
  }
}