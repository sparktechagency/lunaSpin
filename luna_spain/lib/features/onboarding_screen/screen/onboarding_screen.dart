import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luna_spain/features/language/screen/language_screen.dart';
import 'package:luna_spain/features/onboarding_screen/screen/onboarding_one.dart';
import 'package:luna_spain/features/onboarding_screen/screen/onboarding_three.dart';


import 'onboarding_two.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      LanguageScreen(currentIndex: _currentIndex, controller: _pageController),
      OnboardingOne(currentIndex: _currentIndex, controller: _pageController),
      OnboardingTwo(currentIndex: _currentIndex, controller: _pageController),
      OnboardingThree(currentIndex: _currentIndex, controller: _pageController),
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemBuilder: (context, index) {
                  return pages[index];
                },
              ),
            ),

            // Buttons
          ],
        ),
      ),
    );
  }
}
