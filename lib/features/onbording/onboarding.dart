import 'package:flutter/material.dart';
import 'package:islami_app/core/init_app.dart';
import 'package:islami_app/core/theme/app_colors.dart';
import 'package:islami_app/features/layout/home_screen.dart';
import 'package:islami_app/features/onbording/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/cashing/cashing_keys.dart';

class Onboarding extends StatefulWidget {
  static const String routeName = 'onboarding';

  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController pageController = PageController();

  int current = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/images/app_logo.png"),
              Expanded(
                child: PageView(
                  onPageChanged: (index) {
                    setState(() {
                      current = index;
                    });
                  },
                  controller: pageController,
                  children: [
                    OnboardingModel(
                      image: "assets/images/onbording1.png",
                      title: "Welcome To Islmi App",
                    ),
                    OnboardingModel(
                      image: "assets/images/onbording2.png",
                      title: "Welcome To Islami",
                      des: "We Are Very Excited To Have You In Our Community",
                    ),
                    OnboardingModel(
                      image: "assets/images/onbording3.png",
                      title: "Reading the Quran",
                      des: "Read, and your Lord is the Most Generous",
                    ),
                    OnboardingModel(
                      image: "assets/images/onbording4.png",
                      title: "Bearish",
                      des: "Praise the name of your Lord, the Most High",
                    ),
                    OnboardingModel(
                      image: "assets/images/onbording5.png",
                      title: "Holy Quran Radio",
                      des:
                          "You can listen to the Holy Quran Radio through the application for free and easily",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: current != 0,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: TextButton(
                      onPressed: () {
                        prePage();
                      },
                      child: Text(
                        "Back",
                        style: TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  AnimatedSmoothIndicator(
                    activeIndex: current,
                    count: 5,
                    effect: ExpandingDotsEffect(
                      dotColor: AppColors.secondaryColor.withOpacity(0.5),
                      activeDotColor: AppColors.secondaryColor,
                      dotHeight: 8,
                      dotWidth: 8,
                    ),
                  ),

                  TextButton(
                    onPressed: () async {
                      if (current == 4) {
                        InitApp.sharedPreferences.setBool(
                          CashingKeys.showOnboarding,
                          false,
                        );
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          HomeScreen.routName,
                          (route) => false,
                        );
                      } else {
                        nextPage();
                      }
                    },
                    child: Text(
                      current == 4 ? "Finish" : "Next",
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (pageController.page?.toInt() == 4) {
      return;
    }
    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void prePage() {
    if (pageController.page?.toInt() == 0) {
      return;
    }
    pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
