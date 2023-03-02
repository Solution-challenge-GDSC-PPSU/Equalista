import 'package:flutter/material.dart';

import 'OrganizationHomePage.dart';

class VerifyOrganization extends StatefulWidget {
  const VerifyOrganization({Key? key}) : super(key: key);

  @override
  State<VerifyOrganization> createState() => _VerifyOrganizationState();
}

class _VerifyOrganizationState extends State<VerifyOrganization> {

  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stepper(
            type: StepperType.horizontal,
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: (){
              final isLastStep = currentStep == getSteps().length -1;
              if(isLastStep){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OrganizationHomePage()));
              }else{
              setState(() {
                currentStep++;
              });}
            },
            onStepCancel: (){
              currentStep == 0 ? null: setState(() { currentStep--; });
            },
            onStepTapped: (step){
              setState(() {
                currentStep = step;
              });
            },
          ),
        )
        );
  }


  List<Step> getSteps()=>[
    Step(
      state: currentStep > 0 ? StepState.complete : StepState.indexed,
      isActive: currentStep >=0,
        title: Text("Organization"),
        content: Container(
          child: Text("Savan"),
        )
    ),
    Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >=1,
        title: Text("Employee"),
        content: Container(
          child: Text("Gangani"),
        )
    ),
    Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >=2,
        title: Text("Submit"),
        content: Container(
          child: Text("Savan"),
        )
    ),
  ];
}
