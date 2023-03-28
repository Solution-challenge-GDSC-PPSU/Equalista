import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equalista/ConsulatantFiles/c_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Groupmember extends StatefulWidget {
  const Groupmember({super.key});

  @override
  State<Groupmember> createState() => _GroupmemberState();
}

class _GroupmemberState extends State<Groupmember> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDAF5FF),
      appBar: AppBar(
        title: Text("Group Members"),
        backgroundColor: Color(0xffDAF5FF),
      ),
      drawer: const C_drawer(),
      body:StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Organization').doc('ppsu').collection('Group').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return ListTile(
                leading: Image.network(document['ProfilePic']),
                title: Text(document['Name']),
                subtitle: Text(document['Email']),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('Organization')
                        .doc('ppsu')
                        .collection('Group')
                        .doc(document.id)
                        .delete();
                  },
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}