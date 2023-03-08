import 'package:equalista/ConsulatantFiles/c_drawer.dart';
import 'package:equalista/ConsulatantFiles/post_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

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
        title: const Text('Homepage'),
      
      ),
      drawer: const C_drawer(),
      body: Container(
        child: const Center(
          child: Text('Homepage'),
        ),
      ),
    );
  }
}
