import 'package:equalista/Constants/Stringconstant.dart';
import 'package:equalista/SignupFiles/loginpage.dart';
import 'package:equalista/SignupFiles/role_selectpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboardpage extends StatefulWidget {
  const Onboardpage({super.key});

  @override
  State<Onboardpage> createState() => _OnboardpageState();
}

class _OnboardpageState extends State<Onboardpage> {
  final PageController _pageController = PageController(initialPage: 0);
  int pageindex = 0;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboarddata.length,
                  onPageChanged: (value) {
                    setState(() {
                      pageindex = value;
                    });
                  },
                  itemBuilder: (context, index) => Onboardingtile(
                        image: onboarddata[index].image,
                        title: onboarddata[index].title,
                        description: onboarddata[index].description,
                      )),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 19,
                ),
                ...List.generate(
                    onboarddata.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Dotindication(
                            isActive: index == pageindex,
                          ),
                        )),
                const Spacer(),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: FloatingActionButton(
                    onPressed: () {
                      if (_pageController.page == 2) {
                        Get.to(() => const Loginpage());
                      }
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                    child: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

class Dotindication extends StatelessWidget {
  final bool isActive;
  const Dotindication({
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive ? 22 : 8,
      width: 4,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard(
      {required this.image, required this.title, required this.description});
}

final List<Onboard> onboarddata = [
  Onboard(
    image: "assets/enq1.png",
    title: "Welcome to \nthe ${Stringconst.appname}",
    description:
        "We are here to help you find the best \nproducts for your skin type",
  ),
  Onboard(
    image: "assets/enq1.png",
    title: "One stop Community",
    description:
        "We are here to help you find the best \nproducts for your skin type",
  ),
  Onboard(
    image: "assets/enq1.png",
    title: "Expert Consulatant",
    description:
        "We are here to help you find the best \nproducts for your skin type",
  ),
];

class Onboardingtile extends StatelessWidget {
  final String image, title, description;
  const Onboardingtile({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 300,
          width: 300,
        ),
        const Spacer(),
        Text(title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            )),
        const SizedBox(
          height: 10,
        ),
        Text(description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
            )),
        const Spacer(),
      ],
    );
  }
}
