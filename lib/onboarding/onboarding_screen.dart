import 'package:flutter/material.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/onboarding/dot_indicator.dart';
import 'package:islami_app/onboarding/onboarding_model.dart';
import 'package:islami_app/utils/images.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int currentIndex = 0;
  List<OnboardingModel> onboardingList = [
    OnboardingModel(
      imagePath: AppAssets.screen1,
      title: 'Welcome To Islmi App',
    ),
    OnboardingModel(
      imagePath: AppAssets.screen2,
      title: 'Welcome To Islami',
      description: 'We Are Very Excited To Have You In Our\n Community',
    ),
    OnboardingModel(
      imagePath: AppAssets.screen3,
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),
    OnboardingModel(
      imagePath: AppAssets.screen4,
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most\n High',
    ),
    OnboardingModel(
      imagePath: AppAssets.screen5,
      title: 'Holy Quran Radio',
      description:
          'You can listen to the Holy Quran Radio\n through the application for free and easily',
    ),
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      currentIndex = _pageController.page!.toInt();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0x99202020),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('assets/image/islami_logo.png'),
            SizedBox(height: size.height * 0.03),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        onboardingList[index].imagePath,
                        height: size.height * 0.45,
                      ),
                      Text(
                        onboardingList[index].title,
                        style: TextStyle(
                          color: Color(0xffe2be7f),
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.04,
                          left: size.height * 0.02,
                          right: size.height * 0.02,
                        ),
                        child: SizedBox(height: size.height * 0.03),
                      ),
                      if (onboardingList[index].description != null)
                        Text(
                          onboardingList[index].description!,
                          style: TextStyle(
                            color: Color(0xffe2be7f),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                    ],
                  );
                },
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: currentIndex != 0
                          ? () {
                              _pageController.animateToPage(
                                currentIndex - 1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.bounceInOut,
                              );
                            }
                          : null,
                      child: Text(
                        currentIndex != 0 ? "Back" : " ",

                        style: TextStyle(
                          color: Color(0xffe2be7f),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (currentIndex == 4) {
                          Navigator.pushReplacementNamed(
                            context,
                            HomeScreen.routeName,
                          );
                        } else {
                          _pageController.animateToPage(
                            currentIndex + 1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.bounceInOut,
                          );
                        }
                      },
                      child: Text(
                        currentIndex != 4 ? "Next" : "Finish",

                        style: TextStyle(
                          color: Color(0xffe2be7f),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DotIndicator(active: currentIndex == 0),
                    DotIndicator(active: currentIndex == 1),
                    DotIndicator(active: currentIndex == 2),
                    DotIndicator(active: currentIndex == 3),
                    DotIndicator(active: currentIndex == 4),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
