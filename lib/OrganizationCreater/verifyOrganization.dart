import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'OrganizationHomePage.dart';

class VerifyOrganization extends StatefulWidget {
  const VerifyOrganization({Key? key}) : super(key: key);

  @override
  State<VerifyOrganization> createState() => _VerifyOrganizationState();
}

class _VerifyOrganizationState extends State<VerifyOrganization> {
  int currentStep = 0;
  final _firstformKey = GlobalKey<FormState>();
  final _secondformKey = GlobalKey<FormState>();
  FilePickerResult? result;

  final TextEditingController _orgnameController = TextEditingController();
  final TextEditingController _orglinkController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _phonenumController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usersocialmediaController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          child: Stepper(
            type: StepperType.horizontal,
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: () {

              final isLastStep = currentStep == getSteps().length - 1;
              if (isLastStep) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrganizationHomePage()));
              } else {
                setState(() {
                  currentStep++;
                });
              }
            },
            onStepCancel: () {
              currentStep == 0
                  ? null
                  : setState(() {
                      currentStep--;
                    });
            },
            onStepTapped: (step) {
              setState(() {
                currentStep = step;
              });
            },
          ),
        ),
      ),
    ));
  }

  String selectedOrganizationtype = 'Education';
  String selectedGender = 'Male';
  var typesOfOrganization = [
    "Education",
    "Company",
  ];
  
  var gender =[
    "Male",
    "Female"
  ];


  List<Step> getSteps() => [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            title: const Text(
              // "Organization",
              "",
              style: TextStyle(fontSize: 8),
            ),
            content: Column(
              children: [
                Form(
                    key: _firstformKey,
                    child: Column(
                      children: [
                        DropdownButtonFormField(
                            items: typesOfOrganization.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (value){
                              setState(() {
                                selectedOrganizationtype = value as String;
                              });
                            },
                          value: selectedOrganizationtype,
                          icon: Icon(
                            Icons.arrow_drop_down_circle,
                            color: Colors.lightBlueAccent,
                          ),
                          dropdownColor: Colors.white,
                          decoration: InputDecoration(
                            labelText: "Select Types Organization",
                            prefixIcon: Icon(
                              Icons.school_outlined,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ),

                        SizedBox(height: 15,),
                        Padding(
                            padding: EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Organization name", textAlign: TextAlign.left, style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),),
                              SizedBox(height: 5,),
                              TextFormField(
                                controller: _orgnameController,
                                decoration: InputDecoration(
                                  hintText: "Enter the organization name",
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

                        SizedBox(height: 15,),
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Website link", textAlign: TextAlign.left, style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),),
                              SizedBox(height: 5,),
                              TextFormField(
                                controller: _orglinkController,
                                decoration: InputDecoration(
                                  hintText: "Enter the organization name",
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
                      ],
                    )),
              ],
            ),
        ),

        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: const Text(
                // "Employee"
                ""),
            content: Column(
              children: [
                Form(
                    key: _secondformKey,
                    child: Column(
                      children: [

                        SizedBox(height: 15,),
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name", textAlign: TextAlign.left, style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),),
                              SizedBox(height: 5,),
                              TextFormField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  hintText: "Enter the name",
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
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                        ),


                        SizedBox(height: 15,),
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Rol", textAlign: TextAlign.left, style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),),
                              SizedBox(height: 5,),
                              TextFormField(
                                controller: _roleController,
                                decoration: InputDecoration(
                                  hintText: "Enter the rol",
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
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                        ),


                        SizedBox(height: 15,),
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email", textAlign: TextAlign.left, style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),),
                              SizedBox(height: 5,),
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: "Enter the official email",
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
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                        ),


                        SizedBox(height: 15,),
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Phone Number", textAlign: TextAlign.left, style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),),
                              SizedBox(height: 5,),
                              TextFormField(
                                controller: _phonenumController,
                                decoration: InputDecoration(
                                  hintText: "Enter the phone number",
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
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                        ),

                        SizedBox(height: 15,),
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Socialmedia Profile", textAlign: TextAlign.left, style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),),
                              SizedBox(height: 5,),
                              TextFormField(
                                controller: _usersocialmediaController,
                                decoration: InputDecoration(
                                  hintText: "Enter the socialmedia profile link",
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
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                        ),

                        DropdownButtonFormField(
                          items: gender.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (value){
                            setState(() {
                              selectedGender = value as String;
                            });
                          },
                          value: selectedGender,
                          icon: Icon(
                            Icons.arrow_drop_down_circle,
                            color: Colors.lightBlueAccent,
                          ),
                          dropdownColor: Colors.white,
                          decoration: InputDecoration(
                            labelText: "Gender",
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            )),

        Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            title: const Text("Submit"),
            content: Column(
              children: [
                // !!!!!!!!write here code to upload Document from user!!!!!!!!!!!!!
              ],
            ),
            ),
      ];
}
