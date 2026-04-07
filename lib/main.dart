import 'package:flutter/material.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/onboarding/onboarding_screen.dart';
import 'package:islami_app/utils/app_routes.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onboardingRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.onboardingRouteName: (context) => OnboardingScreen(),
      },
    );
  }
}
