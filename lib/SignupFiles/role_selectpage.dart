import 'package:equalista/Constants/Stringconstant.dart';
import 'package:flutter/material.dart';

import '../OrganizationCreater/verifyOrganization.dart';

class Role_Selectpage extends StatefulWidget {
  const Role_Selectpage({super.key});

  @override
  State<Role_Selectpage> createState() => _Role_SelectpageState();
}

class _Role_SelectpageState extends State<Role_Selectpage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();

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
                padding: EdgeInsets.only(top: height * 0.1),
                child: Text("Welcome to \nthe ${Stringconst.appname}",
                    style: TextStyle(
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
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')));
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
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyOrganization()));
                        },
                        child: Container(
                          height: height * 0.06,
                          width: width * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:
                          const Center(child: Text("Create an Organization")),
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
