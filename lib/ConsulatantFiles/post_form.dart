import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equalista/ConsulatantFiles/Models/Post.dart';
import 'package:equalista/UserFiles/u_homepage.dart';
import 'package:equalista/UserFiles/u_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class Post_form extends StatefulWidget {
  const Post_form({super.key});

  @override
  State<Post_form> createState() => _Post_formState();
}

class _Post_formState extends State<Post_form> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _anonymousController = TextEditingController();
  var uuid = const Uuid();
  var anonymous = ["NO", "Yes"];
  var manageanonymicity = "NO";

  Future<void> uploadpost() async {
    var uuuid = uuid.v4();
    User? user = FirebaseAuth.instance.currentUser;
    Post npost = Post(
        post_id: uuuid,
        uid: user!.uid,
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        anonymous: manageanonymicity,
        date: DateTime.now(),
        likes: 0,
        star: 0,);
    await FirebaseFirestore.instance.collection('Posthub').doc(uuuid).set(
          npost.toMap(),
        );
    Get.snackbar("Done!", "Post uploaded successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white);

    Get.offAll(() => const U_navbar());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Your post'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Post title",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _titleController,
                          decoration: const InputDecoration(
                            hintText: "Enter the title",
                            border: OutlineInputBorder(),
                            focusColor: Colors.white10,
                            focusedBorder: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.black38,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Post Description",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          minLines: 8,
                          maxLines: 20,
                          controller: _descriptionController,
                          decoration: const InputDecoration(
                            hintText: "Enter the Post Description Here",
                            border: OutlineInputBorder(),
                            focusColor: Colors.white10,
                            focusedBorder: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.black38,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        DropdownButtonFormField(
                          items: anonymous.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              manageanonymicity = value as String;
                            });
                          },
                          value: manageanonymicity,
                          icon: const Icon(
                            Icons.arrow_drop_down_circle,
                            color: Colors.lightBlueAccent,
                          ),
                          dropdownColor: Colors.white,
                          decoration: const InputDecoration(
                            labelText: "Would you like to be anonymous?",
                            prefixIcon: Icon(
                              Icons.security,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await uploadpost();
                                }
                              },
                              child: const Text('Submit'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
