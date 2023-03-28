import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equalista/UserFiles/post_form.dart';
import 'package:equalista/UserFiles/u_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

class U_homepage extends StatefulWidget {
  const U_homepage({super.key});

  @override
  State<U_homepage> createState() => _U_homepageState();
}

class _U_homepageState extends State<U_homepage> {
  Future<void> likepost(String postid) async {
    User? user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection('Posthub')
        .doc(postid)
        .collection('likes')
        .doc(user!.uid)
        .get()
        .then((value) async {
      if (value.exists) {
        Get.snackbar("Sorry", "Already liked",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.orange,
            colorText: Colors.white);
      } else {
        await FirebaseFirestore.instance
            .collection('Posthub')
            .doc(postid)
            .collection('likes')
            .doc(user.uid)
            .set({'uid': user.uid});

        await FirebaseFirestore.instance
            .collection('Posthub')
            .doc(postid)
            .update({
          'likes': FieldValue.increment(1),
        });
      }
    });
  }

  Future<void> starpost(String postid) async {
    User? user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection('Posthub')
        .doc(postid)
        .collection('star')
        .doc(user!.uid)
        .get()
        .then((value) async {
      if (value.exists) {
        Get.snackbar("Sorry", "Already liked",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.orange,
            colorText: Colors.white);
      } else {
        await FirebaseFirestore.instance
            .collection('Posthub')
            .doc(postid)
            .collection('star')
            .doc(user.uid)
            .set({'uid': user.uid});

        await FirebaseFirestore.instance
            .collection('Posthub')
            .doc(postid)
            .update({
          'star': FieldValue.increment(1),
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      // height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
                "assets/chatBG.png"),
            fit: BoxFit.cover),
      ),
      // decoration: const BoxDecoration(
      //     image: DecorationImage(
      //         image: NetworkImage(
      //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8mqKiV-wJn9-vR4wogZBeGXH_Q1ssZR_c1UT-XcgOq3Fn2riiXzLe6Qav4cS0SKNhWgM&usqp=CAU"))),
      // // decoration: const BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.centerLeft,
      //     end: Alignment.centerRight,
      //     colors: [
      //       // Color(0xff274c77),
      //       // Color(0xfff4a259),
      //       // Colors.white,
      //     ],
      //   ),
      // ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          // shadowColor: fromHex('#F2F2F2'),
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          title: const Text(
            'User Homepage',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => const Post_form());
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        drawer: const U_drawer(),
        body: Container(
            child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Posthub').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                String title =
                    data['title'] != null ? data['title'].toString() : "";
                String description = data['description'] != null
                    ? data['description'].toString()
                    : "";
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white),
                        color: const Color(0xff272d39)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w500),
                          ),
                          const Divider(color: Colors.white12),
                          const SizedBox(height: 10),
                          Text(description,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300)),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: (() {
                                    likepost(document.id);
                                  }),
                                  icon: const Icon(Icons.thumb_up,
                                      color: Colors.white, size: 30)),
                              Text(data['likes'].toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: fromHex('#F2F2F2'),
                                      fontWeight: FontWeight.bold)),
                              IconButton(
                                  onPressed: (() {
                                    starpost(document.id);
                                  }),
                                  icon: const Icon(Icons.star,
                                      color: Colors.white, size: 30)),
                              Text(data['star'].toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: fromHex('#F2F2F2'),
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        )),
      ),
    );
  }
}
