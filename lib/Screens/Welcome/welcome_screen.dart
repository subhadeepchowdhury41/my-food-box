import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfoodbox/Screens/Intro/GetStarted.dart';
import 'package:myfoodbox/Screens/Welcome/welcome_content.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final List<WelcomeContent> welcomeContentData = [
    WelcomeContent(
      title: "Timely Delivery of Food",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      imageUrl: "assets/images/Intro/Intro1.png",
    ),
    WelcomeContent(
      title: "Food Quality Check",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      imageUrl: "assets/images/Intro/Intro2.png",
    ),
    WelcomeContent(
      title: "Ease of Ordering",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      imageUrl: "assets/images/Intro/Intro3.png",
    ),
  ];

  PageController _controller = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                controller: _controller,
                itemBuilder: (context, index) => WelcomeContent(
                  title: welcomeContentData[index].title,
                  description: welcomeContentData[index].description,
                  imageUrl: welcomeContentData[index].imageUrl,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (currentIndex < welcomeContentData.length - 1) {
                  _controller.nextPage(
                    duration: Duration(microseconds: 300),
                    curve: Curves.ease,
                  );
                }
                else{
                  Get.to(() => const GetStarted());
                }
                // _controller.animateTo(
                //   MediaQuery.of(context).size.width,
                //   duration: Duration(microseconds: 300),
                //   curve: Curves.easeIn,
                // );
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xff006699),
                ),
                child: Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
