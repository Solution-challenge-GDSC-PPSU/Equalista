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

  final TextEditingController _orgnameController = TextEditingController();
  final TextEditingController _orglinkController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _phonenumController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

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
                        // !!!!!!!!!!!!!Here create dropdown to select org type!!!!!!

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _orgnameController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 16, top: 12, bottom: 12, right: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.00),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: "Enter Organization Name",
                            ),
                            style: const TextStyle(
                                fontSize: 20.0, color: Colors.black),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _orglinkController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 16, top: 12, bottom: 12, right: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.00),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: "Enter Organization Website Link",
                            ),
                            style: const TextStyle(
                                fontSize: 20.0, color: Colors.black),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    )),
              ],
            )),
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
                        // !!!!!!!!!!!!!Here create dropdown to select org type!!!!!!

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 16, top: 12, bottom: 12, right: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.00),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: "Enter Your Name",
                            ),
                            style: const TextStyle(
                                fontSize: 20.0, color: Colors.black),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _roleController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 16, top: 12, bottom: 12, right: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.00),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: "Enter Your role in organization",
                            ),
                            style: const TextStyle(
                                fontSize: 20.0, color: Colors.black),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 16, top: 12, bottom: 12, right: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.00),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: "Enter Your official email",
                            ),
                            style: const TextStyle(
                                fontSize: 20.0, color: Colors.black),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
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
            content: Container(
              child: const Text("Savan"),
            )),
      ];
}
