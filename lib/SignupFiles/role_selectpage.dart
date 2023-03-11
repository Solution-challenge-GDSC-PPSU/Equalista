import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equalista/ConsulatantFiles/c_navbar.dart';
import 'package:equalista/UserFiles/u_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model_service/Globalservices/langcontroller.dart';
import '../OrganizationCreater/verifyOrganization.dart';

class Role_Selectpage extends StatefulWidget {
  const Role_Selectpage({super.key});

  @override
  State<Role_Selectpage> createState() => _Role_SelectpageState();
}

class _Role_SelectpageState extends State<Role_Selectpage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();
  final orgdbref = FirebaseFirestore.instance.collection('Organization');
  Lang_controller langcontroller = Get.put(Lang_controller());

  Future<void> joinorganization() async {
    User? user = FirebaseAuth.instance.currentUser;
    var orgcode = _codeController.text;
    var admin = await orgdbref.doc(orgcode).get();
    String myemail = user!.email.toString();
    if (admin['Other_Email'] == myemail) {
      Get.snackbar("Welcome", "You are the admin of this organization",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white);

      Get.to(() => const C_navbar());
    } else {
      var userdata =
          await orgdbref.doc(orgcode).collection("Group").doc(user.uid).get();
      if (userdata.exists) {
        print("User already exists");
        Get.snackbar(
          "Welcome again",
          "already joined",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
        );
        Get.to(() => const U_navbar());
      } else {
        print("User does not exists");
        await orgdbref.doc(orgcode).collection("Group").doc(user.uid).set({
          "Name": user.displayName,
          "Email": user.email,
          "Role": "Member",
          "ProfilePic": user.photoURL,
          "uid": user.uid,
        });
        Get.to(() => const U_navbar());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.1, right: 8, left: 8),
                child: Text("Welcome to the Equalista".tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.2),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: _codeController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 16, top: 12, bottom: 12, right: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.00),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: "Enter Organization Code",
                              ),
                              style: const TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            )),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      InkWell(
                        onTap: () async {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>C_navbar()));
                          if (_formKey.currentState!.validate()) {
                            await joinorganization();
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //         content: Text('Processing Data')));
                          }
                        },
                        child: Container(
                          height: height * 0.06,
                          width: width * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text("Join Organization")),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        child: const Text("OR"),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const VerifyOrganization()));
                        },
                        child: Container(
                          height: height * 0.06,
                          width: width * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                              child: Text("Create an Organization")),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
