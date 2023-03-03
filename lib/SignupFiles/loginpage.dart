import 'package:equalista/Globalservices/firebase_helper.dart';
import 'package:equalista/SignupFiles/role_selectpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 170,
              backgroundImage: AssetImage("assets/logo.png"),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.black38,
                  // backgroundColor: Colors.lightBlue.shade100,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Role_Selectpage()));
                     // DialogBuilder(context).showLoadingIndicator();
                  // FirebaseHelper.signInWithGoogle().then((value) {
                  //    DialogBuilder(context).hideOpenDialog();
                  //   Get.to(() => Role_Selectpage());
                  // });
                },
                child: Container(
                  width: width * 0.70,
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle_outline),
                      Text("Continue With Google",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}


class DialogBuilder {
  DialogBuilder(this.context);

  final BuildContext context;

  void showLoadingIndicator() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async => false,
            child: const AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              backgroundColor: Colors.black87,
              content: LoadingIndicator(text: 'processing'),
            ));
      },
    );
  }

  void hideOpenDialog() {
    Navigator.of(context).pop();
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({this.text = ''});

  final String text;

  @override
  Widget build(BuildContext context) {
    var displayedText = text;

    return Container(
        padding: const EdgeInsets.all(16),
        color: Colors.black87,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _getLoadingIndicator(),
              _getHeading(context),
              _getText(displayedText)
            ]));
  }

  Padding _getLoadingIndicator() {
    return const Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: SizedBox(
            width: 32,
            height: 32,
            child: CircularProgressIndicator(strokeWidth: 3)));
  }

  Widget _getHeading(context) {
    return const Padding(
        padding: EdgeInsets.only(bottom: 4),
        child: Text(
          'Please wait …',
          style: TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ));
  }

  Text _getText(String displayedText) {
    return Text(
      displayedText,
      style: const TextStyle(color: Colors.white, fontSize: 14),
      textAlign: TextAlign.center,
    );
  }
}