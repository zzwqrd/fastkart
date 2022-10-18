import 'package:fastkart_app/screens/auth/login_screen/view.dart';
import 'package:fastkart_app/screens/auth/sign_up_screen/view.dart';
import 'package:fastkart_app/screens/home_screen/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/icons/logo.png',
      title: 'Get Safe Delivery At Your Door Step',
      body: 'Online Supermarket for all your daily needs. you are just One Click away from your all needs at your door step.',
    ),
    BoardingModel(
      image: 'assets/icons/logo.png',
      title: 'Get Safe Delivery At Your Door Step',
      body: 'Online Supermarket for all your daily needs. you are just One Click away from your all needs at your door step.',
    ),
    BoardingModel(
      image: 'assets/icons/logo.png',
      title: 'Get Safe Delivery At Your Door Step',
      body: 'Online Supermarket for all your daily needs. you are just One Click away from your all needs at your door step.',
    ),
  ];

  final boardiControler = PageController();

  bool isList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                'assets/icons/onboarding.jpg',
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: PageView.builder(
                controller: boardiControler,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isList = true;
                    });
                  } else {
                    setState(() {
                      isList = false;
                    });
                  }
                },
                itemCount: boarding.length,
                itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: boardiControler,
                    count: boarding.length,
                    effect: const ExpandingDotsEffect(
                      dotColor: Color(0xFFD1E1DE),
                      activeDotColor: Color(0xFF43BDA7),
                      dotHeight: 5,
                      dotWidth: 8,
                      expansionFactor: 4,
                      spacing: 5,
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(color: const Color(0xFF43BDA7), borderRadius: BorderRadius.circular(5)),
                      alignment: Alignment.center,
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: Color(0xFF0baf9a),
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        "?Already have an Account",
                        style: TextStyle(
                          color: Color(0xFF777777),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                '${model.image}',
                width: 100,
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                '${model.title}',
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF222222),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                '${model.body}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w900, color: Color(0xFF777777), height: 1.7),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BoardingModel {
  final String? image;
  final String? title;
  final String? body;

  BoardingModel({this.image, this.title, this.body});
}
