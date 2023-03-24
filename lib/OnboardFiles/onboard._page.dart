import 'package:equalista/SignupFiles/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model_service/Globalservices/langcontroller.dart';

class Onboardpage extends StatefulWidget {
  const Onboardpage({super.key});

  @override
  State<Onboardpage> createState() => _OnboardpageState();
}

class _OnboardpageState extends State<Onboardpage> {
  final PageController _pageController = PageController(initialPage: 0);
  int pageindex = 0;
  Lang_controller langcontroller = Get.put(Lang_controller());
  final List<Onboard> onboarddata = [
    Onboard(
      image: "assets/enq1.png",
      title: "Welcome to the Equalista".tr,
      description: "The place where you find justice and Solution".tr,
    ),
    Onboard(
      image: "assets/enq2.png",
      title: "One stop Community",
      description:
          "Interact with our active community anonymously which is always there to help",
    ),
    Onboard(
      image: "assets/enq3.png",
      title: "Expert Consulatant",
      description: "Still didn't got solution? Take help from our consultants.",
    ),
  ];

  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: const Text('Choose Your Language'),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(langcontroller.locale[index]['name']),
                        onTap: () {
                          print(langcontroller.locale[index]['name']);
                          langcontroller.updateLanguage(
                              langcontroller.locale[index]['locale']);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: langcontroller.locale.length),
            ),
          );
        });
  }

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
      backgroundColor: const Color.fromRGBO(233, 239, 253, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(233, 239, 253, 1),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                buildLanguageDialog(context);
              },
              child: const Icon(
                Icons.language,
                color: Colors.black,
                size: 26,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<Lang_controller>(
                builder: (langcontroller) => PageView.builder(
                    controller: _pageController,
                    itemCount: onboarddata.length,
                    onPageChanged: (value) {
                      setState(() {
                        pageindex = value;
                      });
                    },
                    itemBuilder: (context, index) => Onboardingtile(
                          image: onboarddata[index].image,
                          title: onboarddata[index].title.tr,
                          description: onboarddata[index].description.tr,
                        )),
              ),
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
                    backgroundColor: Colors.lightBlue,
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
    super.key,
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
        const SizedBox(
          height: 30,
        ),
        Image.asset(
          image,
          height: 300,
          width: 350,
        ),
        const SizedBox(
          height: 55,
        ),
        // const Spacer(),
        Text(title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
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
