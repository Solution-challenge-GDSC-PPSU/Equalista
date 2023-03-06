import 'package:equalista/UserFiles/u_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class U_homepage extends StatefulWidget {
  const U_homepage({super.key});

  @override
  State<U_homepage> createState() => _U_homepageState();
}

class _U_homepageState extends State<U_homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Homepage'),
      ),
      drawer: U_drawer(),
      body: Container(
        child: const Center(
          child: Text('User Homepage'),
        ),
      ),
    );
  }
}