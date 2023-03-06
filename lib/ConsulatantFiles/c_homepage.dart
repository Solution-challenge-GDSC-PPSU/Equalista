import 'package:equalista/ConsulatantFiles/c_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class C_homepage extends StatefulWidget {
  const C_homepage({super.key});

  @override
  State<C_homepage> createState() => _C_homepageState();
}

class _C_homepageState extends State<C_homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      drawer: C_drawer(),
      body: Container(
        child: Center(
          child: Text('Homepage'),
        ),
      ),
    );
  }
}