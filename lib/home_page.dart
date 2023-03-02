import 'package:equalista/Globalservices/firebase_helper.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override

  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 170,
                  backgroundImage: AssetImage("images/logo.png"),
                ),
                SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.black38,
                    // backgroundColor: Colors.lightBlue.shade100,
                  ),
                    onPressed: (){
                    FirebaseHelper.signInWithGoogle();
                    },
                    child: Container(
                      width: width * 0.70,
                       height: 45,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Icon(Icons.add_circle_outline),
                         Text("Continue With Google", textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
                         ],
                    ),
                    ) )
              ],
            ),
          ),
        ));
  }
}
